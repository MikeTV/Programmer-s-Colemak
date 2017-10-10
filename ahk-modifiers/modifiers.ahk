;
; 2017-10-09 miketv
; Using the space bar as a modifier enabling a second layer with home-row shortcuts to characters commonly used when programming
; Works fine side-by-side with PKL Colemak script.
; Using a separate AHK script rather than piggybacking off of PKL in order to be able to fine-tune the delay, which will hopefully reduce unintended symbols in typed text.
; 
; FIXME: Space-Ctrl-{Key} works, but Ctrl-Space-{Key} doesn't.
;

$Space::
	KeyWait,Space,T0.2 ; Delay before the modifier takes effect, in seconds.  Lower = More likely to trigger accidentally  Higher = must wait longer after holding space before pressing second key
	If (ErrorLevel){
		HotkeysEnabled:=true
		KeyWait,Space
		HotkeysEnabled:=false
	}else
		Send {Space}	
Return
#If HotkeysEnabled

; For future reference: This may be useful.  Uncomment both lines to introduce a hotstring, auto-replaced when typing multiple characters while holding space.
; May need to account for second layer values
;#Hotstring *
;::tran::BEGIN TRANSACTION

;1::
;2::
;3::
;4::
;5::
;6::
7::Home

; TODO: Use SendPlay so this will work with OneNote
8::Up
9::End
0::PgUp

;q::
;w::
;e::
;r::
;t::
;y::
u::Left

; TODO: Use SendPlay so this will work with OneNote
i::Down
o::Right
p::PgDn

a::[
s::]
d::{
f::}
g::=
h::!
j::(
k::)
l::<
`;::>

;z::
;x::
;c::
;v::
;b::
;n::
;m::

#If