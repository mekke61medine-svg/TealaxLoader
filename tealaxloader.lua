--// Tealax Script Loader v6 (Kod Gizli, Soluna Temalı)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Pencere = OrionLib:MakeWindow({
    Name = "Tealax Script Yükleyici",
    HidePremium = false,
    SaveConfig = false,
    IntroEnabled = false,
    IntroText = "Tealax Loader"
})

-- YouTube linki
local youtubeLink = "https://www.youtube.com/@tealaX_oyunda"

-- BİLGİ TAB
local BilgiTab = Pencere:MakeTab({
    Name = "Bilgi",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

BilgiTab:AddParagraph("Tealax Script Yükleyici", "Bu script Tealax tarafından hazırlanmıştır.\nKullanım tamamen sizin sorumluluğunuzdadır.")
BilgiTab:AddButton({
    Name = "YouTube Kanalımı Kopyala",
    Callback = function()
        setclipboard(youtubeLink)
        OrionLib:MakeNotification({
            Name = "Kopyalandı",
            Content = "YouTube kanal linki panoya kopyalandı!",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- SCRIPTLER TAB
local ScriptlerTab = Pencere:MakeTab({
    Name = "Scriptler",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Gizli script URL'leri (kullanıcı göremez)
local gizliScriptler = {
    ["MM2Soluna"] = "https://tealax-scripts.com/mm2soluna.lua",
    ["MM2XHub"] = "https://tealax-scripts.com/mm2xhub.lua",
    ["Brookhaven"] = "https://tealax-scripts.com/brookhaven.lua"
}

-- Kullanıcıya görünecek scriptler
local scriptButonlari = {
    {Isim = "MM2 (Soluna)", ID = "MM2Soluna", Ikon = "rbxassetid://6031094675"},
    {Isim = "MM2 (XHub)", ID = "MM2XHub", Ikon = "rbxassetid://6031094675"},
    {Isim = "Brookhaven RP", ID = "Brookhaven", Ikon = "rbxassetid://6031094675"}
}

-- Script butonlarını ekleme
for _, s in ipairs(scriptButonlari) do
    ScriptlerTab:AddButton({
        Name = s.Isim,
        Image = s.Ikon,
        Callback = function()
            local url = gizliScriptler[s.ID]
            local success, err = pcall(function()
                loadstring(game:HttpGet(url, true))()
            end)
            if not success then
                OrionLib:MakeNotification({
                    Name = "Hata",
                    Content = s.Isim.." yüklenemedi: "..err,
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        end
    })
end

OrionLib:Init()
