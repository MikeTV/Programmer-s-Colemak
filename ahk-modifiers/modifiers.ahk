;
; 2017-10-09 miketv
; Using the space bar as a modifier enabling a second layer with home-row shortcuts to characters commonly used when programming
; Works fine side-by-side with PKL Colemak script.
; Using a separate AHK script rather than piggybacking off of PKL in order to be able to fine-tune the delay, which will hopefully reduce unintended symbols in typed text.
; IMPORTANT: Must be compiled with EnableUIAccess
; 
; FIXME: Space-Ctrl-{Key} works, but Ctrl-Space-{Key} doesn't.
;

$Space::
	KeyWait,Space,T0.10 ; Delay before the modifier takes effect, in seconds.  Lower = More likely to trigger accidentally  Higher = must wait longer after holding space before pressing second key
					   ; T0.2  So far no mistake modifiers, but quite often too quick and normal key gets through instead of modifier
					   ; T0.15 Better, but same as above
					   ; T0.10 findingit hardtotypespaces!!!
					   ; T0.12 still rather hard totypespaces
					   ; T0.15 Again WIP
					   ; TODO: Need some way of registering whether another key was pressed or not?
					   ; T0.10 + Send space on no hotkey WIP
	If (ErrorLevel){
		HotkeyPressed:=false
		HotkeysEnabled:=true
		KeyWait,Space
		HotkeysEnabled:=false
		If (!HotkeyPressed){
			Send {Space}	
		}else{
			
		}
		;MsgBox, %HotkeyPressed%

	}else
		Send {Space}	
Return
#If HotkeysEnabled

; For future reference: This may be useful.  Uncomment both lines to introduce a hotstring, auto-replaced when typing multiple characters while holding space.
; May need to account for second layer values
;#Hotstring *
;::tran::BEGIN TRANSACTION


; Up and down use SendPlay so this will work with OneNote
;1::MyFunc("***",0)
;2::
;3::
;4::
;5::
;6::
7::MyFunc("{Home}",0)

; TODO: Use SendPlay so this will work with OneNote
8::MyFunc("{Up}",1)
9::MyFunc("{End}",0)
0::MyFunc("{PgUp}",0)

;q::
;w::
;e::
;r::
;t::
;y::
u::MyFunc("{Left}",0)


i::MyFunc("{Down}", 1)
o::MyFunc("{Right}", 0)
p::MyFunc("{PgDn}",0)

a::MyFunc("[",0)
s::MyFunc("]",0)
d::MyFunc("{{}",0)
f::MyFunc("{}}",0)
g::MyFunc("=",0)
h::MyFunc("{!}",0)
j::MyFunc("(",0)
k::MyFunc(")",0)
l::MyFunc("<",0)
`;::MyFunc(">",0)

;z::
;x::
;c::
;v::
;b::
;n::
;m::

#If

MyFunc(key, sendplay){
  global HotkeyPressed
  HotkeyPressed=true
  if(sendplay){ 
	SendPlay %key%
  }
  else{ 
	Send %key%
  }
  
  ;MsgBox, %HotkeyPressed%
}