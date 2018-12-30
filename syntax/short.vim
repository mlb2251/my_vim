
syntax match dollar /\$\<\h\w*\>/
syntax match amper /&\{1,2}\<\h\w*\>/
syntax match special /\(+ \|* \|?\d*\)/
syntax match escaped /\\[nt]/
syntax match arrow /->/
syntax match comment /^\s*#.*/
syntax match brace_paren /[(){}[\]]/
syntax match ins /({ins})/
syn match squot /'.\{-}'/
syn match esc_paren /\\[()]/
"for coloring careful bc if a ' ' space consumes a regex you cant have an
"adjacent regex that uses the same space bc then it would technically be
"colored a different color (even tho its space so you can't tell


