rollout DecalQualitySwap "Preview_change" width:160 height:92
(
	button updateBTN "Update" pos:[20,53] width:120 height:25
	dropDownList ddl1 "Quality" pos:[20,3] width:120 height:40 items:#("Coarse", "Medium", "Fine") 
	on ddl1 selected sel do
	(
		if DecalQualitySwap.ddl1.items == "Coarse" then
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
		else if DecalQualitySwap.ddl1.items == "Medium" then
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
		else if DecalQualitySwap.ddl1.items == "Fine" then
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
	
)

createdialog DecalQualitySwap 