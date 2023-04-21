vim.cmd[[
let g:db_ui_use_nerd_fonts = 1

func! DBExe(...)
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    endif

    let sel_save = &selection
    let &selection = 'inclusive'
    let reg_save = @@

    if a:1 == 'char'
        silent exe 'normal! gvy'
    elseif a:1 == 'line'
        silent exe "normal! '[V']y"
    else
        silent exe 'normal! `[v`]y'
    endif

    execute 'DB ' . @@

    let &selection = sel_save
    let @@ = reg_save
endfunc

let g:dbs = {
\}

let g:db = ""

func! DBSelected(selected)
    if a:selected != ""
        let b:db = g:dbs[a:selected]
        echo 'DB ' . a:selected . ' is selected'
    endif
endfunc

command! DBSelect :call popup_menu#open(
    \keys(g:dbs),
    \{db -> DBSelected(db)},
    \{
        \'relative': 'editor',
        \'width': 80,
        \'height': 20,
        \'col': (&columns/2) - 40,
        \'row': (&lines/2) - 10
    \}
\)
]]
