syn match typ /\w\+/
hi typ ctermfg=gray


syn match bnf_name /^\w\+\(.*::=\)\@=/
syn match bnf_name /\(pdef\s\+\)\@<=\w\+/
hi bnf_name ctermfg=blue



syn match deco /@.*/
hi deco ctermfg=245

syn include @REG syntax/regex.vim
"syn region regex start=/\// skip=/\\\// end=/\/[a-z0-9]*/ contains=@REG
syn region regex start=/\// skip=/\\\// end=/\// contains=@REG
hi regex ctermfg=144


syn match bnf_inherit /\w\+\((.*\)\@<=\(.*)\)\@=\(.*::=\)\@=/
hi bnf_inherit ctermfg=245

syn match cls /\(->.*\)\@<=[A-Z]\w*/
hi cls cterm=bold ctermfg=135

syn match name /\w\+\(:\)\@=/
hi name ctermfg=166
"syn match typ /\(:\)\@<=\w\+/




syn match bnf_assign /::=/
"hi typ ctermfg=gray
syn match Comment /#.*/
syn match paren /(\|)/
syn match comma /,/
hi paren ctermfg=245
hi comma ctermfg=245
syn match bracket /\[\|]/
syn match pipe /|/
syn match arrow /->/
syn match quote /".\{-}"/
hi quote ctermfg=144



syn match macro /\<[A-Z_][A-Z_]\+\>\((\)\@=/
syn match macrodef /\<[A-Z_][A-Z_]\+\>\(.*::=\)\@=/
hi macro ctermfg=magenta
hi macrodef ctermfg=magenta cterm=bold


syn match pdef_header1 /^pdef\>/
hi link pdef_header1 Keyword
syn match pdef_header2 /\(^pdef\s\+\)\@<=[A-Za-z_]\+/
hi link pdef_header2 Function
syn include @PY syntax/python.vim
syn region pdef start=/\(^pdef\s\+[A-Za-z_]\+\)\@<=(/ end=/^\(\s\|#\|$\)\@!/ contains=@PY

