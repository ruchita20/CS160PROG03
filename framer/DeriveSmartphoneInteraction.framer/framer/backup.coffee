# This imports all the layers for "DeriveWatch" into derivewatchLayers
PSD2 = Framer.Importer.load "imported/DeriveWatch"

invite = PSD2.deriveInvite
facemaps = PSD2.facemaps
interestpoint=PSD2.interestpoint
destination=PSD2.destination

accept =  PSD2.deriveInvite.subLayers[2]
decline =  PSD2.deriveInvite.subLayers[1]

accept.on Events.Click, (event, layer) ->
	facemaps.placeBefore(invite)
facemaps.on Events.Click, (event, layer) ->
	interestpoint.placeBefore(facemaps)
interestpoint.on Events.Click, (event, layer) ->
	destination.placeBefore(interestpoint)
	



	



