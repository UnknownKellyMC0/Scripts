local PlaceIdHandler = {}
PlaceIdHandler.callbacks = {}
PlaceIdHandler.missingPlaceCallback = nil

function PlaceIdHandler:RegisterCallback(placeId, callback)
    self.callbacks[placeId] = callback
end

function PlaceIdHandler:SetMissingPlaceCallback(callback)
    self.missingPlaceCallback = callback
end

function PlaceIdHandler:DetectPlaceId()
    local success, placeId = pcall(function()
        return game.PlaceId
    end)

    if success and placeId then
        self:HandlePlaceId(placeId)
    else
        self:HandleMissingPlaceId()
    end
end

function PlaceIdHandler:HandlePlaceId(placeId)
    local callback = self.callbacks[placeId]
    if callback then
        callback(placeId)
    else
        warn("No callback registered for PlaceId:", placeId)
    end
end

function PlaceIdHandler:HandleMissingPlaceId()
    warn("Failed to detect PlaceId.")
    if self.missingPlaceCallback then
        self.missingPlaceCallback()
    end
end

return PlaceIdHandler
