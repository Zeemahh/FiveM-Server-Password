local passwords = {
    "A string..."
}

AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    deferrals.defer()

    Wait(50)

    deferrals.presentCard([==[
        {
            "type": "AdaptiveCard",
            "body": [{
                "type": "TextBlock",
                "size": "ExtraLarge",
                "weight": "Bolder", 
                "text": "Server Password"
            },
            {
                "type": "TextBlock",
                "text": "This server requires a password in order to connect to it.",
                "wrap": true
            },
            {
                "type": "Input.Text",                
                "style": "password",
                "id": "password",
                "title": "",
                "placeholder": "Enter password..."
            },
            {
                "type": "ActionSet",
                "actions": [{
                    "type": "Action.Submit",
                    "title": "Submit"
                }]
            }],
            "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
            "version": "1.0"
        }
    ]==], function(data, rawData)
        for k, v in pairs(passwords) do     
            if data.password == v then
                deferrals.done("You actually entered the correct password. Good job!")
            else
                deferrals.done("That was the incorrect password!")
            end
        end
    end)
end)