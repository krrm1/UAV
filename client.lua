local uav = nil
local uavModel = GetHashKey("shahed136")
local uavCoords = vec3(-1491.78, -2479.61, 12.97)
local uavHeading = 154.53

local uavFlying = false


local uavtracking = false


local uavCamera = false


local uavCameraActive = false


local uavCameraZoom = 0.0


local uavCameraZoomSpeed = 0.1


local uavCameraZoomMax = 1.0


local pilot = nil
local pilotModel = GetHashKey("s_m_y_pilot_01")

local UavModel = function ()
    if not IsModelInCdimage(uavModel) then return end RequestModel(uavModel)while not HasModelLoaded(uavModel) do
    Wait(0)
    end
    uav = CreateVehicle(uavModel, uavCoords, uavHeading, true, false)
    SetModelAsNoLongerNeeded(uavModel)
    Wait(500)
    SetVehicleEngineOn(uav, true, true, false)
end

local UavPilot = function ()
    if not IsModelInCdimage(pilotModel) then return end RequestModel(pilotModel)while not HasModelLoaded(pilotModel) do
    Wait(0)
    end
    pilot = CreatePed(4, pilotModel, uavCoords, uavHeading, true, false)
    SetModelAsNoLongerNeeded(pilotModel)
    SetPedIntoVehicle(pilot, uav, -1)
end

RegisterCommand("spawnuav", function()
    UavModel()
    print("UAV spawned successfully.")
    Wait(500)
    UavPilot()
    print("UAV pilot spawned successfully.")
    print("UAV is ready for operation.")
end, false)