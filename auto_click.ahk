toggle := false  ; 开关变量，用于跟踪自动单击功能是否激活

; 当按下 F2 + ~ 组合键时，切换自动单击功能的状态
F2 & `::  ; 这表示 F2 + ~
    toggle := !toggle  ; 切换开关的状态
    if (toggle) {
        SetTimer, PerformSingleClick, -10000  ; 设置定时器，单次延迟为10000毫秒（10秒）
    } else {
        SetTimer, PerformSingleClick, Off  ; 关闭定时器
    }
return

; 执行单击和显示消息的函数
PerformSingleClick:
    Click  ; 执行单击
    ToolTip, Auto click...  ; 显示提示信息
    Sleep, 5000  ; 显示提示信息5秒
    ToolTip  ; 清除提示信息
    if (toggle) {
        SetTimer, PerformSingleClick, -5000  ; 重新设置定时器，再次延迟5000毫秒
    }
return
