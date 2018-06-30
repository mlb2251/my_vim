"VERY clever. using :read! cat mypipe instead of :read mypipe
"bc read! reads the output of a command like cat, whereas :read
"is supposed to read from the pipe but it fails and you have to
"send everything twice and its messed up. so this is much better.
"i guess this is a lesson in using bash stuff to interact with 
"external things like pipes and then just taking the raw output from
"those using things like read! instead of read

function! Send()
    let old_yank=@0
    let old_unnamed=@"
    execute ".yank a"
    "remove newline
    let @a=substitute(@a,"\n","","")
    let line="'".getpid() . " " . @a . "'"
    execute ":silent !echo ".line." > ~/shorthand/runtime/toserver"
    "execute ":silent read! cat ~/shorthand/runtime/pipes/" . getpid()
    "reset yank and unnamed registers to original values
    let @0=old_yank
    let @"=old_unnamed
    execute ":silent read! cat ~/shorthand/runtime/pipes/" . getpid()
endfunction

function! Connect()
    echo "sending connect request"
    execute ":silent !mkfifo ~/shorthand/runtime/pipes/" . getpid()
    echo "made pipe: " . getpid()
    execute ":silent !echo '".getpid()." connect ". expand('%:p') ."' > ~/shorthand/runtime/toserver"
    echo "sent connection request"
    execute ":silent read! cat ~/shorthand/runtime/pipes/" . getpid()
    echo "read response"
endfunction    

function! Disconnect()
    echo "sending disconnect request"
    execute ":silent !echo '".getpid()." disconnect' > ~/shorthand/runtime/toserver"
    execute ":silent read! cat ~/shorthand/runtime/pipes/" . getpid()
    echo "read response"
    execute ":silent ! /bin/rm ~/shorthand/runtime/pipes/" . getpid()
    echo "removed pipe: " .getpid()
endfunction
