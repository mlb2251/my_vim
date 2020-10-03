syn match cls /\(^\s*|\?\s*\)\@<=[A-Z]\w*/
hi cls cterm=bold ctermfg=135

syn match name /\w\+\(:\)\@=\((.*\)\@<=\(.*)\)\@=/
hi name ctermfg=166
syn match typ /\(:\)\@<=\w\+\((.*\)\@<=\(.*)\)\@=/
hi typ ctermfg=gray
syn match Comment /#.*/



