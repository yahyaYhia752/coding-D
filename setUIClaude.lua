local UILibrary = loadstring(game:HttpGet("رابطك هنا"))()

-- إنشاء نافذة
local Window = UILibrary.new("Time Bomb Hub")

-- إضافة قسم
local MainSection = Window:AddSection("Main")
local MiscSection = Window:AddSection("Misc")

-- إضافة أزرار مع tag
Window:AddButton(MainSection, "Auto-Pass Bomb", "bomb", function()
    print("Auto Pass تشتغل!")
end)

Window:AddButton(MainSection, "Auto-Get Money", "money", function()
    print("Auto Money تشتغل!")
end)

Window:A
