Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "run_with_UI_access.bat"
oShell.Run strArgs, 0, false