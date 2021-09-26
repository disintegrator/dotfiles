function SrcCfg(path)
	let root = stdpath('config')
	exec 'source' . root . '/' . a:path
endfunction

call SrcCfg('pre.vim')
call SrcCfg('plugins.vim')
call SrcCfg('settings.vim')
call SrcCfg('keys.vim')

