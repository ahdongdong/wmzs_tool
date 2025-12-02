#Requires AutoHotkey v2.0
#Include <FindText>

;按下CTRL+下按键，鼠标滚轮向下滚动
;按下CTRL+上按键，鼠标滚轮向上滚动
;^F10::Send "{WheelDown}"
;^F11::Send "{WheelUp}"

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

;确认按钮
TargetText_QueRen.="|<>**50$113.00082000E0000000E00000MA031k0U3zU01U00000kM061U3Xzy3zX00001zzzkM3U1k603y6000010001nzz1UA000C0000000032C600M001zk0003z0AAUQ01zzs00tU000Dz4MH0M1nzznztX0000M6Mk60k3k307zX20000kAlUM1U1k600k640001ztX1lzy0UA010A80003zn67bzw00M06kME00061aAT0Q02TzUBkkU000A3AMq0s0Azz0lVX0000TyMkA0k0P031X760000zwlUM1U0q0663AA0001UNX0k303A0ADyMM00030k61U606M0MTxUk00061UA30Q0Mk0k0D3U000Az7M6zztlzzU0Ry0000MyDkAzzn1zy00ns000000300000000010000000000000000000000E"
TargetText_QueRen.="|<>**50$37.000060Tzy07U801VTzo00k622TzM33100AE03U06000Hzn2019UNV00Yk4kU0GM2ME09A1AA04a0a0lwHzn0F08ztV8kY00lY8+00NX0r03sVylU"

TargetText_TaskList:="|<>*149$36.y0k0Tzy0W0Tzy0W0Tzzz40Tzs040zzUk40zzXy41zzW3Y1zzm0w0zzk000Tzt000DzwU007zwk007zyE003zz8001zz8000zzY000Tzm000Dzn0007zt0007zsU027zwU04DzyE0MTzy80Uzzz833zyTY67zzzWMT0U"
TargetText_TaskList:="|<>**50$28.m000DY000KM000AU000l0041a00V380AA4E13UN0MQ0m33U36ks06C700A0s2"
;背包按钮，用来判断是否是主界面
MainPage_BeiBao := "|<>**50$25.0TU00MTw08030Q00UM01k80XU40HU20BU3w3U723nk0T0ClU/sFzsr/VEiz08Pj0Y0S0n0V3kUA00N3U0DUk03k800k4000200010001E001A001XU030S061"

;任务列表中的每日必做
 Text_MRBZ := "<>**50$79.6003zz01008UU7zzXzzk4kUAME3001U0M3Mk6zDn000k0A1aM3TbvTzsM064nB3268AEAA032MalV3A6C6601VAGNkVa33X300kaBAtwv3UHVzzsn1W4yp7zzwzzwNUVWFmUk0EM06Akkl8lkMkMA036MkMYMs8CA601aAsYGAAA16300n6sG96C7zzlU0M3kN4WBVznsk0A7UA2FiM09UTzyCzw1Di607U7zy03w0U60U"

TaskListInterval := 10 * 1000    ; 任务列表检测间隔：10WheelDown



;点击匹配按钮
TargetText_PP.= "|<>**50$58.0t0D0000002bUw7zzzzU/zyTs0A060U4039jsz8yzk0AqzXgW07yTrOw3m+sTtzRjoj8jxU05qvGVizryTqPgWyM0QdLPUm21s7mZBT7S/qib+Jrjw0fnPStrDzrfjRas0S030UzTzzzzzzzyBr/zw00052"

;巅峰对决_快速挑战
TargetText_KSTZ :="<>**50$54.4Eb05kAL44EV04M8wU4FX0488U0AlXs688zk8r7A6Tsn0cN446wU10cB7A3slV0c76A7slW01768wslW01zC8U8lWU1uCAYM0WkFyC6AN1yMl0828y2SAl47y8w366nAK08tX23nMnUMXXW1XMlksjaq0WlkzUz7y0XXM360k00b6M/D00606QANBk0604sAlszzw0zU7Vk0y002000000000Dnzk0yDk08G401UAS08mAE16AH08y8w168l08y8r17cl1t68l14st102MX30Ms1lkN737s10FkEA3A1z0FUEs2Blr0lQFkyDlk3kslsy9lV23UkAW0l2220m4Xll6228n4WFEA3WFXBWlEM1WlXtalku1bXXdanku17bbd4XUG377W902A206R097cQ22AlU9Alq22PUztsD322U0000k1kU"
;巅峰对决购买次数
Text_DFDJ_200:="|<>**50$351.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010U04A000000080000000A000A00000000U00U0040E000020U07zz1zzz0M40zzz00000031zkTzy01U0TlU1zzy00060067zVU20A2M0E6k0U087zzlzzz7zzs302060Tzy3zzkzzznyDyDzzkDX0zyDzTsDwE1YH020r040100A0Dzzs0VV1y1w3w3v0E0007zzyMHzk0A63yTDztzsk1Vm0AmNUE6M0zzs03U030U3zzsMsMktkkM20000k00nGM63VVUM0RY3BXDkA6E7yHM3yk040100zU0M40kVU33636663zk0004004OGMkCAA200wUFjzz30m0zmT0Ta00U080Rb02406AA0kMkNkNzTy00007zy3Gq68RV0k03463ykMM6E1WHU20rU7zz0CAS0lU0zzza363A3Tv0FzzzVzzsOIklkA0600kkktaH30W0AGM0EDs0000D1Us6AA0sAA0NkRUMMM20AQ00C03G667V00z0C6ADgnMwAM1UH027k00003UA1VVVUC1XU6C3g333zk1V001U0OFgkC807w00lVj6PDlXUD6M3y6M3zzy01U0QAs7zzs1VkRUNzTy0A800A03GAa03001k1C80wmNXgS1lnUTkn00200Tzw7Vi1zzy0QC3g3DvA01V01zzsOH6nzzz060ts0RqH0D2QwST322E08E03zzlwDU1UUk30kNUMMNX0880Dzz3GMqTzzs0kCD0C6mM0sFZinQMEK033z0k069Xk0A460k63A3336k31001Y0GLyk0k0067XQ1jqH0626AaMn23U0MTw600kBw11VUkA0kMkkMMw0M8A0Ak0kQK0Cs00nktU7yqM0kE1Un0MEQE7X00k061hU8AA63U36663330611U1X06U3k3XkAAMC60kmk0A20AAMH23a1yE0600kAA11XS0TsDUTUNNg1k8A0AA1a060s71z03UQ66Bk70E1VX6MFwkQy00k061VUM1lw3z0s0k3PMsw1VU1UUAM1US0C3k1s1kkn61k20AMMnyQy71zz3zzkA7z3w1w000000SS3i0DszzzX13wD00s00w077ysMw0E7b3yDq3kE1zs0001UTVw01k000001VU000S7zzwE0C3U00006000Tg1a020MUD0006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000820D000000000000000000000000000000000000000000000000000600n4k3y000000000000000000000000000000000000000000000000030zw3Na0ks0000000000000000000000000000000000000000000000000T7zs9Mzi300000000000000000000000000000000000000000000000000Sq30M7xUM00000000000000000000000000000000000000000000000000wkNzxWA3000000000000000000000000000000000000000000000000003a30sAFkM00000000000000000000000000000000000000000000000000skkDvW66000000000000000000000000000000000000000000000000006663NoEFk00000000000000000000000000000000000000000000000000UlVn4a0M0000000000000000000000000000000000000000000000000006AA06k2000000000000000000000000000000000000000000000000000Qs020q0E000000000000000000000000000000000000000000000000007D07zaU2000000000000000000000000000000000000000000000000003lg0zwI0E00000000000000000000000000000000000000000000000001sNk1VXU200000000000000000000000000000000000000000000000000Q770MQM00000000000000000000000000000000000000000000000000001kQ1z3U0000000000000000000000000000000000000000000000000000s1k3sq0s00000000000000000000000000000000000000000000000000S07VvwQ7000000000000000000000000004"
Text_DFDJ_200_OK:="|<>**50$65.0000000000000000000000000000000000000000000000k00300000zXy00600000MDy0zzzU000kMM1zzzU001VUk600300067zsA006000ATzsNzyM000TAMk7zyE001qMVU0C00007Anb00A0000CNzy0MM0000QnCA0kk0000Na8M1Vzk000HAMk63zU000aTzUA600001Azz0QA00002P361wM00004q4A3Qk0000Dg8MATU00000kFksTzk0001Uj1U7zk0002040000002"
;点击空白关闭
TargetText_KSTZ .= "|<>**50$137.3s00S00DU01s0D3k3kD0yzw6zy0q0TvzU6s0m4U6ku1DzwAzzzDxznzzwzlbtUAlYCC0MM0DyTz001w01n7n0NaMTA0Ek0s00Q003U01g1X3twyjywzjzk00tvbrDznNn363k7Thdu0wznznb3CTzrba3800Czvm00DzbzaTWQU1j7AXTtzxUUYzyQ103MnVd03QCtXznzf00/zws0037zXnzyuRnbzbzrwSK09twyQDzXY09qHZg001gswjzmvtws007003wZ/s003PZd004YG9Q00yTzaAOETsTyyPG0098YGDtzozzgMoU1qQ5tqZbQmF8Y0G0903Nlt07CQ/bh/CNoWF80Y0G06r1m0wySITOLQtdwyLzDybzxwsbzXgDdywiQtlswi28B003ns0SCC7TVtotnk01E00+007Cw0EsDCl23"
;挑战按钮
Text_DFDJ_TZ := "<>**50$69.08001UAk01U00U00M0m00M0E200603A060EE801U0Ak1Uk10z0Ty0l0MA04048Ms3AE300E0V1104m0k010AMEs0l0A0001X2403A10004Bkkr0408000Va66A0k0000A0kkUU10k000026AA0400008QEV300H00012WA8k0100008IFUQ004E0013UA6000G000EoVVU00100020wAQ0004003kT10s000E00U70M1U00100000324000400E88ME0000E02VW734000100IAkksU00040HViC5o0000E04DVEYU000110V8O5g7wDk4MAP6EtUUV30ID2lW04A48D100QME0VVV3644362048M8ME0EnUE3V3l3232Nk3zk8PMME8Is00012D7b0000000M0kg800000033y600400000EyE3s0k00002607s0200000Ezktk00000027W70000000Dlakk000000148K66000000802kVU0000017sG08000000MW6k200000024EW0k000000EW4ECU0000024Ea3Y000000EW5UQU000006Dls1U00U000U0C0100800048VV08000000V40Q000E00048sQk0008000z4C3000200000X0A8090000000000000000000004"
;继续挑战
Text_DFDJ_TZ .="|<>**50$95.00000000000000000000000000000000202060M0800083006A40A0k0kAk0E6E0MO8UE1k1WNU0UAk0mqF1azz34n610Mk1ZYa3A707BaM3wkU6P9AAkA0ztBU7xU0AaGENbzsQmS08320vA41XTzklYs0E7y1yTznw41VVNU1Vzk0MzzXsAn30n03nw00lVU1VZa7Vb0TsNU337M63D0T7D0kkn066OEA361syPVVVg0TgokzXA0ngnX33M0MP8VyzzlYNX663U00wFU03k30n0AA6001kV007U6364MMQM0T100MDUA6AAklwkDq00DlnUMMMlziBUQDztw71nlkzXysT00Dzk0w1XW0y000AE"

;巅峰对决已经完成的判断 20/20
Text_DFDJ_2020 :="|<>**50$50.BUP04BUP4AAM14AAN1220n122kFUk8kFUkAMA60AMA263102631V0kk1V0kkMA80kMA8632086341UlU41Un088E3089U36A1U36MEP20MEP8"
; 巅峰对决Title
Text_DFDJ_MAIN_TITLE:= "<>**50$117.00800006000000k00400U103080sU0000C000k060A0M10DzkTzk1kE0600zzzz193kS3zz0C701k07zzzkNAo1U01s1kM7zy0000019jkQ0070C3Vzzw0M000NBX7000s1kA0D3XzszzX9UDk007zzlU0kATzbzwN80w070zzyC061U201U390Tk0MC0C0k0kA0M080N8zjs3Vk1k6061UzsTy39DUDUCC0C0E0kA41bzsNB0k40tX1k00C1UUAs739UD007QQC01zzz7za0MNAzzs0TVlk1zzzsUAlX39Xzz03sCC0Azzz63aAMNA0s00D0tk3UD00zwlX39U7001k3i0Q1s041aAMNAzzs0D0Bk30RU0zwlX39bzy03s0C0s3C07zaAMNA0s00zU1k70sk1kAHX39U7007Q0C1kC7UzzkM0NBzzw1lk1kC3kS7zz6M3zjzzUQC0C3Uw1s0A1nkTs0s0D0k1kQD07ktwQDU00703k67S77U0TS1z0Q000s0w00zkls00zU1U0000702003w0400100000000E00000000004"
Text_DFDJ_MAIN_TZ :=   "<>**50$44.410041U10H010NUF4k0E6QCNAs61X7qHA1z81xYq0Q20CND040z12H011zkE4k0sz073A0TUn3knkDwAlswy3338wTAskkq3An6AAD0EAk331k43A0kkMl1X2AADAEskn3CvAQCMzb7r61y010w0020002U"



;==========================
; GUI 界面配置
;==========================
myGui := Gui()
myGui.Title := "自动点击控制台"
myGui.Opt("+AlwaysOnTop")
myGui.SetFont("s10", "Microsoft YaHei")

cbQueRen := myGui.Add("Checkbox", "Checked", "启用：自动点击确认 (QueRen)")
cbPP := myGui.Add("Checkbox", "", "启用：自动点击匹配 (PP)")
cbKSTZ := myGui.Add("Checkbox", "", "启用：自动巅峰对决 (KSTZ)")
cbTaskList := myGui.Add("Checkbox", "", "启用：自动点击任务列表 (TaskList)").OnEvent("Click", (*) => TaskListLoop())

myGui.Add("Button", "w200", "手动排列窗口").OnEvent("Click", (*) => ArrangeWindows())

; 显示并移动到右下角 (使用工作区避免遮挡任务栏)
myGui.Show("NoActivate")
myGui.GetPos(,, &w, &h)
MonitorGetWorkArea(, &Left, &Top, &Right, &Bottom)
myGui.Move(Right - w, Bottom - h)

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
        return  ; 没有找到窗口，跳过WheelDown
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
    global TargetText_QueRen, TargetText_KSTZ, SearchRange, cbKSTZ, cbQueRen, cbPP, TargetText_PP
    global Text_DFDJ_200, Text_DFDJ_200_OK, Text_DFDJ_TZ

    ; 绑定窗口用于截图（模式4最稳定）
    FindText().BindWindow(hwnd, 4)

    ; 搜索范围
    x1 := 0 - SearchRange
    y1 := 0 - SearchRange
    x2 := 0 + SearchRange
    y2 := 0 + SearchRange

    if (cbKSTZ.Value)
    {
        ; 判断是否已经完成
        if(FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_2020, 1, 0.85) && FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_TZ, 1, 0.85))
        {
            ; 巅峰对决已完成，点击空白关闭
            ToolTip "窗口 " hwnd " 巅峰对决已完成  发送ESC关闭弹窗 (" X "," Y ")", 20, 20
            Send "{Esc}"
            SetTimer(() => ToolTip(), -800)
        }
        ; 主界面挑战按钮检测：找到主界面标题和挑战按钮，但没有快速挑战按钮时点击挑战
        if( FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_MAIN_TITLE, 1, 0.85)
             && FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_MAIN_TZ, 1, 0.85))
        {
            ; 记录 Text_DFDJ_MAIN_TZ 的坐标，防止后续查找失败覆盖 X,Y
            mainTzX := X
            mainTzY := Y

            ; 确认没有找到 Text_DFDJ_TZ
            if (!FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_TZ, 1, 0.85))
            {
                ; 点击 Text_DFDJ_MAIN_TZ
                ToolTip "窗口 " hwnd " 找到主界面的挑战 (" mainTzX "," mainTzY ")", 20, 20
                FindText().Click(mainTzX, mainTzY, "L")
                SetTimer(() => ToolTip(), -800)
            }
        }

        ; 优先处理购买次数弹窗：同时找到提示文本和确认按钮时点击确认
        if (FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_200) 
         && FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_200_OK))
        {
            ToolTip "窗口 " hwnd " 已点击购买次数 (" X "," Y ")", 20, 20
            FindText().Click(X, Y, "L")
            SetTimer(() => ToolTip(), -800)
        }
        else if (ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, TargetText_KSTZ, 1, 0.85))
        {
            ; 转为屏幕坐标并点击
            ToolTip "窗口 " hwnd " 已点击巅峰对决 (" X "," Y ")", 20, 20
            FindText().Click(X, Y, "L")
            SetTimer(() => ToolTip(), -800)
        }
        ;挑战按钮，可能有多个，点击最下方的那个
        else if (ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_DFDJ_TZ, 1, 0.85))
        {
            ; 找到所有匹配，点击Y轴最大的那个（最下方的）
            maxY := -99999
            targetX := 0
            targetY := 0
            for result in ok {
                if (result.y > maxY) {
                    maxY := result.y
                    targetX := result.x
                    targetY := result.y
                }
            }
            ToolTip "窗口 " hwnd " 找到 " ok.Length " 个挑战，点击最下方 (" targetX "," targetY ")", 20, 20
            FindText().Click(targetX, targetY, "L")
            SetTimer(() => ToolTip(), -800)
        }
    }

    if (cbQueRen.Value && FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, TargetText_QueRen, 1, 0.85))
    {
        ; 转为屏幕坐标并点击
        ToolTip "窗口 " hwnd " 已点击按钮 (" X "," Y ")", 20, 20
        FindText().Click(X, Y, "L")
        SetTimer(() => ToolTip(), -800)
    }

    if (cbPP.Value && FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, TargetText_PP, 1, 0.85))
    {
        ; 转为屏幕坐标并点击
        ToolTip "窗口 " hwnd " 已点击匹配 (" X "," Y ")", 20, 20
        FindText().Click(X, Y, "L")
        SetTimer(() => ToolTip(), -800)
    }

    FindText().BindWindow(0)  ; 解绑定
}


;==========================
; 功能函数：任务列表检测 → 点击 → 向下滚动
;==========================
CheckTaskList(hwnd)
{
    global TargetText_TaskList, SearchRange, cbTaskList
    ;标识是否有任务正在执行中
    global HasTaskExecuting := false

    if (!cbTaskList.Value)
        return

    ; 绑定窗口用于截图（模式4最稳定）
    FindText().BindWindow(hwnd, 4)
    WinActivate("ahk_id " hwnd)

    ; 搜索范围
    x1 := 0 - SearchRange
    y1 := 0 - SearchRange
    x2 := 0 + SearchRange
    y2 := 0 + SearchRange
    ;连续查找三次，找到停止
        ;如果当前有任务在执行，则不进行任务列表检测和点击
        if(HasTaskExecuting) {
             ToolTip("窗口 " hwnd "有任务正在执行中", 20, 20)
            return 
        }
           

        if (ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, MainPage_BeiBao, 1, 0.80))
        {
            if ( ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, TargetText_TaskList, 1, 0.85) ) {
             ; 在窗口坐标内点击任务列表
                ToolTip("窗口 " hwnd " 任务列表已点击 (" X "," Y ")", 20, 20)
                FindText().Click(X, Y, "L")
            }

        }
        ;判断是否处于任务列表界面
        if (ok := FindText(&X, &Y, x1, y1, x2, y2, 0.1, 0.5, Text_MRBZ, 1, 0.85))
        {
            ; 在窗口坐标内点击每日必做
            ToolTip("窗口 " hwnd " 每日必做已点击 (" X "," Y ")", 20, 20)
            FindText().Click(X, Y, "L")
            MouseMove X, Y -200  
            Sleep 100
            Send "{WheelDown 5}"  ; 向下滚动5格
            Sleep 500
        }
       
    FindText().BindWindow(0)  ; 解绑定
}