if (!credentialsRead) {
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
		}
	}
}

; 监听 Ctrl + ~ 按键组合
^`::  ; 这表示 Ctrl + ~
    ; 清空当前输入框
    Send, ^a
    Send, {Backspace}

    ; 发送用户名
    Send, %windows_username%
	Send, {Tab}  ; 模拟按下 Tab 键以跳转到下一个输入框
    Sleep, 500  ; 等待 0.5 秒

    ; 清空当前输入框
    Send, ^a
    Send, {Backspace}

    ; 发送密码
    Send, %windows_password%
    Sleep, 500  ; 等待 0.5 秒

    ; 按下 Enter 键
    Send, {Enter}
return
