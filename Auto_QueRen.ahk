#Requires AutoHotkey v2.0
#Include <FindText>


;==========================
; 退出热键 Ctrl+End
;==========================
^End::ExitApp

;==========================
; 退出热键 Ctrl+End
;==========================
^F12::ArrangeWindows

;==========================
; 配置区
;==========================
WinTitle  := "完美世界：诸神之战"     ; 关键字匹配多个窗口
TargetText_QueRen := "|<>**50$43.00000E0TzzU0A0DzzsDzza00ADzzu0060A61Dzv0630X01Xzzzk00k0008TwM0004TzA60FmA1a300N40n1U0AW0NUk06F0AkM038U2MDzz4M3A0F02Dza08k10031YMAU01VW6HE00ll0Bs07skzQQ01s0Dw2"
SearchRange := 4096                 ; 搜索范围
ClickInterval := 5000                 ; 每次执行间隔（毫秒）


TargetText_QueRen.="|<>**50$113.00082000E0000000E00000MA031k0U3zU01U00000kM061U3Xzy3zX00001zzzkM3U1k603y6000010001nzz1UA000C0000000032C600M001zk0003z0AAUQ01zzs00tU000Dz4MH0M1nzznztX0000M6Mk60k3k307zX20000kAlUM1U1k600k640001ztX1lzy0UA010A80003zn67bzw00M06kME00061aAT0Q02TzUBkkU000A3AMq0s0Azz0lVX0000TyMkA0k0P031X760000zwlUM1U0q0663AA0001UNX0k303A0ADyMM00030k61U606M0MTxUk00061UA30Q0Mk0k0D3U000Az7M6zztlzzU0Ry0000MyDkAzzn1zy00ns000000300000000010000000000000000000000E"
TargetText_QueRen.="|<>**50$37.000060Tzy07U801VTzo00k622TzM33100AE03U06000Hzn2019UNV00Yk4kU0GM2ME09A1AA04a0a0lwHzn0F08ztV8kY00lY8+00NX0r03sVylU"

TargetText_TaskList:="|<>*149$36.y0k0Tzy0W0Tzy0W0Tzzz40Tzs040zzUk40zzXy41zzW3Y1zzm0w0zzk000Tzt000DzwU007zwk007zyE003zz8001zz8000zzY000Tzm000Dzn0007zt0007zsU027zwU04DzyE0MTzy80Uzzz833zyTY67zzzWMT0U"
TargetText_TaskList:="|<>**50$28.m000DY000KM000AU000l0041a00V380AA4E13UN0MQ0m33U36ks06C700A0s2"
TaskListInterval := 10 * 60 * 1000    ; 任务列表检测间隔：10分钟

;点击匹配按钮
TargetText_PP.= "|<>**50$58.0t0D0000002bUw7zzzzU/zyTs0A060U4039jsz8yzk0AqzXgW07yTrOw3m+sTtzRjoj8jxU05qvGVizryTqPgWyM0QdLPUm21s7mZBT7S/qib+Jrjw0fnPStrDzrfjRas0S030UzTzzzzzzzyBr/zw00052"



;==========================
; GUI 界面配置
;==========================
myGui := Gui()
myGui.Title := "自动点击控制台"
myGui.Opt("+AlwaysOnTop")
myGui.SetFont("s10", "Microsoft YaHei")

cbQueRen := myGui.Add("Checkbox", "Checked", "启用：自动点击确认 (QueRen)")
cbPP := myGui.Add("Checkbox", "", "启用：自动点击匹配 (PP)")
cbTaskList := myGui.Add("Checkbox", "", "启用：自动点击任务列表 (TaskList)")

myGui.Add("Button", "w200", "手动排列窗口").OnEvent("Click", (*) => ArrangeWindows())
myGui.Show("NoActivate x0 y0")

;==========================
; 定时器
;==========================
SetTimer(ClickLoop, ClickInterval)
SetTimer(TaskListLoop, TaskListInterval)

ArrangeWindows()
return

;==========================
;排列窗口
;==========================
ArrangeWindows()
{
    global WinTitle

    WinList := WinGetList(WinTitle)
    if WinList.Length = 0
        return  ; 没有找到窗口，跳过

    window_left:=0
    window_top:=0
    window_margin := 100
    Window_width := 540 + 34
    Window_height := 960 +32

    for hwnd in WinList
    {
        ;Client区域和窗口之间的边距
        WinMove( window_left, window_top,Window_width,Window_height,"ahk_id " hwnd)
        window_left += 540
        window_left += window_margin
    }
}


;==========================
; 主循环：遍历所有窗口并查找点击
;==========================
ClickLoop()
{
    global WinTitle, TargetText_QueRen, SearchRange

    WinList := WinGetList(WinTitle)
    if WinList.Length = 0
        return  ; 没有找到窗口，跳过
    for hwnd in WinList
    {
        TrySearchAndClick(hwnd)
    }
}


;==========================
; 任务列表循环：遍历窗口并查找任务列表
;==========================
TaskListLoop()
{
    global WinTitle

    WinList := WinGetList(WinTitle)
    if WinList.Length = 0
        return  ; 没有找到窗口，跳过
    for hwnd in WinList
    {
        CheckTaskList(hwnd)
    }

}


;==========================
; 功能函数：绑定 → 查找 → 点击
;==========================
TrySearchAndClick(hwnd)
{
    global TargetText_QueRen, SearchRange

    ; 绑定窗口用于截图（模式4最稳定）
    FindText().BindWindow(hwnd, 4)

    ; 搜索范围
    x1 := 0 - SearchRange
    y1 := 0 - SearchRange
    x2 := 0 + SearchRange
    y2 := 0 + SearchRange

    if (ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, TargetText_QueRen, 1, 0.85))
    {
        ; 转为屏幕坐标并点击
        FindText().Click(X, Y, "L")

        ToolTip "窗口 " hwnd " 已点击按钮 (" X "," Y ")", 20, 20
        SetTimer(() => ToolTip(), -800)
    }

    FindText().BindWindow(0)  ; 解绑定
}


;==========================
; 功能函数：任务列表检测 → 点击 → 向下滚动
;==========================
CheckTaskList(hwnd)
{
    global TargetText_TaskList, SearchRange

    ; 绑定窗口用于截图（模式4最稳定）
    FindText().BindWindow(hwnd, 4)

    ; 搜索范围
    x1 := 0 - SearchRange
    y1 := 0 - SearchRange
    x2 := 0 + SearchRange
    y2 := 0 + SearchRange
    ;连续查找三次，找到停止
    for i, attempt in [1, 2, 3,4,5,6]
    {
        if (ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, TargetText_TaskList, 1, 0.85))
        {
            ; 在窗口坐标内点击任务列表
            FindText().Click(X, Y, "L")

            Sleep 500
        }
        sleep 300
    }
    FindText().BindWindow(0)  ; 解绑定
}

