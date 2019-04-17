------------Stress Test
function scrollBarTest()
	for i=1,1000 do
		dgsCreateScrollBar(50+1*i,200,20,500,false)
	end
end
function memoTest()
	for i=1,1000 do
		dgsCreateMemo(50+1*i,200,500,500,"",false)
	end
end
function editTest()
	for i=1,1000 do
		dgsCreateEdit(50,100+10*i,500,40,"",false)
	end
end
------------

function createTest()
	dgsAddEasingFunction("test_line",[[
		return math.abs(progress^2-0.5)*2
	]])
	
	wind = dgsCreateWindow(0.2*sW,0,0.4*sW,0.4*sH,"Example Scroll Pane (exclude this window)",false)
	pane = dgsCreateScrollPane(20,0,200,200,false,wind)
	dgsScrollPaneSetScrollBarState(pane,false)
	scrollbar = dgsCreateScrollBar(0,0,20,180,false,false,wind)
	dgsSetProperty(scrollbar,"theScrollPane",pane)
	dgsSetProperty(scrollbar,"functions",[[
		local scb = dgsScrollPaneGetScrollBar(dgsElementData[self].theScrollPane)[1]
		dgsElementData[self].multiplier = dgsElementData[scb].multiplier
		dgsElementData[self].length = dgsElementData[scb].length
	]])
	addEventHandler("onDgsScrollPaneScroll",pane,function(vertical)
		dgsScrollBarSetScrollPosition(scrollbar,vertical)
	end)
	
	addEventHandler("onDgsScrollBarScrollPositionChange",scrollbar,function(value)
		local scbs = dgsScrollPaneGetScrollBar(pane)
		dgsScrollBarSetScrollPosition(scbs[1],value)
	end)
	
	gdlt = dgsCreateImage(0.5,0,1.1,1.1,_,true,pane,tocolor(255,255,255,255))
	gdlt2 = dgsCreateImage(0.1,0,0.7,0.7,_,true,pane,tocolor(0,255,255,255))
	dgsSizeTo(wind,0.5*sW,0.5*sH,false,false,"test_line",1000)
end

function createTest2()
	tabp = dgsCreateTabPanel(400,200,400,400,false)
	tab1 = dgsCreateTab("DGS",tabp)
	tab2 = dgsCreateTab("Tab",tabp)
	for i=1,10 do
		dgsCreateTab(i.."Panel",tabp)
	end
	gdlt2 = dgsCreateButton(0,0,100,120,"test",false,tab1,tocolor(255,255,255,255))
	dgsSetProperty(gdlt2,"shadow",{1,1,tocolor(0,0,0,255),true})
end

function createTest3()
	local rb1= dgsCreateRadioButton(500,500,200,30,"aaaa",false)
	local rb2 = dgsCreateRadioButton(500,520,200,30,"bbbb",false)
	local rb3 = dgsCreateRadioButton(500,540,200,30,"bbbb",false)
end

function createTest4()
	local window = dgsCreateWindow(100,100,400,400,"test",false)
	tabp = dgsCreateTabPanel(0,0,400,400,false,window)
	tab1 = dgsCreateTab("DGS",tabp)
	rb1 = dgsCreateComboBox(0,0,200,30,"test",false,tab1)
	for i=1,20 do
		dgsComboBoxAddItem(rb1,i)
	end
end

function createTest5()
	local cb1 = dgsCreateCheckBox(500,500,200,30,"test_indeterminate",false)
	local cb2 = dgsCreateCheckBox(500,520,200,30,"test_checked",false)
	local cb2 = dgsCreateCheckBox(500,540,200,30,"test_unchecked",false)
	dgsCheckBoxSetSelected(cb1,nil)
end

function testButtonDisable()
	local button = dgsCreateButton(500,500,200,80,"test",false)
	dgsSetEnabled(button,false)
end

function testMoveHandler()
	local window = dgsCreateWindow(100,100,800,800,"test",false)
	local button = dgsCreateButton(500,0,200,80,"test",false,window)

end

function testProgressBar()
	local pb= dgsCreateProgressBar(500,500,200,30,false)
	dgsProgressBarSetProgress(pb,50)
end

function testButtonPerformance()
	for i=1,1000 do
		local button = dgsCreateButton(500,500,200,80,"test",false)
	end
end

function createTestMemo()
	local sW,sH = dgsGetScreenSize()
	local memo = dgsCreateMemo(500,200,200,300,[[This is a dgs-dxmemo
	
	Thisdp's
	DirectX
	Graphical User Interface
	System
	
	MTA DxLib
	Version 2.88
	Test UTF8: 你好
	Test Selection
	
	DGS Memo Updates
	1.Added Scroll Bars
	2.Fix backspace and delete doesn't works well
	
	Very looooooooooong
	Test Scroll Bars
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10]],false)
	--dgsMemoSetReadOnly(memo,true)
end

function createTestMemo()
	local sW,sH = dgsGetScreenSize()
	local memo = dgsCreateMemo(500,200,200,300,[[DGS DirectX Memo Line Changing Test]],false)
	dgsMemoSetScrollBarState(memo,false,false)
	dgsMemoSetWordWarpState(memo,2)
	--dgsMemoSetReadOnly(memo,true)
end

function editTest() --Test Tab Switch for edit.
	edit = dgsCreateEdit(0.3,0.3,0.2,0.05,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaas",true)
	setTimer(function()
		dgsEditSetMaxLength(edit,10,true)
	end,1000,1)
	edit2 = dgsCreateEdit(0.3,0.4,0.2,0.05,"123123",true)
	edit3 = dgsCreateEdit(0.3,0.5,0.2,0.05,"123123",true)
	edit4 = dgsCreateEdit(0.3,0.6,0.2,0.05,"123123",true)
	dgsEditSetReadOnly(edit4,true)
	dgsBringToFront(edit,"left")
	dgsEditSetCaretPosition (edit, 1)

	dgsSetProperty(edit,"bgcolor",tocolor(255,255,255,0))
end

function editTest4()
	window = dgsCreateWindow(200,200,800,600,"",false)
	tabp = dgsCreateTabPanel(400,200,400,400,false,window)
	tab1 = dgsCreateTab("DGS",tabp)
	tab1 = dgsCreateTab("DGS",tabp)
	tab1 = dgsCreateTab("DGS",tabp)
	edit = dgsCreateEdit(0.1,0.3,0.8,0.5,"123123",true,tab1)
	addEventHandler("onDgsTabPanelTabSelect",tabp,function(new,old,newEle,oldEle)
	end)
end

function edatest()
	local eda = dgsCreateEDA(400,400,300,100,false)
	dgsEDASetDebugModeEnabled(eda,true)
end

function gridlistTest()
	gridlist = dgsCreateGridList(300,50,600,600,false)
	dgsSetProperty(gridlist,"clip",false)
	--dgsSetProperty(gridlist,"leading",10)
	--dgsSetProperty(gridlist,"mode",true)
	dgsGridListAddColumn(gridlist,"test1",0.2)
	dgsGridListAddColumn(gridlist,"test2",0.1)
	for i=1,500 do
		local row = dgsGridListAddRow(gridlist)
		dgsGridListSetItemText(gridlist,row,1,tostring(i).." Test DGS")
		dgsGridListSetItemText(gridlist,row,2,tostring(50-i).." Test DGS")
	end
	dgsGridListSetMultiSelectionEnabled(gridlist,true)
	dgsGridListSetSelectedItems(gridlist,{{true,true,true}})
	configGridList(gridlist)
	dgsGridListSetColumnFont(gridlist,1,"default-bold")
end

function centerEdit()
	edit = dgsCreateEdit(100,300,300,100,"TestTestTest",false)
	dgsSetProperty(edit,"alignment","center")
end

function dgsAnimTest()
	if not dgsEasingFunctionExists("shadowOffset") then
		dgsAddEasingFunction("shadowOffset",[[
			local old = setting[3] or {}
			local new = setting[2]
			local offsetX = old[1] or 0
			local offsetY = old[2] or 0
			local offsetColor = old[3] or tocolor(0,0,0,255)
			local tofX,tofY = new[1],new[2]
			return {offsetX+(tofX-offsetX)*progress,offsetY+(tofY-offsetY)*progress,new[3]}
		]])
	end
	local label = dgsCreateLabel(500,500,400,20,"Testttttttttttttttttttt",false)
	dgsAnimTo(label,"shadow",{100,100,tocolor(0,0,0,255)},"shadowOffset",10000)
end


function GridListSortingTest()
	for x=1,10 do
		local sortfnc = [[
			local arg = {...}
			local column = dgsElementData[self].sortColumn
			return arg[1][column][1] < arg[2][column][1]
		]]

		--Be More Clear
		local sortfnc = [[
			local arg = {...}
			local a = arg[1]
			local b = arg[2]
			local column = dgsElementData[self].sortColumn
			local texta,textb = a[column][1],b[column][1]
			return texta < textb
		]]
		
		gridlist = dgsCreateGridList(200,50,600,600,false)
		dgsGridListAddColumn(gridlist,"test1",0.2)
		--dgsGridListAddColumn(gridlist,"test2",0.1)
		dgsSetProperty(gridlist,"mode",true)
		for i=1,30 do
			local row = dgsGridListAddRow(gridlist)
			dgsGridListSetItemText(gridlist,row,1,tostring(i).." Test DGS")
			--dgsGridListSetItemText(gridlist,row,2,tostring(500-i).." Test DGS")
		end
		--dgsGridListSetSortEnabled(gridlist,false) --disable click sorting
		--dgsGridListSetSortFunction(gridlist,sortfnc)
		--dgsGridListSetSortColumn(gridlist,2)
	end
end

function Plugin_media()
	bro = dgsCreateMediaBrowser(600,600)
	rndRect1 = dgsCreateRoundRect(1,tocolor(255,255,255,255),bro)
	material1 = dgsCreate3DInterface(0,0,4,4,2,800,500,tocolor(255,255,255,255),1,0,0,_,0)
	img = dgsCreateImage(0,0,800,500,rndRect1,false,material1)
	dgsMediaLoadMedia(bro,"test.webm","VIDEO") -- Give a video file PLZ! (Only .webm file)
	--dgsMediaLoadMedia(bro,"test.ogg","AUDIO") -- Give a audio file PLZ! (Only .ogg file)
	dgsMediaPlay(bro)
end

function testBrowser()
	local browser = dgsCreateBrowser(200,200,400,400,false,_,false,true)
	addEventHandler("onClientBrowserCreated",browser,function()
		loadBrowserURL(browser,"http://www.youtube.com")
	end)
end

function test3DInterface()
	material1 = dgsCreate3DInterface(0,0,3,2,2,400,400,tocolor(255,255,255,255),1,0,0,_,56)
	--material2 = dgsCreate3DInterface(0,0,3,2,2,400,400,tocolor(255,255,255,255),1,0,0)
	edit1 = dgsCreateEdit(0,0,1,1,"DGS 3D Interface Edit 1",true,material1)
	--edit2 = dgsCreateEdit(0,0,0.4,0.2,"DGS 3D Interface Edit 1",true,material2)
	--edit2 = dgsCreateEdit(0,100,200,50,"DGS 3D Interface Edit 2",false,material)
	--dgs3DInterfaceAttachToElement(material,localPlayer,0,0,0,0,1,0)

end

function exampleDetectArea()
	local image = dgsCreateImage(200,200,100,100,_,false)
	local da = dgsCreateDetectArea(0,0,100,100,false,image)
	dgsDetectAreaSetFunction(da,[[
		if mxRlt^2+myRlt^2 < 0.5 then
			return true
		end

	]])
end

function test3DText()
	local text = dgsCreate3DText(0,0,4,"DGS 3D Text Test",white)
	dgsSetProperty(text,"fadeDistance",20)
	dgsSetProperty(text,"shadow",{1,1,tocolor(0,0,0,255),true})
	dgsSetProperty(text,"outline",{"out",1,tocolor(255,255,255,255)})
	dgs3DTextAttachToElement(text,localPlayer,0,5)
end

function languageTest_ComboBox()
	languageTab = {wtf="DGS %rep%"}
	languageTab2 = {wtf="Test %rep% %rep%"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	combobox = dgsCreateComboBox(500,400,200,30,{"wtf","1"},false)
	for i=1,20 do
		dgsComboBoxAddItem(combobox,{"wtf",i})
	end
	dgsSetProperty(combobox,"scrollBarThick",15)
	setTimer(function()
		dgsSetTranslationTable("test",languageTab2)
	end,1000,1)
end

function languageTest_GridList()
	languageTab = {wtf="DGS %rep%",test="Test Lang1"}
	languageTab2 = {wtf="Test %rep% %rep%",test="Test Lang2"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	gridlist = dgsCreateGridList (0.51, 0.54, 0.16, 0.14, true )
	dgsGridListAddColumn(gridlist,{"test"},0.5)
	dgsGridListAddColumn(gridlist,{"test"},0.5)
	for i=1,5000 do
		local row = dgsGridListAddRow(gridlist)
		dgsGridListSetItemText(gridlist,row,1,{"wtf",i,i})
		dgsGridListSetItemText(gridlist,row,2,tostring(50-i).." Test DGS")
	end
	setTimer(function()
		dgsSetTranslationTable("test",languageTab2)
	end,1000,1)
end

function languageTest_label()
	languageTab = {wot="D-G-S %rep%"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14, {"wtf"}, true )
	dgsSetText(label,{"wot","1"})
end

function languageTest_TabPanel()
	languageTab = {wtf="DGS %rep%",test="Test Lang1"}
	languageTab2 = {wtf="Test %rep% %rep%",test="Test Lang2"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	tabp = dgsCreateTabPanel(400,200,400,400,false)
	tab1 = dgsCreateTab({"wtf"},tabp)
	tab2 = dgsCreateTab("Tab",tabp)
	for i=1,10 do
		dgsCreateTab(i.."Panel",tabp)
	end
	gdlt2 = dgsCreateButton(10,0,100,120,"test",false,tab1,tocolor(255,255,255,255))
	dgsSetProperty(gdlt2,"shadow",{1,1,tocolor(0,0,0,255),true})
	setTimer(function()
		dgsSetTranslationTable("test",languageTab2)
	end,1000,1)
end

function dgsRoundRectTest()
	local rndRect1 = dgsCreateRoundRect(1,tocolor(0,0,0,150))
	local image1 = dgsCreateImage(200,200,400,100,rndRect1,false)
	local rndRect2 = dgsCreateRoundRect(0.5,tocolor(0,0,0,150))
	local image2 = dgsCreateImage(200,400,400,100,rndRect2,false)
end

function test_switchButton()
	local button = dgsCreateSwitchButton(200,200,100,25,"on","off",false)
end

function testShader()
	--Circle
	local circle = dxCreateShader("shaders/circle.fx")
	local image = dgsCreateImage(300,300,400,400,circle,false)
end
-----------------------------OOP Test
function oopTest()
	loadstring(dgsImportOOPClass())()-- load OOP class
	window1 = DGSClass:createWindow(0,0,0.5,0.1,"test",true) --create a window with oop
	window2 = DGSClass:createWindow(0.2,0,0.5,0.1,"test",true) --create a window with oop
	label = window1:createLabel(0,0,1,1,"label",true) --create a label inside the window
	label.parent = window2
end
-----------------------------DGS Animation With Shader Example
--Example 1, Simple Button Effect
function testButtonEffect()
	local bEffect = dxCreateShader("shaders/ButtonEffect.fx")				--Create our shader
	local button = dgsCreateButton(300,300,200,100,"Button",false)			--Create our dgs button
	dgsSetProperty(button,"image",{bEffect,bEffect,bEffect})				--Set all image of dgs button as shader
	dgsAddEasingFunction("ButtonEffect_1",[[								--Define our custom easing function that can be only used in dgs
		local shader = propertyTable.image[1]								--Get the shader
		local circleRadius = dgsGetProperty(self,"circleRadius") or 0		--Get the property value
		circleRadius = circleRadius+(setting[2]-circleRadius)*progress		--Calculate the changing
		if isElement(shader) and dgsGetType(shader) == "shader" then		--Is the shader existing?
			dxSetShaderValue(shader,"radius",circleRadius*8)				--If so, then set shader value
		end
		return circleRadius													--Return the property value
	]])
	
	function dgsButtonEffectHandler(mx,my)
		if dgsIsAniming(source) then dgsStopAniming(source) end				--If it is animating, then suspend it
		local wid,hei = dgsGetSize(source,false)							--Get the size of the dgs button to calculate the ratio and the mouse relative position
		local x,y = dgsGetPosition(source,false)							--Get the position of the dgs button to calculate the mouse relative position
		local ratio = wid/hei												--Calculate the ratio
		local shader = dgsGetProperty(source,"image")[1]					--Get the shader
		if not isElement(shader) then return false end						--If there is no shader, then jump out
		dxSetShaderValue(shader,"ratio",ratio)								--Set ratio
		local mouseRltX,mouseRltY = (mx-x)/wid,(my-y)/hei					--Get mouse relative position
		dxSetShaderValue(shader,"circlePos",{mouseRltX,mouseRltY})			--Push in to shader
		if eventName == "onDgsMouseEnter" then								--Animation in onDgsMouseEnter
			dgsAnimTo(source,"circleRadius",1,"ButtonEffect_1",800)				--Let's Do It!
		else																--Animation in onDgsMouseLeave
			dgsAnimTo(source,"circleRadius",0,"ButtonEffect_1",600)				--Let's Do It Reverse!
		end
	end
	addEventHandler("onDgsMouseEnter",button,dgsButtonEffectHandler)
	addEventHandler("onDgsMouseLeave",button,dgsButtonEffectHandler)
end
