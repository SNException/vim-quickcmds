if exists('g:quick_cmd1')
    let g:quick_cmd1 = g:quick_cmd1
else
    let g:quick_cmd1   = "make"
endif

if exists('g:quick_cmd2')
    let g:quick_cmd2 = g:quick_cmd2
else
    let g:quick_cmd2   = "make run"
endif

if exists('g:quick_cmd3')
    let g:quick_cmd3 = g:quick_cmd3
else
    let g:quick_cmd3   = "git status"
endif

if exists('g:async')
    let g:async = g:async
else
    let g:async = '1'
endif

if exists('g:quickcmds_key1')
    let g:quickcmds_key1 = g:quickcmds_key1
else
    let g:quickcmds_key1 = '<leader>qq'
endif

if exists('g:quickcmds_key2')
    let g:quickcmds_key2 = g:quickcmds_key2
else
    let g:quickcmds_key2 = '<leader>qw'
endif

if exists('g:quickcmds_key3')
    let g:quickcmds_key3 = g:quickcmds_key3
else
    let g:quickcmds_key3 = '<leader>qe'
endif

function! RunCmdCommandInTerminal(command, buffername) abort
    if !has('win32')
        echon "This functionality only works on Windows."
        return
    endif

    if !has('terminal')
        echon "Your Vim does not have the internal Terminal."
        return
    endif

    let prev_term_buf_id = bufnr(a:buffername)
    if prev_term_buf_id != -1
        execute 'bd! ' . prev_term_buf_id
    endif

    set termwinsize=16x0
    execute 'below terminal cmd /c' . a:command
    exe "f "  a:buffername
endfunction

function! ExecCmd(command) abort
    if g:async == '1'
        call RunCmdCommandInTerminal(a:command, "Quick-Command-Buffer")
    else
        execute '!'.a:command
    endif
endfunction

execute 'nnoremap '.quickcmds_key1.' :call ExecCmd(g:quick_cmd1)<CR>'
execute 'nnoremap '.quickcmds_key2.' :call ExecCmd(g:quick_cmd2)<CR>'
execute 'nnoremap '.quickcmds_key3.' :call ExecCmd(g:quick_cmd3)<CR>'
