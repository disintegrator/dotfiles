function SrcCfg(path)
	let root = expand('%:p:h')
	exec 'source' . root . '/' . a:path
endfunction

call SrcCfg('plugins.vim')
call SrcCfg('settings.vim')
call SrcCfg('keys.vim')

