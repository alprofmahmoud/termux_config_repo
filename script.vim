

"echo "helloworld"
"echon "hello"
"echomsg "Hello Prof"
"echohl Folded
"highligt Name guifg=color guibg=color gui=attribute
":h attr-list # attribute list

"highlight hello guibg=red gui=bold
"highlight world guifg=blue

"echohl hello
"echo "hello" user

"echohl hello
"echo " "

"echohl Search guifg=
"echo "world"

" variable in nvim

"let user="Mahmoud"   set varisbles
"echo "hello" user

"let number = 5
"echo number
"let number = number + 5
"echo number

"echo exists('anumber')

"echo &textwidth
"let &textwidth = 80
"echo &textwidth
"
"if condition

let number="h"
if number > 0
	echo "number thin 0"
elseif number < 0
	echo "number less 0"
elseif number == 0
	echo "number equal 0"
else
	echo "unknown"
endif

let plus = 10 + 3
let minus = 10 - 3
let multiply = 10 * 3
let divide = 10.0 / 3
let modulo = 10 % 2

"echo plus
"echo minus
"echo multiply
"echo float2nr(divide)
"echo modulo

