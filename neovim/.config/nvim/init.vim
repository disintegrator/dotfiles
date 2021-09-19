function Src(path)
	exec 'source' a:path
endfunction

function SrcCfg(path)
	call Src(stdpath('config') . '/' . a:path)
endfunction

call SrcCfg('plugins.vim')
call SrcCfg('functions.vim')
call SrcCfg('settings.vim')
call SrcCfg('keys.vim')
call SrcCfg('airline.vim')
call SrcCfg('hop.vim')
call SrcCfg('tree.vim')
call SrcCfg('fzf.vim')
call SrcCfg('coc.vim')
call SrcCfg('go.vim')
call SrcCfg('ale.vim')

