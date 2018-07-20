--������ �������� �� ������ ����� ����� � ������ ��: http://vk.com/qrlk.mods
--������ �������� �� ������ ����� ����� �� �����: http://www.rubbishman.ru/samp
--------------------------------------------------------------------------------
-------------------------------------META---------------------------------------
--------------------------------------------------------------------------------
script_name("waypoint")
script_version("1.0")
script_author("qrlk")
script_description("Z - set waypoint")

RPC = require 'lib.samp.events'
--------------------------------------------------------------------------------
--------------------------------------MAIN--------------------------------------
--------------------------------------------------------------------------------
function main()
  if not isSampfuncsLoaded() then return end
  while not isSampAvailable() do wait(100) end
  while true do
    wait(0)
    if sampIsDialogActive() == false and not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and wasKeyPressed(90) then
      if coordX ~= nil and coordY ~= nil then
        cX, cY, cZ = getCharCoordinates(playerPed)
        cX = math.ceil(cX)
        cY = math.ceil(cY)
        cZ = math.ceil(cZ)
        sampAddChatMessage('[waypoint]: ����������� ����� �� '..kvadY..'-'..kvadX.. '. ���������: '..math.ceil(getDistanceBetweenCoords2d(coordX, coordY, cX, cY))..' �.', - 1)
        placeWaypoint(coordX, coordY, 0)
      end
    end
  end
end

function RPC.onServerMessage(color, lcs)
  if string.find(lcs, "(%A)-[0-9][0-9]") or string.find(lcs, "(%A)-[0-9]") then
    kvadY, kvadX = string.match(lcs, "(%A)-(%d+)")
    if kvadrat(kvadY) ~= nil and kvadX ~= nil and kvadY ~= nil and tonumber(kvadX) < 25 and tonumber(kvadX) > 0 then
      last = lcs
      coordX = kvadX * 250 - 3125
      coordY = (kvadrat(kvadY) * 250 - 3125) * - 1
    end
  end
end

function kvadrat(param)
  local KV = {
    ["�"] = 1,
    ["�"] = 2,
    ["�"] = 3,
    ["�"] = 4,
    ["�"] = 5,
    ["�"] = 6,
    ["�"] = 7,
    ["�"] = 8,
    ["�"] = 9,
    ["�"] = 10,
    ["�"] = 11,
    ["�"] = 12,
    ["�"] = 13,
    ["�"] = 14,
    ["�"] = 15,
    ["�"] = 16,
    ["�"] = 17,
    ["�"] = 18,
    ["�"] = 19,
    ["�"] = 20,
    ["�"] = 21,
    ["�"] = 22,
    ["�"] = 23,
    ["�"] = 24,
    ["�"] = 1,
    ["�"] = 2,
    ["�"] = 3,
    ["�"] = 4,
    ["�"] = 5,
    ["�"] = 6,
    ["�"] = 7,
    ["�"] = 8,
    ["�"] = 9,
    ["�"] = 10,
    ["�"] = 11,
    ["�"] = 12,
    ["�"] = 13,
    ["�"] = 14,
    ["�"] = 15,
    ["�"] = 16,
    ["�"] = 17,
    ["�"] = 18,
    ["�"] = 19,
    ["�"] = 20,
    ["�"] = 21,
    ["�"] = 22,
    ["�"] = 23,
    ["�"] = 24,
  }
  return KV[param]
end
