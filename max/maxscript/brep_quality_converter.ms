(
fn brepInitError = 
(
		
		messageBox "Power Nurbs Plugin has not been initialised properly.\nTo initialise, please select a Brep object and press the 'Visibility' Button.\nThis only needs to be done once per Max Session." \
			title:"Brep Speed Up Tools"
		
)
fn SetBrepQuality quality = 
( 
	try 
	(
		/*
		setCommandPanelTaskMode #modify
		disableSceneRedraw()
		
		for a = 1 to objArr.count do 
		(
			
			if classOf objArr[a].baseObject == Pwr_EditNRB do 
			(
				
				--Select object and select base object
				select objArr[a]
				modPanel.setCurrentObject objArr[a].baseObject
				
				--Get modify panel hwnd
				modifyPanel = for c in windows.getChildrenHWND #max where c[4] == "ModifyTask" do exit with c[1]
				
				--Get visibility button hwnd and press
				visibilityButton = for c in UIAccessor.GetChildWindows modifyPanel where UIAccessor.GetWindowText c == "Visibility" do exit with c
				UIAccessor.PressButton visibilityButton
				
				--Get auto orient button hwnd and press
				autoOrientButton = for b in UIAccessor.GetChildWindows modifyPanel where UIAccessor.GetWindowText b == "Auto Orient" do exit with b
				UIAccessor.PressButton autoOrientButton
				
			)
			format "Object % of % Processed - %\% Complete \n" a objArr.count (((100.00/objArr.count)*a) as integer)
		)
		
		select objArr
		enableSceneRedraw()
		*/
		if quality == 1 and $ != undefined then 
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
		else if quality== 2 and $ != undefined then
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
		else if quality == 3 and $ != undefined then
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
	catch
	(
				brepInitError()
				enableSceneRedraw()
	)

	
)

Global DecalQualitySwap


try (destroydialog DecalQualitySwap)catch()



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

)
