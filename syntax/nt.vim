"syntax match FooKey   /^[^=]\+/
"syntax match FooValue /[^=]\+$/


"note: NEVER escape a '[' inside a [] set. if you do this with \[ you will
"actually just be including both '\' and '[' in the set. you DO need to escape
"a ']' of course otherwise it would end the set



syntax match qmark /^\s*?.*/
syntax match quote  /".\{-}"/
syntax match comment /^\s*#.*/
syntax match comment /^\s*>>.*/
syntax match imp    /^\s*!.*/
syntax match emph   /\*.\{-}\*/
syntax match bigemph   /\*\*.\{-}\*\*/
syntax match todo /TODO.*/
syntax match todo_smol /[Tt]odo/
syntax match h3 /^\s*=.\{-}=\s*$/
syntax match h2 /^\s*==.\{-}==\s*$/
syntax match h1 /^\s*===.\{-}===\s*$/
syntax match code /^\s*:.*/
syntax match code /__.\{-}__/

syntax match num /\d\+/
syntax match list /\(^\|\s\)[[(]\=[a-zA-Z0-9][\])]/
"syntax match list /[A-Z0-9]\.\s/
syntax match goback /\*>>.*/
syntax match time /\d\+\(\.\d\+\)\=hr\=/
syntax match time /\d\+m\(in\)\=/
syntax match nocolor /^\\/
syntax match whilerun /\V[insim]/
syntax match cuda /\c@cuda/

syntax match comment /^\s+\/\/.*/



syntax region code_region start=/^\s*\\\$.*$/ end=/^\s*\\\$.*$/


syntax include @CPP syntax/cpp.vim
syntax region cppSnip matchgroup=Snip start="@cpp@" end="@end@" contains=@CPP

syntax include @RS syntax/rust.vim
syntax region rsSnip matchgroup=Snip2 start="@rust@" end="@end@" contains=@RS

syntax include @C syntax/c.vim
syntax region cSnip matchgroup=Snip3 start="@c@" end="@end@" contains=@C

syntax include @PY syntax/python.vim
syntax region pySnip matchgroup=Snip4 start="@python@" end="@end@" contains=@PY

