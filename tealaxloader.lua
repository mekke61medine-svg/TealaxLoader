--// Tealax Script Loader v5 (Soluna Temalı)
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

BilgiTab:AddParagraph("Tealax Script Yükleyici", "Bu script Tealax tarafından hazırlanmıştır.\nKullanım tamamen sizin sorumluluğunuzdadır. Bazı scriptler güncel olmayabilir veya riskli olabilir.")
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

-- Script listesi (isimler ve ikonlar kullanıcıya görünür)
local scriptler = {
    {Isim = "MM2 (Soluna)", URL = "https://soluna-script.vercel.app/murder-mystery-2.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "MM2 (XHub)", URL = "https://raw.githubusercontent.com/CycleScripts/Official/refs/heads/main/freemium", Ikon = "rbxassetid://6031094675"},
    {Isim = "Brookhaven RP", URL = "https://soluna-script.vercel.app/brookhaven.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "Big Paintball 2", URL = "https://soluna-script.vercel.app/big-paintball-2.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "Flee the Facility", URL = "https://soluna-script.vercel.app/flee-the-facility.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "Grow a Garden", URL = "https://soluna-script.vercel.app/grow-a-garden.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "Combat Warriors", URL = "https://soluna-script.vercel.app/combat-warriors.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "Anti Kick", URL = "https://raw.githubusercontent.com/raavenkkj/anti-kick/main/anti-kick.lua", Ikon = "rbxassetid://6031094675"},
    {Isim = "Anti Ban", Kod = [[
        local X
        X = hookmetamethod(game, "__namecall", function(self,...)
            if getnamecallmethod() == "Ban" then return wait(9e9) end
            return X(self,...)
        end)
    ]], Ikon = "rbxassetid://6031094675"},
    {Isim = "Chat Bypass", URL = "https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass", Ikon = "rbxassetid://6031094675"}
}

-- Script butonlarını ekleme
for _, s in ipairs(scriptler) do
    ScriptlerTab:AddButton({
        Name = s.Isim,
        Image = s.Ikon,
        Callback = function()
            local success, err = pcall(function()
                if s.URL then
                    loadstring(game:HttpGet(s.URL, true))()
                elseif s.Kod then
                    loadstring(s.Kod)()
                end
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
