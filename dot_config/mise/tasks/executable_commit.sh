#!/usr/bin/env bash

#MISE description="Create a commit with a generated title and body"
#MISE dir="{{ cwd }}"

#USAGE flag "-t --type <type>" help="The type of the commit" {
#USAGE   choices "feat" "fix" "chore" "mig"
#USAGE }
#USAGE arg "[notes]" help="Additional notes to pass to the claude prompt"

# Find nearest .git and cd to its parent
git_root=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z "$git_root" ]; then
  echo "Error: Not in a git repository" >&2
  exit 1
fi
cd "$git_root" || exit 1

commit_type=${usage_type:?"Please provide a commit type using --type <type>"}

notes_section=""
if [ -n "${usage_notes:-}" ]; then
  notes_section="

Additional notes to take into account:

    ${usage_notes}"
fi

exec claude --permission-mode auto -p "
Look at staged changes and create a commit following this format:

    ${commit_type}(<scope>): <title>

    <body>
${notes_section}
Finally print the commit message to stdout.
"
