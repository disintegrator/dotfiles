#!/usr/bin/env bash

#MISE dir="{{cwd}}"
#MISE hide=true
#MISE quiet=true

#USAGE flag "--name <name>" help="Repo name to use when the git remote URL cannot be resolved"
#USAGE flag "--force" help="Overwrite plansDirectory/autoMemoryDirectory if already set"

set -euo pipefail

if [ -z "${BRAIN:-}" ]; then
  echo "Error: BRAIN environment variable is not set" >&2
  exit 1
fi

if ! jq --version >/dev/null 2>&1; then
  echo "Error: jq is required but not installed" >&2
  exit 1
fi

remote_url=$(git remote get-url origin 2>/dev/null || true)
if [ -n "$remote_url" ]; then
  # Normalize to <host>/<owner>/<repo>: strip scheme, user@, ssh colon, .git suffix
  repo_id=$(printf '%s' "$remote_url" | sed -E 's#^[a-zA-Z+]+://##; s#^[^@/]+@##; s#:#/#; s#\.git$##; s#/+$##')
else
  repo_id=${usage_name:-}
fi

if [ -z "$repo_id" ]; then
  echo "Error: could not resolve repo URL from git remote 'origin'; pass --name <name>" >&2
  exit 1
fi

plans_dir="$BRAIN/$repo_id/planning"
memory_dir="$BRAIN/$repo_id/memory"

mkdir -p .claude
settings=.claude/settings.local.json
if [ ! -s "$settings" ]; then
  echo '{}' >"$settings"
fi

existing=$(jq -r '[.plansDirectory, .autoMemoryDirectory] | map(select(. != null)) | join(", ")' "$settings")
if [ -n "$existing" ] && [ "${usage_force:-false}" != "true" ]; then
  echo "Error: $settings already sets: $existing" >&2
  echo "Re-run with --force to overwrite" >&2
  exit 1
fi

mkdir -p "$plans_dir" "$memory_dir"

tmp=$(mktemp)
jq --arg plans "$plans_dir" --arg memory "$memory_dir" \
  '.plansDirectory = $plans | .autoMemoryDirectory = $memory' \
  "$settings" >"$tmp"
mv "$tmp" "$settings"

echo "Updated $settings"
if [ -n "$existing" ]; then
  echo "Overwrote previous values: $existing"
fi
echo "  plansDirectory:      $plans_dir"
echo "  autoMemoryDirectory: $memory_dir"
