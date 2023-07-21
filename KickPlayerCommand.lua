local admins = {127096581} -- Add as many user ids as you like.

game.Players.PlayerAdded:Connect(function(plr)
	if not table.find(admins, plr.UserId) then return end -- Exits if player is not in admin table

    plr.Chatted:Connect(function(msg)
        if string.len(msg) &lt= 1 then return end -- Exits if string is shorter than 1 character
        msg = string.split(msg, " ")
        if #msg &lt= 1 then return end -- Exits if command doesn't have any args

        local cmd = msg[1] -- Gets command
        local affected = msg[2] -- Gets second argument (affected player)

        if cmd == "/kick" then -- Checks if the command is "/kick"
            if game.Players:FindFirstChild(affected) then -- Checks if user exists
                game.Players:FindFirstChild(affected):Kick("Kicked") -- Kicks user (replace text to change the msg shown.)
            end
        end
    end)
end)
