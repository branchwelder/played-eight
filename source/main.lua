import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/crank"

local gfx <const> = playdate.graphics

local objectSize = { x = 1, y = 1 }
local origin = { x = 200, y = 120 }
local changeModifier = 2

function drawCenteredRect()
    gfx.drawRect(origin.x - objectSize.x / 2, origin.y - objectSize.y / 2, objectSize.x, objectSize.y)
end

function updateObjectSize(change)
    objectSize.x += change / changeModifier
    objectSize.y += change / changeModifier
end

function moveObject(dx, dy)
    origin.x += dx
    origin.y += dy
end

function clear()
    gfx.clear()
end

--- The setup function for the game environment.
function setup()
    gfx.setColor(gfx.kColorBlack)
    drawCenteredRect()
end

setup()

--- Callback that runs when the crank is cranked.
function playdate.cranked(change, acceleratedChange)
    updateObjectSize(acceleratedChange)
    drawCenteredRect()
end

--- Game loop function.
function playdate.update()

    if playdate.buttonIsPressed(playdate.kButtonUp) then
        moveObject(0, -2)
    end

    if playdate.buttonIsPressed(playdate.kButtonRight) then
        moveObject(2, 0)
    end

    if playdate.buttonIsPressed(playdate.kButtonDown) then
        moveObject(0, 2)
    end

    if playdate.buttonIsPressed(playdate.kButtonLeft) then
        moveObject(-2, 0)
    end

    if playdate.buttonIsPressed(playdate.kButtonB) then
        clear()
    end

    playdate.timer.updateTimers()
end
