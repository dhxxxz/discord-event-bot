local url = "https://discord.com/api/webhooks/1437420931122331658/RUzvQ9fJIxDg53nKuzWVBsPUjNT1M5FO-q3KePcD0bD-D2gRbLR3msCkWK8lcyvSbXU4"

local schedule = {
    ["06:00"] = {"Server Restart"},
    ["18:00"] = {"Server Restart"},
    ["16:00"] = {"Airdrop"},
    ["20:00"] = {"Airdrop"},
    ["23:00"] = {"Airdrop"},
    ["12:30"] = {"ชิงธง"},
    ["15:30"] = {"ชิงธง", "กองปูนใหญ่"},
    ["18:30"] = {"ชิงธง"},
    ["21:30"] = {"ชิงธง"},
    ["00:30"] = {"ชิงธง"},
    ["17:00"] = {"Loot Box"},
    ["20:30"] = {"Loot Box"},
    ["00:00"] = {"Loot Box"},
    ["03:30"] = {"Loot Box"},
    ["19:30"] = {"กองปูนใหญ่"},
    ["22:00"] = {"กองปูนใหญ่"},
    ["04:30"] = {"กองปูนใหญ่"},
    ["06:30"] = {"กองปูนใหญ่"},
    ["14:00"] = {"Paintball"},
    ["19:00"] = {"Paintball"},
    ["22:30"] = {"Paintball"},
    ["01:00"] = {"Paintball"},
    ["02:00"] = {"Paintball"},
}

local json = require("dkjson")

local function sendWebhook(eventName)
    local data = {
        username = "Xin Town",
        content = "@everyone",
        embeds = {{
            title = "**กิจกรรมเริ่มแล้ว!**",
            description = "**" .. eventName .. "**",
            color = 0x00FFAA,
            footer = { text = "By Xin Town" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }},
    }

    local body = json.encode(data)
    os.execute(string.format(
        'curl -H "Content-Type: application/json" -X POST -d \'%s\' "%s"',
        body, url
    ))
end

sendWebhook("สคริปต์เริ่มทำงานแล้ว")

while true do
    local currentTime = os.date("%H:%M")
    local events = schedule[currentTime]
    if events then
        for _, eventName in ipairs(events) do
            sendWebhook(eventName)
        end
        os.execute("sleep 60")
    end
    os.execute("sleep 60")
end
