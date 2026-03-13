-- ╔══════════════════════════════════════╗
-- ║         UILibrary - Module           ║
-- ║     استخدم loadstring لتحميله        ║
-- ╚══════════════════════════════════════╝

local UILibrary = {}
UILibrary.__index = UILibrary

-- ══════════════════════════════
--         الإعدادات
-- ══════════════════════════════
local CONFIG = {
    -- ألوان الواجهة
    BG_COLOR         = Color3.fromRGB(15, 15, 20),        -- خلفية رئيسية
    BG_SECONDARY     = Color3.fromRGB(22, 22, 30),        -- خلفية ثانوية
    TOPBAR_COLOR     = Color3.fromRGB(10, 10, 15),        -- شريط العنوان
    ACCENT_COLOR     = Color3.fromRGB(100, 80, 255),      -- اللون المميز
    ACCENT_DARK      = Color3.fromRGB(60, 45, 180),       -- اللون المميز الداكن
    BUTTON_COLOR     = Color3.fromRGB(28, 28, 38),        -- لون الزر
    BUTTON_HOVER     = Color3.fromRGB(40, 40, 55),        -- لون الزر عند hover
    TEXT_COLOR       = Color3.fromRGB(220, 220, 235),     -- لون النص
    TEXT_DIM         = Color3.fromRGB(130, 130, 155),     -- نص خافت
    SECTION_COLOR    = Color3.fromRGB(18, 18, 25),        -- لون القسم
    BORDER_COLOR     = Color3.fromRGB(50, 50, 70),        -- لون الحدود
    CLOSE_COLOR      = Color3.fromRGB(220, 60, 80),       -- زر الإغلاق
    MINIMIZE_COLOR   = Color3.fromRGB(255, 190, 50),      -- زر التصغير

    -- أبعاد
    WINDOW_WIDTH     = 230,
    TOPBAR_HEIGHT    = 32,
    BUTTON_HEIGHT    = 34,
    CORNER_RADIUS    = 8,
    BUTTON_RADIUS    = 6,
    SECTION_PADDING  = 8,
}

-- ══════════════════════════════
--         دوال مساعدة
-- ══════════════════════════════
local function makeCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or CONFIG.CORNER_RADIUS)
    c.Parent = parent
    return c
end

local function makeStroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or CONFIG.BORDER_COLOR
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function makePadding(parent, px, py)
    local p = Instance.new("UIPadding")
    p.PaddingLeft   = UDim.new(0, px or 6)
    p.PaddingRight  = UDim.new(0, px or 6)
    p.PaddingTop    = UDim.new(0, py or 4)
    p.PaddingBottom = UDim.new(0, py or 4)
    p.Parent = parent
    return p
end

local function tweenProp(obj, props, duration)
    local TweenService = game:GetService("TweenService")
    local info = TweenInfo.new(duration or 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(obj, info, props):Play()
end

-- ══════════════════════════════
--         إنشاء نافذة
-- ══════════════════════════════
function UILibrary.new(title)
    local self = setmetatable({}, UILibrary)
    self._buttons   = {}
    self._sections  = {}
    self._minimized = false
    self._destroyed = false

    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "UILibrary_" .. title
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game:GetService("CoreGui")
    self._gui = screenGui

    -- النافذة الرئيسية
    local window = Instance.new("Frame")
    window.Name = "Window"
    window.Size = UDim2.new(0, CONFIG.WINDOW_WIDTH, 0, 0)
    window.Position = UDim2.new(0.5, -CONFIG.WINDOW_WIDTH/2, 0.5, -150)
    window.BackgroundColor3 = CONFIG.BG_COLOR
    window.BorderSizePixel = 0
    window.AutomaticSize = Enum.AutomaticSize.Y
    window.ClipsDescendants = true
    window.Parent = screenGui
    makeCorner(window, CONFIG.CORNER_RADIUS)
    makeStroke(window, CONFIG.BORDER_COLOR, 1)
    self._window = window

    -- ظل خفيف
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.Position = UDim2.new(0, -15, 0, -10)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.ZIndex = 0
    shadow.Parent = window

    -- ══ Topbar ══
    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.Size = UDim2.new(1, 0, 0, CONFIG.TOPBAR_HEIGHT)
    topbar.BackgroundColor3 = CONFIG.TOPBAR_COLOR
    topbar.BorderSizePixel = 0
    topbar.ZIndex = 2
    topbar.Parent = window
    makeCorner(topbar, CONFIG.CORNER_RADIUS)

    -- تثبيت الزوايا السفلية مستقيمة
    local topbarFix = Instance.new("Frame")
    topbarFix.Size = UDim2.new(1, 0, 0.5, 0)
    topbarFix.Position = UDim2.new(0, 0, 0.5, 0)
    topbarFix.BackgroundColor3 = CONFIG.TOPBAR_COLOR
    topbarFix.BorderSizePixel = 0
    topbarFix.ZIndex = 2
    topbarFix.Parent = topbar

    -- خط فاصل تحت الـ topbar
    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, 0, 0, 1)
    divider.Position = UDim2.new(0, 0, 1, 0)
    divider.BackgroundColor3 = CONFIG.ACCENT_COLOR
    divider.BorderSizePixel = 0
    divider.BackgroundTransparency = 0.6
    divider.ZIndex = 3
    divider.Parent = topbar

    -- نقطة لون مميزة
    local accentDot = Instance.new("Frame")
    accentDot.Size = UDim2.new(0, 4, 0, 16)
    accentDot.Position = UDim2.new(0, 10, 0.5, -8)
    accentDot.BackgroundColor3 = CONFIG.ACCENT_COLOR
    accentDot.BorderSizePixel = 0
    accentDot.ZIndex = 3
    accentDot.Parent = topbar
    makeCorner(accentDot, 2)

    -- عنوان النافذة
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Position = UDim2.new(0, 22, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Menu"
    titleLabel.TextColor3 = CONFIG.TEXT_COLOR
    titleLabel.TextSize = 13
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 3
    titleLabel.Parent = topbar

    -- ══ أزرار التحكم ══
    -- زر التصغير "-"
    local minBtn = Instance.new("TextButton")
    minBtn.Name = "MinimizeBtn"
    minBtn.Size = UDim2.new(0, 20, 0, 20)
    minBtn.Position = UDim2.new(1, -48, 0.5, -10)
    minBtn.BackgroundColor3 = CONFIG.MINIMIZE_COLOR
    minBtn.Text = "—"
    minBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
    minBtn.TextSize = 10
    minBtn.Font = Enum.Font.GothamBold
    minBtn.BorderSizePixel = 0
    minBtn.ZIndex = 4
    minBtn.Parent = topbar
    makeCorner(minBtn, 4)

    -- زر الإغلاق "X"
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -24, 0.5, -10)
    closeBtn.BackgroundColor3 = CONFIG.CLOSE_COLOR
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 11
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.ZIndex = 4
    closeBtn.Parent = topbar
    makeCorner(closeBtn, 4)

    -- ══ Scroll للمحتوى ══
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "Content"
    scrollFrame.Size = UDim2.new(1, 0, 0, 0)
    scrollFrame.AutomaticSize = Enum.AutomaticSize.Y
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 2
    scrollFrame.ScrollBarImageColor3 = CONFIG.ACCENT_COLOR
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.Position = UDim2.new(0, 0, 0, CONFIG.TOPBAR_HEIGHT + 1)
    scrollFrame.ZIndex = 2
    scrollFrame.Parent = window
    self._content = scrollFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 0)
    listLayout.Parent = scrollFrame

    makePadding(scrollFrame, CONFIG.SECTION_PADDING, CONFIG.SECTION_PADDING)

    -- ══ السحب (Drag) ══
    local dragging, dragStart, startPos = false, nil, nil

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- ══ زر التصغير ══
    minBtn.MouseButton1Click:Connect(function()
        if self._destroyed then return end
        self._minimized = not self._minimized
        if self._minimized then
            tweenProp(scrollFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            minBtn.Text = "▲"
        else
            tweenProp(scrollFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            minBtn.Text = "—"
        end
        scrollFrame.Visible = not self._minimized
    end)

    -- ══ زر الإغلاق ══
    closeBtn.MouseButton1Click:Connect(function()
        self:Destroy()
    end)

    -- Hover effects للأزرار
    for _, btn in ipairs({minBtn, closeBtn}) do
        btn.MouseEnter:Connect(function()
            tweenProp(btn, {BackgroundTransparency = 0.3}, 0.1)
        end)
        btn.MouseLeave:Connect(function()
            tweenProp(btn, {BackgroundTransparency = 0}, 0.1)
        end)
    end

    return self
end

-- ══════════════════════════════
--         إضافة قسم
-- ══════════════════════════════
function UILibrary:AddSection(name)
    if self._destroyed then return end

    local sectionFrame = Instance.new("Frame")
    sectionFrame.Name = "Section_" .. name
    sectionFrame.Size = UDim2.new(1, 0, 0, 0)
    sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.BorderSizePixel = 0
    sectionFrame.LayoutOrder = #self._sections + 1
    sectionFrame.Parent = self._content

    -- عنوان القسم
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Size = UDim2.new(1, 0, 0, 22)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Text = "  " .. string.upper(name)
    sectionLabel.TextColor3 = CONFIG.ACCENT_COLOR
    sectionLabel.TextSize = 10
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Parent = sectionFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 4)
    listLayout.Parent = sectionFrame

    makePadding(sectionFrame, 0, 2)

    table.insert(self._sections, sectionFrame)
    return sectionFrame
end

-- ══════════════════════════════
--         إضافة زر
-- ══════════════════════════════
function UILibrary:AddButton(sectionOrLabel, label, tag, callback)
    if self._destroyed then return end

    -- دعم الاستخدام البسيط: AddButton(label, tag, callback)
    local parent, btnLabel, btnTag, btnCallback
    if type(sectionOrLabel) == "string" then
        parent    = self._content
        btnLabel    = sectionOrLabel
        btnTag      = label
        btnCallback = tag
    else
        parent    = sectionOrLabel
        btnLabel    = label
        btnTag      = tag
        btnCallback = callback
    end

    local btnFrame = Instance.new("Frame")
    btnFrame.Name = "Btn_" .. (btnTag or btnLabel)
    btnFrame.Size = UDim2.new(1, 0, 0, CONFIG.BUTTON_HEIGHT)
    btnFrame.BackgroundColor3 = CONFIG.BUTTON_COLOR
    btnFrame.BorderSizePixel = 0
    btnFrame.LayoutOrder = #self._buttons + 10
    btnFrame.Parent = parent
    makeCorner(btnFrame, CONFIG.BUTTON_RADIUS)
    makeStroke(btnFrame, CONFIG.BORDER_COLOR, 1)

    -- خط جانبي ملون
    local sideBar = Instance.new("Frame")
    sideBar.Size = UDim2.new(0, 3, 0.6, 0)
    sideBar.Position = UDim2.new(0, 0, 0.2, 0)
    sideBar.BackgroundColor3 = CONFIG.ACCENT_COLOR
    sideBar.BorderSizePixel = 0
    sideBar.BackgroundTransparency = 0.5
    sideBar.ZIndex = 2
    sideBar.Parent = btnFrame
    makeCorner(sideBar, 2)

    local btnText = Instance.new("TextButton")
    btnText.Size = UDim2.new(1, 0, 1, 0)
    btnText.BackgroundTransparency = 1
    btnText.Text = btnLabel
    btnText.TextColor3 = CONFIG.TEXT_COLOR
    btnText.TextSize = 12
    btnText.Font = Enum.Font.Gotham
    btnText.TextXAlignment = Enum.TextXAlignment.Left
    btnText.ZIndex = 2
    btnText.Parent = btnFrame
    makePadding(btnText, 14, 0)

    -- Hover
    btnText.MouseEnter:Connect(function()
        tweenProp(btnFrame, {BackgroundColor3 = CONFIG.BUTTON_HOVER}, 0.1)
        tweenProp(sideBar, {BackgroundTransparency = 0}, 0.1)
    end)
    btnText.MouseLeave:Connect(function()
        tweenProp(btnFrame, {BackgroundColor3 = CONFIG.BUTTON_COLOR}, 0.1)
        tweenProp(sideBar, {BackgroundTransparency = 0.5}, 0.1)
    end)

    -- Click
    btnText.MouseButton1Click:Connect(function()
        if self._destroyed then return end
        tweenProp(btnFrame, {BackgroundColor3 = CONFIG.ACCENT_DARK}, 0.05)
        task.delay(0.1, function()
            tweenProp(btnFrame, {BackgroundColor3 = CONFIG.BUTTON_COLOR}, 0.1)
        end)
        if btnCallback then
            btnCallback()
        end
    end)

    local btnData = {
        frame    = btnFrame,
        tag      = btnTag,
        label    = btnLabel,
        callback = btnCallback,
    }
    table.insert(self._buttons, btnData)
    return btnData
end

-- ══════════════════════════════
--    تشغيل function لكل زر
--    بناءً على الـ tag
-- ══════════════════════════════
function UILibrary:RunByTag(tag)
    if self._destroyed then return end
    for _, btn in ipairs(self._buttons) do
        if btn.tag == tag and btn.callback then
            btn.callback()
        end
    end
end

-- ══════════════════════════════
--         حذف النافذة
-- ══════════════════════════════
function UILibrary:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    self._buttons   = {}
    self._sections  = {}
    if self._gui then
        self._gui:Destroy()
    end
end

-- ══════════════════════════════
--         إخفاء / إظهار
-- ══════════════════════════════
function UILibrary:Toggle()
    if self._destroyed then return end
    self._window.Visible = not self._window.Visible
end

return UILibrary
