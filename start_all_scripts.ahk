; 在 start_all_script.ahk 中
global credentialsRead := true
FileRead, credentials, credentials.txt

; 解析凭证数据
Loop, parse, credentials, `n, `r
{
    if A_LoopField
    {
        keyValue := StrSplit(A_LoopField, "=")
        if keyValue[1] = "windows_username"
            windows_username := keyValue[2]
        else if keyValue[1] = "windows_password"
            windows_password := keyValue[2]
		else if keyValue[1] = "sso_username"
            sso_username := keyValue[2]
        else if keyValue[1] = "sso_password"
            sso_password := keyValue[2]	
    }
}

; 包含 windows_login.ahk 脚本
#Include windows_login.ahk

; 包含 sso_login.ahk 脚本
#Include sso_login.ahk

; 包含 hotstrings.ahk 脚本
#Include hotstrings.ahk

; 包含 auto_click.ahk 脚本
#Include auto_click.ahk

return
