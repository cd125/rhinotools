
fn SetBrepQuality quality = 
(
	if quality == 1 then
	(
		$.LowQualityVDS = on
		$.MediumQualityVDS = off
		$.HighQualityVDS = off
		$.IsoAngleDS = 15
		$.IsoChordHeightVDS = 0
		$.FaceApproxAngleVDS = 30
		$.EdgeApproxAngleVDS = 0
		$.FaceChordHeightVDS = 1
		$.EdgeChordHeightVDS = 0
		$.MaxEdgeLengthPctVDS = 0
		
	)
else if quality== 2 then
	(
		$.LowQualityVDS = off
		$.MediumQualityVDS = on
		$.HighQualityVDS = off
		$.IsoAngleDS = 7
		$.IsoChordHeightVDS = 0
		$.FaceApproxAngleVDS = 15
		$.EdgeApproxAngleVDS = 0
		$.FaceChordHeightVDS = 0.1
		$.EdgeChordHeightVDS = 0
		$.MaxEdgeLengthPctVDS = 0
	)			
else if quality == 3 then
	(
		$.LowQualityVDS = off
		$.MediumQualityVDS = off
		$.HighQualityVDS = on
		$.IsoAngleDS = 3
		$.IsoChordHeightVDS = 0
		$.FaceApproxAngleVDS = 10
		$.EdgeApproxAngleVDS = 0
		$.FaceChordHeightVDS = 0.02
		$.EdgeChordHeightVDS = 0
		$.MaxEdgeLengthPctVDS = 0
	)
)

rollout DecalQualitySwap "Decals_quality" width:160 height:92
(
	button updateBTN "Update" pos:[20,53] width:120 height:25
	dropDownList ddl1 "Quality" pos:[20,3] width:120 height:40 items:#("Coarse", "Medium", "Fine") 
	
	
		


	on updateBTN pressed do
	(
		SetBrepQuality(ddl1.selection)		
		
	)
)

createdialog DecalQualitySwap 