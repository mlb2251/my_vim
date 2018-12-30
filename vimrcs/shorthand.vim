
"function! Slim()
inoremap <c-s> <esc>:call Send()<cr>
nnoremap <c-s> :call Send()<cr><esc>
"endfunction

"VERY clever. using :read! cat mypipe instead of :read mypipe
"bc read! reads the output of a command like cat, whereas :read
"is supposed to read from the pipe but it fails and you have to
"send everything twice and its messed up. so this is much better.
"i guess this is a lesson in using bash stuff to interact with 
"external things like pipes and then just taking the raw output from
"those using things like read! instead of read

function! Send()
    "normal mp
    let old_yank=@0
    let old_unnamed=@"
    execute ".delete a"
    "remove newline
    let @a=substitute(@a,"\n","","")
    let @a=substitute(@a,"'","{slim_singlequote}","")
    let line="'".getpid() . " " . @a . "'"
    echom line
    execute ":silent !echo ".line." > ~/shorthand/runtime/toserver"
    "reset yank and unnamed registers to original values
    let @0=old_yank
    let @"=old_unnamed
    let @b=system("cat ~/shorthand/runtime/pipes/" . getpid())
    "echom strpart(@b,0,1)
    if strpart(@b,0,1) == ":"
        normal O
        startinsert
        redraw!
        execute "echom '" . @b . "'"
    else
        execute "-1put b"
        "now position cursor properly
        execute "normal! ?({ins})\<cr>"
        normal dab
        "(type the key 'a' to append)
        execute "call feedkeys('a', 'n')"
        redraw!
    endif
endfunction

function! Connect()
    echo "sending connect request"
    execute ":silent !mkfifo ~/shorthand/runtime/pipes/" . getpid()
    execute ":silent !echo '".getpid()." connect ". expand('%:p') ."' > ~/shorthand/runtime/toserver"
    "execute ":silent ! cat ~/shorthand/runtime/pipes/" . getpid()
    echo system("cat ~/shorthand/runtime/pipes/" . getpid())
    redraw!
endfunction    

function! Disconnect()
    execute ":silent !echo '".getpid()." disconnect' > ~/shorthand/runtime/toserver"
    execute ":silent read! cat ~/shorthand/runtime/pipes/" . getpid()
    execute ":silent ! /bin/rm ~/shorthand/runtime/pipes/" . getpid()
    redraw!
endfunction

function! Process(line)
    echo "hi"
endfunction


