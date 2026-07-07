' Warning : Do not use vTable and Invoke/Dispatch methods on the same program !
'           It will be duplicated constants and type confusion 
'           or use different prefix to differentiate them ...

'================================================================================
'CLSID - EWDraw ActiveX Control module?{F6C21C7B-8EF8-41A3-85F1-7B8D5F7433CA}
'================================================================================
'Const CLSID_ewEWdraw="{05870C58-4F79-46F1-AE70-BCEBE4A53FE9}"     'EWDraw Control

'================================================================================
'ProgID - EWDraw ActiveX Control module?{F6C21C7B-8EF8-41A3-85F1-7B8D5F7433CA}
'================================================================================
'Const ProgID_EWdraw="EWDRAW.EWDrawCtrl.1"

'================================================================================
'Invoke - EWDraw ActiveX Control module?{F6C21C7B-8EF8-41A3-85F1-7B8D5F7433CA}
'================================================================================
'================================================================================
'Dispatch ew_DAdraw     ?Dispatch interface for EWDraw Control
'Const IID_ew_DAdraw="{28D4BD95-AEEB-48A0-A50D-9D4F5D97349E}"
'================================================================================

'ANYPTR=ANY PTR
'BOL=BOOL
'INT=IINTEGER
'DBL=DOUBLE
'STR=BSTR
'WSTR=WSTRING
'VAR=VARIANT
'P=PTR

' tenemos llamadas a tres versiones:
' 15.3.5  de 2015, con solo 7 comandos extras expeciales de la version CAE
' 15.5.2  de 2015, con la que he trabajado los ultimos años 
' 15.9.4  de 2018, la ultima moderna en la que puedo trabajar sin problemas de TRIAL VERSION

Type _DAdraw
	' -------------------------------
	' exclusivas CAE V15.3.5
   InitCAE As tMember=(636,2,1,1) '(ID.INT).BOL
	SetCAECellSize As tMember=(637,2,1,1) '(cs.DBL).ANYPTR
	SetCAECellType As tMember=(638,2,1,1) '(type.INT).ANYPTR
	EnableDisplayCAEWireframe As tMember=(639,2,1,1) '(isOn.BOL).ANYPTR
	GetRectangleNum As tMember=(640,2,0,1) '().INT
	GetRectangle As tMember=(641,2,13,1) '(index.INT,X1.DBL.P,Y1.DBL.P,z1.DBL.P,X2.DBL.P,Y2.DBL.P,z2.DBL.P,x3.DBL.P,y3.DBL.P,z3.DBL.P,x4.DBL.P,y4.DBL.P,z4.DBL.P).BOL
	MeshAddIndexTriangleByType As tMember=(643,2,7,1) '(v1.INT,v2.INT,v3.INT,nx.DBL,ny.DBL,nz.DBL,t.INT).INT
	' -------------------------------
           
			
	' -------------------------------		
	' comunes hasta la V15.5.2 
	AboutBox As tMember=(-552,2,0,1) '().ANYPTR
	Undo As tMember=(391,2,0,1) '().ANYPTR
	Redo As tMember=(392,2,0,1) '().ANYPTR

	SaveEwd As tMember=(31,2,1,1) '(filename.STR).BOL
	OpenEwd As tMember=(32,2,1,1) '(filename.STR).BOL

	ImpFile As tMember=(63,2,1,1) '(filename.STR).BOL
	ExpFile As tMember=(64,2,1,1) '(filename.STR).BOL

	Imp3DSFile As tMember=(312,2,1,1) '(filename.STR).INT

	IMPOBJ As tMember=(340,2,1,1) '(filename.STR).INT
	EXPOBJ As tMember=(350,2,2,1) '(ent.INT,filename.STR).INT

	IMPSTL As tMember=(346,2,1,1) '(filename.STR).INT
	EXPSTL As tMember=(347,2,3,1) '(ent.INT,filename.STR,isBin.BOL).INT

	IMPDXF As tMember=(29,2,1,1) '(filename.STR).BOL	
	IMPDXFMesh As tMember=(348,2,1,1) '(filename.STR).INT
	EXPDXFMesh As tMember=(349,2,2,1) '(ent.INT,filename.STR).INT

	IMPStep214 As tMember=(377,2,1,1) '(filename.STR).INT
	EXPStep214 As tMember=(376,2,1,1) '(filename.STR).BOL
	
	IMPIges214 As tMember=(378,2,1,1) '(filename.STR).INT
	EXPIges214 As tMember=(379,2,1,1) '(filename.STR).INT

	SaveMaterialLib As tMember=(588,2,1,1) '(libname.STR).ANYPTR
	LoadMaterialLib As tMember=(589,2,1,1) '(libnam.STR).BOL

	InsertImage As tMember=(30,2,3,1) '(filename.STR,lbp.VAR,rtp.VAR).INT

	SaveBMPWithRatio As tMember=(620,2,3,1)   '(file.STR,width.INT,cIndex.SHR).BOL
	PreviewToBMP As tMember=(563,2,4,1) '(filename.STR,width.SHR,height.SHR,colorindex.SHR).BOL
	SaveViewToBMP As tMember=(272,2,4,1) '(filename.STR,width.SHR,height.SHR,colorindex.SHR).BOL

	PrintView As tMember=(70,2,0,1) '().ANYPTR
	ChangePrinter As tMember=(196,2,0,1) '().BOL
    	
	InsertBlockFromFile As tMember=(191,2,7,1) '(filename.STR,insertpt.VAR,xscale.DBL,yscale.DBL,zscale.DBL,angle.DBL,axis.VAR).INT

	LoadUserCursor As tMember=(482,2,1,1) '(filename.STR).BOL	
	
	
' ------------------------------------
	AddLayer As tMember=(2,2,5,1) '(layerName.STR,lineColor.SHR,lineWidth.DBL,lineType.SHR,isCurrent.BOL).BOL
	AddOne2DVertex As tMember=(11,2,3,1) '(x.DBL,y.DBL,bulge.DBL).ANYPTR
	AddOne3DVertex As tMember=(12,2,3,1) '(x.DBL,y.DBL,z.DBL).ANYPTR
	AddEntToExp As tMember=(67,2,1,1) '(ID.INT).INT
	AddSectionID As tMember=(105,2,1,1) '(ent.INT).ANYPTR
	AddEntToBlockBuffer As tMember=(193,2,1,1) '(ent.INT).BOL
	AddOrRemoveSelect As tMember=(247,2,1,1) '(ent.INT).BOL
	AddOneWeight As tMember=(280,2,1,1) '(weight.DBL).ANYPTR
	AddOneKnot As tMember=(281,2,1,1) '(knot.DBL).ANYPTR
	AddOneMultiplicity As tMember=(282,2,1,1) '(multiplicity.SHR).ANYPTR
	AddUVNodes As tMember=(306,2,2,1) '(Uvalue.DBL,Vvalue.DBL).ANYPTR
	AddIndexTriangles As tMember=(307,2,3,1) '(n1.INT,n2.INT,n3.INT).ANYPTR
	AddWiresToFace As tMember=(321,2,1,1) '(ent.INT).BOL
	AddSymbolToLib As tMember=(355,2,2,1) '(ent.INT,SymbolName.STR).BOL
	AddEntToUnite As tMember=(364,2,1,1) '(ent.INT).ANYPTR
	AddIDToBuffer As tMember=(426,2,1,1) '(ent.INT).ANYPTR
	AddMeshVertex As tMember=(446,2,9,1) '(meshid.INT,x.DBL,y.DBL,z.DBL,cRed.INT,cGreen.INT,cBlue.INT,u.DBL,v.DBL).INT
	AddMeshTriangle As tMember=(453,2,7,1) '(meshid.INT,n1.INT,n2.INT,n3.INT,nx.DBL,ny.DBL,nz.DBL).INT

    
' ----------------------------
	ToDrawPolyLine As tMember=(177,2,0,1) '().INT
	ToSetDrawPoint As tMember=(178,2,1,1) '(pnt.VAR).ANYPTR
	ToDrawLine As tMember=(207,2,0,1) '().INT
	ToSetDrawDist As tMember=(208,2,1,1) '(dist.DBL).ANYPTR
	ToSetDrawAngle As tMember=(209,2,1,1) '(angle.DBL).ANYPTR
	ToDrawArc As tMember=(210,2,0,1) '().INT
	ToDrawRectang As tMember=(211,2,0,1) '().INT
	ToDrawCircle As tMember=(212,2,0,1) '().INT
	ToDrawBSPline As tMember=(213,2,0,1) '().INT
	ToDrawEllipse As tMember=(214,2,0,1) '().INT
	ToDrawEllipseArc As tMember=(215,2,0,1) '().INT
	ToDrawPoint As tMember=(216,2,0,1) '().INT
	ToDrawBox As tMember=(217,2,0,1) '().INT
	ToDrawCylinder As tMember=(218,2,0,1) '().INT
	ToDrawSphere As tMember=(219,2,0,1) '().INT
	ToDrawCone As tMember=(220,2,0,1) '().INT
	ToDrawTorus As tMember=(221,2,0,1) '().INT
	ToDrawCopy As tMember=(224,2,0,1) '().ANYPTR
	ToDrawMove As tMember=(225,2,0,1) '().ANYPTR
	ToDrawRotate As tMember=(226,2,0,1) '().ANYPTR
	ToDrawScale As tMember=(227,2,0,1) '().ANYPTR
	ToDrawPrism As tMember=(236,2,0,1) '().INT
	ToDrawDelete As tMember=(237,2,0,1) '().ANYPTR
	ToDrawPipe As tMember=(238,2,0,1) '().INT
	ToDrawMirror As tMember=(239,2,0,1) '().INT
	ToDrawUnion As tMember=(240,2,0,1) '().INT
	ToDrawSubtract As tMember=(241,2,0,1) '().INT
	ToDrawIntersect As tMember=(242,2,0,1) '().INT
	ToDrawMakeFace As tMember=(243,2,0,1) '().INT
	ToDrawOffset As tMember=(244,2,0,1) '().INT
	ToDrawRevol As tMember=(245,2,0,1) '().INT
	ToDrawThruSections As tMember=(246,2,0,1) '().INT
	ToDraw2DText As tMember=(254,2,0,1) '().ANYPTR
	ToDrawImage As tMember=(255,2,0,1) '().ANYPTR
	ToDrawColor As tMember=(256,2,0,1) '().ANYPTR
	ToDrawFillet As tMember=(257,2,0,1) '().ANYPTR
	ToDrawChamfer As tMember=(259,2,0,1) '().ANYPTR
	ToDrawBreak As tMember=(260,2,0,1) '().ANYPTR
	ToDrawExtend As tMember=(266,2,0,1) '().ANYPTR
	ToDrawWedge As tMember=(410,2,0,1) '().INT
	ToDrawPushPull As tMember=(544,2,0,1) '().INT
	ToDrawTrim As tMember=(546,2,0,1) '().ANYPTR
	ToDrawPolygon As tMember=(547,2,0,1) '().INT
	ToDrawDiameterDim As tMember=(549,2,0,1) '().INT
	ToDrawRadiusDim As tMember=(550,2,0,1) '().INT
	ToDrawLinearDim As tMember=(551,2,0,1) '().INT
	ToDrawAngleDim As tMember=(552,2,0,1) '().INT
	ToDrawPointDim As tMember=(553,2,0,1) '().INT
	ToDrawQDim As tMember=(555,2,0,1) '().INT
	ToDrawLinearDimByPt As tMember=(559,2,0,1) '().INT
	ToDrawShell As tMember=(577,2,0,1) '().INT
	ToDrawOffsetFace As tMember=(578,2,0,1) '().INT
	ToDrawTexFaceOfSolid As tMember=(581,2,0,1) '().ANYPTR

' ----------------------------
	GetImpEntSize As tMember=(65,2,0,1) '().INT
	GetImpEntID As tMember=(66,2,1,1) '(index.INT).INT
	GetEntLength As tMember=(74,2,1,1) '(ID.INT).DBL
	GetEntArea As tMember=(75,2,1,1) '(ID.INT).DBL
	GetEntVolume As tMember=(76,2,1,1) '(ID.INT).DBL
	GetEntBoundingBox As tMember=(81,2,7,1) '(ID.INT,minX.DBL.P,minY.DBL.P,minZ.DBL.P,maxX.DBL.P,maxY.DBL.P,maxZ.DBL.P).BOL
	GetCoordinate As tMember=(85,2,3,1) '(x.DBL.P,y.DBL.P,z.DBL.P).ANYPTR
	Get3DPtBufSize As tMember=(88,2,0,1) '().INT
	Get3DPtBuf As tMember=(89,2,4,1) '(index.INT,x.DBL.P,y.DBL.P,z.DBL.P).BOL
	GetEntColor As tMember=(92,2,1,1) '(ID.INT).SHR
	GetEntWidth As tMember=(93,2,1,1) '(ID.INT).DBL
	GetEntLineType As tMember=(94,2,1,1) '(ID.INT).SHR
	GetLayerColor As tMember=(141,2,1,1) '(layerName.STR).SHR
	GetLayerLineType As tMember=(142,2,1,1) '(layerName.STR).SHR
	GetLayerLineWidth As tMember=(143,2,1,1) '(layerName.STR).DBL
	GetLayerOn As tMember=(144,2,1,1) '(layerName.STR).BOL
	GetLayerSize As tMember=(145,2,0,1) '().SHR
	GetLayerName As tMember=(146,2,1,1) '(index.SHR).STR
	GetTransparency As tMember=(147,2,1,1) '(ID.INT).DBL
	GetSelectEntSize As tMember=(153,2,0,1) '().INT
	GetSelectEnt As tMember=(154,2,1,1) '(index.INT).INT
	GetPointStyle As tMember=(158,2,3,1) '(pointtype.SHR.P,color.SHR.P,scale.DBL.P).ANYPTR
	GetEntType As tMember=(161,2,1,1) '(ID.INT).SHR
	GetCurLayerName As tMember=(163,2,0,1) '().STR
	GetEntSize As tMember=(164,2,0,1) '().INT
	GetEntID As tMember=(165,2,1,1) '(index.INT).INT
	GetTriangleNum As tMember=(171,2,0,1) '().INT
	GetTriangle As tMember=(172,2,10,1) '(index.INT,X1.DBL.P,Y1.DBL.P,z1.DBL.P,X2.DBL.P,Y2.DBL.P,z2.DBL.P,x3.DBL.P,y3.DBL.P,z3.DBL.P).BOL
	GetCornerOfFillet As tMember=(176,2,10,1) '(index.INT,p1x.DBL.P,p1y.DBL.P,p1z.DBL.P,p2x.DBL.P,p2y.DBL.P,p2z.DBL.P,p3x.DBL.P,p3y.DBL.P,p3z.DBL.P).BOL
	GetCornerDirection As tMember=(179,2,4,1) '(index.INT,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetCornerSize As tMember=(180,2,0,1) '().INT
	GetEntityUserData As tMember=(182,2,1,1) '(ID.INT).STR
	GetNearestPoint As tMember=(183,2,7,1) '(ent.INT,inX.DBL,inY.DBL,inZ.DBL,outX.DBL.P,outY.DBL.P,outZ.DBL.P).BOL
	GetPreviewBMP As tMember=(195,2,2,1) '(filename.STR,imagefile.STR).BOL
	GetBlockEntSize As tMember=(199,2,0,1) '().INT
	GetBlockEntID As tMember=(200,2,1,1) '(index.INT).INT
	GetDefineBlockSize As tMember=(201,2,0,1) '().INT
	GetDefineBlockName As tMember=(202,2,1,1) '(index.INT).STR
	GetBlockEntName As tMember=(203,2,1,1) '(index.INT).STR
	GetPoint As tMember=(206,2,3,1) '(x.DBL.P,y.DBL.P,z.DBL.P).BOL
	GetEntDirection As tMember=(222,2,7,1) '(ent.INT,x.DBL.P,y.DBL.P,z.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetEntSel As tMember=(223,2,0,1) '().INT
	GetLinePoint As tMember=(229,2,10,1) '(ent.INT,spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetPolyLineSegment As tMember=(230,2,12,1) '(ent.INT,index.SHR,spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P,isArc.BOL.P).BOL
	GetPolyLineSegmentSize As tMember=(231,2,1,1) '(ent.INT).INT
	GetNearestSegment As tMember=(232,2,5,1) '(ent.INT,inX.DBL,inY.DBL,inZ.DBL,index.SHR.P).BOL
	GetEntIntersectPoints As tMember=(258,2,3,1) '(ent1.INT,ent2.INT,isInfinit.BOL).SHR
	GetExplodeIDBufferSize As tMember=(261,2,0,1) '().INT
	GetExplodeIDBuffer As tMember=(262,2,1,1) '(index.INT).INT
	GetOneEntSel As tMember=(263,2,3,1) '(x.DBL.P,y.DBL.P,z.DBL.P).INT
	GetArc As tMember=(264,2,10,1) '(ent.INT,cx.DBL.P,cy.DBL.P,cz.DBL.P,radius.DBL.P,startAngle.DBL.P,endAngle.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetArc3P As tMember=(265,2,10,1) '(ent.INT,X1.DBL.P,Y1.DBL.P,z1.DBL.P,X2.DBL.P,Y2.DBL.P,z2.DBL.P,x3.DBL.P,y3.DBL.P,z3.DBL.P).BOL
	GetCircle As tMember=(267,2,8,1) '(ent.INT,cx.DBL.P,cy.DBL.P,cz.DBL.P,radius.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetDist As tMember=(270,2,6,1) '(spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P).DBL
	GetPrintArea As tMember=(273,2,4,1) '(width.SHR.P,height.SHR.P,offsetX.SHR.P,offsetY.SHR.P).ANYPTR
	GetPrintPageSize As tMember=(274,2,4,1) '(width.SHR.P,height.SHR.P,offsetX.SHR.P,offsetY.SHR.P).ANYPTR
	GetPrintName As tMember=(275,2,0,1) '().STR
	GetViewLogicSize As tMember=(276,2,2,1) '(width.SHR.P,height.SHR.P).ANYPTR
	GetPrinterResolution As tMember=(277,2,2,1) '(PIXELSX.SHR.P,PIXELSY.SHR.P).ANYPTR
	GetViewWindow As tMember=(278,2,5,1) '(minX.SHR.P,minY.SHR.P,maxX.SHR.P,maxY.SHR.P,isZoom.BOL).BOL
	GetKnotsSize As tMember=(283,2,0,1) '().SHR
	GetWeightsSize As tMember=(284,2,0,1) '().SHR
	GetMultiplicitiesSize As tMember=(285,2,0,1) '().SHR
	GetNURBS As tMember=(289,2,1,1) '(ent.INT).BOL
	GetNURBSWeight As tMember=(293,2,2,1) '(index.SHR,weight.DBL.P).BOL
	GetNURBSKnot As tMember=(294,2,2,1) '(index.SHR,knot.DBL.P).BOL
	GetNURBSMultiplicity As tMember=(295,2,2,1) '(index.SHR,multiplicity.SHR.P).BOL
	Get2DSegment As tMember=(317,2,7,1) '(index.INT,spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P).BOL
	GetEntityNormalize As tMember=(320,2,4,1) '(ent.INT,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetCopyFaceIDBuffer As tMember=(334,2,1,1) '(index.INT).INT
	GetViewProj As tMember=(343,2,3,1) '(vx.DBL.P,vy.DBL.P,vz.DBL.P).ANYPTR
	GetSectionIDBufferSize As tMember=(344,2,0,1) '().INT
	GetSectionIDBuffer As tMember=(345,2,1,1) '(index.INT).INT
	GetSymbolCounts As tMember=(359,2,0,1) '().INT
	GetSymbolName As tMember=(360,2,1,1) '(index.SHR).STR
	GetSymbolPreview As tMember=(361,2,2,1) '(SymbolName.STR,PreviewName.STR).BOL
	GetEntLayer As tMember=(373,2,1,1) '(ent.INT).STR
	GetPointCoordinate As tMember=(374,2,4,1) '(ent.INT,ptX.DBL.P,ptY.DBL.P,ptZ.DBL.P).BOL
	Get3DSolidSection As tMember=(381,2,3,1) '(ent.INT,origin.VAR,vec.VAR).INT
	GetEllipse As tMember=(396,2,17,1) '(ent.INT,cx.DBL.P,cy.DBL.P,cz.DBL.P,rad1.DBL.P,rad2.DBL.P,startAngle.DBL.P,endAngle.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P,XDirX.DBL.P,XDirY.DBL.P,XDirZ.DBL.P,YDirX.DBL.P,YDirY.DBL.P,YDirZ.DBL.P).BOL
	GetIDBufferSize As tMember=(399,2,0,1) '().INT
	GetIDBuffer As tMember=(400,2,1,1) '(index.INT).INT
	GetEntDistance As tMember=(404,2,8,1) '(ent1.INT,ent2.INT,X1.DBL.P,Y1.DBL.P,z1.DBL.P,X2.DBL.P,Y2.DBL.P,z2.DBL.P).DBL
	GetWorkPlane As tMember=(415,2,12,1) '(orgX.DBL.P,orgY.DBL.P,orgZ.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P,xDirX.DBL.P,xDirY.DBL.P,xDirZ.DBL.P,yDirX.DBL.P,yDirY.DBL.P,yDirZ.DBL.P).ANYPTR
	GetMeshVertexSize As tMember=(439,2,1,1) '(meshid.INT).INT
	GetMeshTriangleSize As tMember=(440,2,1,1) '(meshid.INT).INT
	GetMeshVertex As tMember=(441,2,10,1) '(meshid.INT,index.INT,x.DBL.P,y.DBL.P,z.DBL.P,cRed.INT.P,cGreen.INT.P,cBlue.INT.P,u.DBL.P,v.DBL.P).BOL
	GetMeshTriangle As tMember=(442,2,8,1) '(meshid.INT,index.INT,n1.INT.P,n2.INT.P,n3.INT.P,nx.DBL.P,ny.DBL.P,nz.DBL.P).BOL
	GetMeshTextureFile As tMember=(454,2,1,1) '(meshid.INT).STR
	GetMeshTextureParameter As tMember=(455,2,8,1) '(meshid.INT,mode.SHR.P,urepeat.DBL.P,vrepeat.DBL.P,uorigin.DBL.P,vorigin.DBL.P,uscale.DBL.P,vscale.DBL.P).BOL
	GetFlatTextWH As tMember=(509,2,3,1) '(tID.INT,width.INT.P,height.INT.P).BOL
	GetViewZSize As tMember=(522,2,0,1) '().DBL
	GetAllBoundingBox As tMember=(523,2,6,1) '(minX.DBL.P,minY.DBL.P,minZ.DBL.P,maxX.DBL.P,maxY.DBL.P,maxZ.DBL.P).ANYPTR
	GetResultValue As tMember=(535,2,1,1) '(vIndex.INT).DBL
	GetFontSize As tMember=(564,2,0,1) '().INT
	GetFontName As tMember=(565,2,1,1) '(inX.INT).STR
	GetEntName As tMember=(569,2,1,1) '(iID.INT).STR
	GetEntAxisSel As tMember=(571,2,0,1) '().INT
	GetAxis As tMember=(572,2,7,1) '(ID.INT,bx.DBL.P,by.DBL.P,bz.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetDimTxt As tMember=(624,2,0,1) '().DBL
	GetDimPrePost As tMember=(628,2,0,1) '().STR
	GetDimSufPost As tMember=(629,2,0,1) '().STR
	GetSolidBnd As tMember=(630,2,7,1) '(ent.INT,minX.DBL.P,minY.DBL.P,minZ.DBL.P,maxX.DBL.P,maxY.DBL.P,maxZ.DBL.P).BOL
	GetVecByPtOfWire As tMember=(632,2,5,1) '(ent.INT,pnt.VAR,vx.DBL.P,vy.DBL.P,vz.DBL.P).BOL
	GetPointByLength As tMember=(634,2,5,1) '(ent.INT,u.DBL,x.DBL.P,y.DBL.P,z.DBL.P).ANYPTR
	GetTriangleNomAndUV As tMember=(635,2,16,1) '(index.INT,nx1.DBL.P,ny1.DBL.P,nz1.DBL.P,u1.DBL.P,v1.DBL.P,nx2.DBL.P,ny2.DBL.P,nz2.DBL.P,u2.DBL.P,v2.DBL.P,nx3.DBL.P,ny3.DBL.P,nz3.DBL.P,u3.DBL.P,v3.DBL.P).BOL
	GetProcInfo As tMember=(700,2,5,1) '(info.STR,isGetPoint.BOL,isGetAngle.BOL,isGetValue.BOL,isGetEnt.BOL).ANYPTR

' ----------------------------
	SetDisplayTrihedron As tMember=(73,2,1,1) '(isDisplay.BOL).ANYPTR
	SetLayerOn As tMember=(1,2,2,1) '(layerName.STR,isOn.BOL).ANYPTR
	SetPointType As tMember=(22,2,3,1) '(color.SHR,marker.SHR,scale.DBL).BOL
	SetPolyLineClose As tMember=(41,2,1,1) '(isClose.BOL).ANYPTR
	SetSingleSelect As tMember=(47,2,1,1) '(isSingle.BOL).ANYPTR
	SetGridOn As tMember=(48,2,1,1) '(isOn.BOL).ANYPTR
	SetGridValue As tMember=(49,2,5,1) '(xvalue.DBL,yvalue.DBL,xlength.DBL,ylength.DBL,iGridType.SHR).ANYPTR
	SetEntColor As tMember=(53,2,2,1) '(ent.INT,color.SHR).BOL
	SetSurfaceGrid As tMember=(60,2,2,1) '(row.SHR,col.SHR).ANYPTR
	SetSurfacePoint As tMember=(61,2,3,1) '(row.SHR,col.SHR,pnt.VAR).ANYPTR
	SetTransparency As tMember=(69,2,2,1) '(ID.INT,transparency.DBL).BOL
	SetEntLineType As tMember=(71,2,2,1) '(ID.INT,lineType.SHR).BOL
	SetEntLineWidth As tMember=(72,2,2,1) '(ID.INT,width.DBL).BOL
	SetEntTexture As tMember=(77,2,8,1) '(ID.INT,aTFileName.STR,toScaleU.DBL,toScaleV.DBL,toRepeatU.DBL,toRepeatV.DBL,originU.DBL,originV.DBL).BOL

	SetBackGroundImage As tMember=(389,2,1,1) '(ImageName.STR).ANYPTR	
    SetBackGroundColor As tMember=(78,2,1,1) '(iColor.SHR).BOL
	SetLayerColor As tMember=(138,2,2,1) '(layerName.STR,iColor.SHR).BOL
	SetHilightColor As tMember=(167,2,1,1) '(color.SHR).BOL
	SetSelectionColor As tMember=(168,2,1,1) '(color.SHR).BOL    
    
	SetCurLayer As tMember=(82,2,1,1) '(layerName.STR).BOL
	SetEntLayer As tMember=(84,2,2,1) '(ID.INT,layerName.STR).BOL
	SetRegister As tMember=(86,2,1,1) '(License.STR).ANYPTR
	SetViewCondition As tMember=(114,2,1,1) '(con.SHR).ANYPTR
	SetLayerLineType As tMember=(139,2,2,1) '(layerName.STR,iLineType.SHR).BOL
	SetLayerLineWidth As tMember=(140,2,2,1) '(layerName.STR,dWidth.DBL).BOL
	SetViewDisplayMode As tMember=(148,2,1,1) '(mode.SHR).ANYPTR
	SetPointStyle As tMember=(157,2,3,1) '(pointtype.SHR,color.SHR,scale.DBL).ANYPTR
	SetDisplayToolBar As tMember=(169,2,1,1) '(isDisplay.BOL).ANYPTR
	SetEntityUserData As tMember=(181,2,2,1) '(ID.INT,data.STR).BOL
	SetPrintScale As tMember=(197,2,4,1) '(printunit.DBL,drawunit.DBL,printunittype.SHR,isScaletoFit.BOL).BOL
	SetPrintOffset As tMember=(198,2,3,1) '(offX.DBL,offY.DBL,offsetunittype.SHR).BOL
	SetOSNAPMode As tMember=(204,2,1,1) '(mode.SHR).BOL
	SetViewProj As tMember=(235,2,3,1) '(vx.DBL,vy.DBL,vz.DBL).ANYPTR
	SetViewHideMode As tMember=(268,2,1,1) '(isHide.BOL).ANYPTR
	Set3DPtBuf As tMember=(296,2,4,1) '(index.SHR,x.DBL,y.DBL,z.DBL).BOL
	SetNURBSWeight As tMember=(298,2,2,1) '(index.SHR,weight.DBL).BOL
	SetNURBSKnot As tMember=(300,2,2,1) '(index.SHR,knot.DBL).BOL
	SetNURBSMultiplicity As tMember=(302,2,2,1) '(index.SHR,multiplicity.SHR).BOL
	SetMeshTexture As tMember=(310,2,8,1) '(texturefile.STR,mode.SHR,urepeat.DBL,vrepeat.DBL,uorigin.DBL,vorigin.DBL,uscale.DBL,vscale.DBL).ANYPTR
	SetSelectMode As tMember=(315,2,1,1) '(mode.SHR).ANYPTR
	SetPrintOptimize As tMember=(318,2,1,1) '(isEnable.BOL).ANYPTR
	SetEntityInvisible As tMember=(319,2,2,1) '(ent.INT,isInvisible.BOL).BOL
    
	SetORTHOAngle As tMember=(323,2,1,1) '(angle.DBL).ANYPTR
	SetORTHO As tMember=(205,2,1,1) '(isOn.BOL).ANYPTR
    
	SetDimExe As tMember=(325,2,1,1) '(value.DBL).ANYPTR
	SetDimExo As tMember=(326,2,1,1) '(value.DBL).ANYPTR
	SetDimAsz As tMember=(327,2,1,1) '(value.DBL).ANYPTR
	SetDimTxsty As tMember=(328,2,1,1) '(value.STR).ANYPTR
	SetDimTxt As tMember=(329,2,1,1) '(value.DBL).ANYPTR
	SetDimGap As tMember=(330,2,1,1) '(value.DBL).ANYPTR
	SetDimDec As tMember=(331,2,1,1) '(value.SHR).ANYPTR
    
	SetMeshSectionPlan As tMember=(341,2,3,1) '(ent.INT,origin.VAR,vec.VAR).INT
	SetCurSymbolLib As tMember=(356,2,1,1) '(SymbolLibName.STR).ANYPTR
	SetEntDisplayMode As tMember=(368,2,2,1) '(ent.INT,mode.SHR).BOL
	SetMeshHeightColor As tMember=(369,2,3,1) '(ent.INT,fromColor.SHR,toColor.SHR).BOL
	SetProcInvisible As tMember=(380,2,1,1) '(isInvisible.INT).ANYPTR
	SetAnimationMode As tMember=(382,2,1,1) '(isOn.BOL).ANYPTR
	SetPerspectiveMode As tMember=(383,2,1,1) '(isOn.BOL).BOL
	SetDeviationCoefficient As tMember=(386,2,1,1) '(angle.DBL).ANYPTR

	SetPointsToBSPlineDegree As tMember=(402,2,2,1) '(DegMin.SHR,DegMax.SHR).ANYPTR
	SetShapeSmooth As tMember=(407,2,1,1) '(level.SHR).ANYPTR
	SetWorkPlane As tMember=(408,2,2,1) '(origin.VAR,vec.VAR).ANYPTR
	SetOldPts2BSPline As tMember=(412,2,1,1) '(isOn.BOL).ANYPTR
	SetWorkPlaneBySolid As tMember=(413,2,0,1) '().ANYPTR
	SetWorkPlaneOrgPt As tMember=(414,2,1,1) '(origin.VAR).ANYPTR
	SetAnimationAx3 As tMember=(424,2,7,1) '(ent.INT,origin.VAR,vec.VAR,xDir.VAR,ax1origin.VAR,ax1vec.VAR,angle.DBL).ANYPTR
	SetEdge2SurfaceMaxDegree As tMember=(427,2,1,1) '(iMaxDeg.SHR).ANYPTR
	SetEdge2SurfaceMaxSeg As tMember=(428,2,1,1) '(iMaxDeg.SHR).ANYPTR
	SetBooleanOperationTolerance As tMember=(429,2,1,1) '(tol.DBL).BOL
	SetMeshVertex As tMember=(443,2,10,1) '(meshid.INT,index.INT,x.DBL,y.DBL,z.DBL,cRed.INT,cGreen.INT,cBlue.INT,u.DBL,v.DBL).BOL
	SetMeshTriangle As tMember=(444,2,8,1) '(meshid.INT,index.INT,n1.INT,n2.INT,n3.INT,nx.DBL,ny.DBL,nz.DBL).BOL
	SetBooleanOperationTolMode As tMember=(451,2,1,1) '(mode.SHR).ANYPTR
	SetMeshTextureParameter As tMember=(456,2,8,1) '(meshid.INT,mode.SHR,urepeat.DBL,vrepeat.DBL,uorigin.DBL,vorigin.DBL,uscale.DBL,vscale.DBL).BOL
	SetMeshTextureFile As tMember=(457,2,2,1) '(meshid.INT,texturefile.STR).BOL
	SetAnimationImmediate As tMember=(460,2,1,1) '(isOn.BOL).ANYPTR
	SetBSPlinePeriodic As tMember=(483,2,1,1) '(isOn.BOL).ANYPTR
	SetExpCoefficient As tMember=(487,2,1,1) '(coe.DBL).ANYPTR
	SetSingleFuncRegister As tMember=(490,2,1,1) '(License.STR).ANYPTR
	SetFlatTextPos As tMember=(496,2,3,1) '(tID.INT,wx.INT,wy.INT).BOL
	SetFlatTextWH As tMember=(497,2,3,1) '(tID.INT,width.INT,height.INT).BOL
	SetFlatTextFont As tMember=(498,2,3,1) '(tID.INT,font.STR,fontsize.INT).BOL
	SetFlatTextColor As tMember=(499,2,10,1) '(tID.INT,tR.INT,tG.INT,tB.INT,bR.INT,bG.INT,bB.INT,eR.INT,eG.INT,eB.INT).BOL
	SetFlatTextBndSpace As tMember=(500,2,5,1) '(tID.INT,topspace.INT,leftspace.INT,bottomspace.INT,rightspace.INT).BOL
	SetFlatTextBndThickness As tMember=(501,2,2,1) '(tID.INT,thickness.INT).BOL
	SetFlatLinePos As tMember=(504,2,5,1) '(tID.INT,wsx.INT,wsy.INT,wex.INT,wey.INT).BOL
	SetFlatLineColor As tMember=(505,2,4,1) '(tID.INT,cR.INT,cG.INT,cB.INT).BOL
	SetFlatLineWidth As tMember=(506,2,2,1) '(tID.INT,width.INT).BOL
	SetUpdateFlatImmediate As tMember=(508,2,1,1) '(isImmediate.BOL).ANYPTR
	SetDimPost As tMember=(511,2,2,1) '(prefix.STR,suffix.STR).ANYPTR
	SetDimTAD As tMember=(512,2,1,1) '(tad.DBL).ANYPTR
	SetDimClr As tMember=(513,2,3,1) '(cR.INT,cG.INT,cB.INT).ANYPTR
	SetDimLwd As tMember=(514,2,1,1) '(lwd.DBL).ANYPTR
	SetFlatLineType As tMember=(521,2,2,1) '(tID.INT,ltype.INT).BOL
	SetPipeAlign As tMember=(537,2,1,1) '(isCenter.BOL).ANYPTR
	SetAfterMakeBlock As tMember=(541,2,1,1) '(mode.SHR).ANYPTR
	SetAutoBndBox As tMember=(543,2,1,1) '(isAuto.BOL).ANYPTR
	SetRelateTol As tMember=(548,2,1,1) '(tol.DBL).ANYPTR
	SetTrimTolerance As tMember=(556,2,1,1) '(tol.DBL).BOL
	SetWireOfShape As tMember=(558,2,2,1) '(iColor.INT,iWidth.INT).ANYPTR
	SetEntName As tMember=(570,2,2,1) '(iID.INT,entname.STR).BOL
	SetAxisStyle As tMember=(573,2,2,1) '(len.DBL,rad.DBL).BOL
	SetAxis As tMember=(574,2,7,1) '(ID.INT,bx.DBL,by.DBL,bz.DBL,vx.DBL,vy.DBL,vz.DBL).BOL
	SetSelAxisMode As tMember=(576,2,1,1) '(mode.INT).ANYPTR
	SetTexFaceOfSolid As tMember=(580,2,8,1) '(file.STR,uorigin.DBL,vorigin.DBL,urepeat.DBL,vrepeat.DBL,ScaleU.DBL,ScaleV.DBL,transparency.DBL).ANYPTR
	SetTexLibPath As tMember=(582,2,1,1) '(path.STR).BOL
	SetTextureAngle As tMember=(584,2,1,1) '(ang.DBL).ANYPTR
	SetDimAZIN As tMember=(585,2,1,1) '(type.INT).ANYPTR
	SetKeepTex As tMember=(619,2,1,1) '(type.SHR).ANYPTR
	SetSolidLineWidth As tMember=(625,2,1,1) '(width.INT).ANYPTR
	SetISOLineMode As tMember=(633,2,1,1) '(mode.INT).ANYPTR


' ---- materiales y texturas
	AddMaterial As tMember=(590,2,1,1) '(material.STR).BOL   
    '
	SetEntMaterial As tMember=(587,2,2,1) '(ent.INT,material.STR).ANYPTR
	SetDiffuseOfMaterial As tMember=(592,2,6,1) '(material.STR,diffuseCoef.DBL,r.SHR,g.SHR,b.SHR,isOn.BOL).BOL
	SetAmbientOfMaterial As tMember=(593,2,6,1) '(material.STR,ambientCoef.DBL,r.SHR,g.SHR,b.SHR,isOn.BOL).BOL
	SetSpecularOfMaterial As tMember=(594,2,6,1) '(material.STR,specularCoef.DBL,r.SHR,g.SHR,b.SHR,isOn.BOL).BOL
	SetEmissiveOfMaterial As tMember=(595,2,6,1) '(material.STR,emissiveCoef.DBL,r.SHR,g.SHR,b.SHR,isOn.BOL).BOL
	SetShininessOfMaterial As tMember=(596,2,2,1) '(material.STR,shininessCoef.DBL).BOL
	SetEnvReflexionOfMaterial As tMember=(597,2,2,1) '(material.STR,envreflexionCoef.DBL).BOL
	SetMaterialType As tMember=(604,2,2,1) '(material.STR,type.SHR).BOL
    '
	GetDiffuseOfMaterial As tMember=(598,2,6,1) '(material.STR,diffuseCoef.DBL.P,r.SHR.P,g.SHR.P,b.SHR.P,isOn.BOL.P).BOL
	GetAmbientOfMaterial As tMember=(599,2,6,1) '(material.STR,ambientCoef.DBL.P,r.SHR.P,g.SHR.P,b.SHR.P,isOn.BOL.P).BOL
	GetSpecularOfMaterial As tMember=(600,2,6,1) '(material.STR,specularCoef.DBL.P,r.SHR.P,g.SHR.P,b.SHR.P,isOn.BOL.P).BOL
	GetEmissiveOfMaterial As tMember=(601,2,6,1) '(material.STR,emissiveCoef.DBL.P,r.SHR.P,g.SHR.P,b.SHR.P,isOn.BOL.P).BOL
	GetShininessOfMaterial As tMember=(602,2,2,1) '(material.STR,shininessCoef.DBL.P).BOL
	GetEnvReflexionOfMaterial As tMember=(603,2,2,1) '(material.STR,envreflexionCoef.DBL.P).BOL
	GetMaterialType As tMember=(605,2,2,1) '(material.STR,type.SHR.P).BOL
	CopyMaterial As tMember=(617,2,2,1) '(destination.STR,source.STR).BOL
	DeleteMaterial As tMember=(591,2,1,1) '(material.STR).BOL
 
 
' --- posiblemente, RAYTRACER
	EnableRayTrace As tMember=(613,2,1,1) '(isOn.BOL).BOL 
 	SetRayTraceDepth As tMember=(616,2,1,1) '(depth.INT).BOL
 	SetLightOn As tMember=(607,2,2,1) '(name.STR,isOn.BOL).BOL
	SetLightPosition As tMember=(611,2,2,1) '(name.STR,pos.VAR).BOL
	SetLightDirection As tMember=(612,2,2,1) '(name.STR,dir.VAR).BOL
	SetLightColor As tMember=(614,2,4,1) '(name.STR,r.SHR,g.SHR,b.SHR).BOL
	AddDirectionalLight As tMember=(606,2,5,1) '(name.STR,r.SHR,g.SHR,b.SHR,dir.VAR).BOL
	AddPositionalLight As tMember=(609,2,7,1) '(name.STR,r.SHR,g.SHR,b.SHR,pos.VAR,fact1.DBL,fact2.DBL).BOL
	AddSpotLight As tMember=(610,2,10,1) '(name.STR,r.SHR,g.SHR,b.SHR,pos.VAR,dir.VAR,ang.DBL,fact1.DBL,fact2.DBL,cn.DBL).BOL
	DeleteLight As tMember=(608,2,1,1) '(name.STR).BOL
	SetCamera As tMember=(384,2,2,1) '(at.VAR,eye.VAR).ANYPTR
	SetCameraAngle As tMember=(385,2,1,1) '(angle.DBL).ANYPTR
	

' ----------------------------
	EnableUndoRedo As tMember=(390,2,1,1) '(isEnable.INT).ANYPTR
	EnableDrag As tMember=(403,2,1,1) '(isEnable.INT).ANYPTR
	EnableAntialiasing As tMember=(406,2,1,1) '(isOn.BOL).ANYPTR
	EnableUCS As tMember=(411,2,1,1) '(isOn.BOL).ANYPTR
	EnableDisplayLenAng As tMember=(419,2,1,1) '(isOn.BOL).ANYPTR
	EnableMeshUVMode As tMember=(448,2,2,1) '(meshid.INT,isUVMode.BOL).ANYPTR
	EnableMeshColorMode As tMember=(449,2,2,1) '(meshid.INT,isColorMode.BOL).ANYPTR
	EnablePolyline2DToUCS As tMember=(538,2,1,1) '(isEnable.BOL).ANYPTR
	EnableWireOfShape As tMember=(557,2,1,1) '(isOn.BOL).ANYPTR


' ----------------------------
	DisableRightMenu As tMember=(314,2,1,1) '(isDisable.BOL).ANYPTR
	DisableLenDimArrow As tMember=(623,2,1,1) '(mode.INT).ANYPTR

' ----------------------------
	IsSelected As tMember=(248,2,1,1) '(ent.INT).BOL
	Is3DSolidIntersect As tMember=(339,2,2,1) '(ent1.INT,ent2.INT).BOL
	IsExistSymbol As tMember=(357,2,1,1) '(SymbolName.STR).BOL
	Is3DSolidCollision As tMember=(405,2,2,1) '(ent1.INT,ent2.INT).BOL
	IsUCS As tMember=(418,2,0,1) '().BOL
	IsSupportFunction As tMember=(422,2,1,1) '(sfname.STR).BOL
	IsUCSSameDirAx As tMember=(493,2,0,1) '().BOL
	IsEndCommand As tMember=(494,2,0,1) '().BOL
	IsLockLayer As tMember=(530,2,1,1) '(layerName.STR).BOL
	IsPlotLayer As tMember=(532,2,1,1) '(layerName.STR).BOL
	IsFreezeLayer As tMember=(534,2,1,1) '(layerName.STR).BOL
	IsIntersectAABBs As tMember=(631,2,12,1) '(minx1.DBL,miny1.DBL,minz1.DBL,maxx1.DBL,maxy1.DBL,maxz1.DBL,minx2.DBL,miny2.DBL,minz2.DBL,maxx2.DBL,maxy2.DBL,maxz2.DBL).BOL

	

	' entidades
	Torus As tMember=(21,2,4,1) '(cen.VAR,r1.DBL,r2.DBL,vec.VAR).INT
	TorusAngle As tMember=(59,2,7,1) '(cen.VAR,r1.DBL,r2.DBL,angle1.DBL,angle2.DBL,angle.DBL,vec.VAR).INT

	Arc_ As tMember=(3,2,5,1) '(cen.VAR,radius.DBL,startAngle.DBL,endAngle.DBL,vec.VAR).INT
	Arc3P As tMember=(4,2,3,1) '(pnt1.VAR,pnt2.VAR,pnt3.VAR).INT

	Circle_ As tMember=(5,2,3,1) '(cen.VAR,radius.DBL,vec.VAR).INT
	Circle3P As tMember=(6,2,3,1) '(pnt1.VAR,pnt2.VAR,pnt3.VAR).INT

	Ellipse_ As tMember=(7,2,4,1) '(cen.VAR,majorradius.DBL,minorradius.DBL,vec.VAR).INT
	Polygon_ As tMember=(8,2,5,1) '(num.SHR,cen.VAR,radius.DBL,vec.VAR,type.SHR).INT

	Line_ As tMember=(9,2,2,1) '(pnt1.VAR,pnt2.VAR).INT
	Point_ As tMember=(10,2,1,1) '(pnt.VAR).INT

	PolyLine2D As tMember=(13,2,1,1) '(isClose.BOL).INT
	PolyLine3D As tMember=(14,2,1,1) '(isClose.BOL).INT

	Box As tMember=(15,2,4,1) '(pnt.VAR,dx.DBL,dy.DBL,dz.DBL).INT
	Box2P As tMember=(16,2,2,1) '(pnt1.VAR,pnt2.VAR).INT
	BoxDirect As tMember=(17,2,5,1) '(pnt.VAR,dx.DBL,dy.DBL,dz.DBL,vec.VAR).INT

	Cone As tMember=(18,2,5,1) '(cen.VAR,r1.DBL,r2.DBL,height.DBL,vec.VAR).INT
	Cylinder As tMember=(19,2,4,1) '(cen.VAR,radius.DBL,height.DBL,vec.VAR).INT

	Sphere As tMember=(20,2,2,1) '(cen.VAR,radius.DBL).INT

	MoveTo_ As tMember=(23,2,3,1) '(ID.INT,from.VAR,to.VAR).INT
	Copy As tMember=(24,2,3,1) '(ID.INT,from.VAR,to.VAR).INT
	scale As tMember=(25,2,3,1) '(ID.INT,cen.VAR,.DBL).INT
	Rotate As tMember=(26,2,4,1) '(ID.INT,cen.VAR,vec.VAR,angle.DBL).INT
	Mirror As tMember=(27,2,3,1) '(ID.INT,cen.VAR,vec.VAR).INT
	Text As tMember=(28,2,5,1) '(str.STR,font.STR,bpt.VAR,high.DBL,Rotate.DBL).INT

	Revol As tMember=(33,2,2,1) '(ent.INT,axis.INT).INT
	Prism As tMember=(36,2,3,1) '(ent.INT,high.DBL,vec.VAR).INT


	' solidos BOOLEAN
	Union_ As tMember=(37,2,2,1)     '(ent1.INT,ent2.INT).INT
	Subtract As tMember=(38,2,2,1)   '(ent1.INT,ent2.INT).INT
	Intersect As tMember=(39,2,2,1)  '(ent1.INT,ent2.INT).INT
	Xor_ As tMember=(545,2,2,1)      '(ent1.INT,ent2.INT).INT

	Delete_ As tMember=(112,2,1,1) '(ID.INT).BOL
	Pipe_ As tMember=(51,2,2,1) '(spine.INT,profile.INT).INT
	Join As tMember=(388,2,2,1) '(ent1.INT,ent2.INT).INT	
	Clear2DPtBuf As tMember=(34,2,0,1) '().ANYPTR
	Clear3DPtBuf As tMember=(35,2,0,1) '().ANYPTR
	DeleteAll As tMember=(40,2,0,1) '().ANYPTR
	Offset As tMember=(45,2,3,1) '(.DBL,ent.INT,pnt.VAR).INT
	ClearSelected As tMember=(46,2,0,1) '().ANYPTR
	Wedge As tMember=(50,2,9,1) '(pnt.VAR,vec.VAR,dx.DBL,dy.DBL,dz.DBL,xmin.DBL,zmin.DBL,xmax.DBL,zmax.DBL).INT
	ThruSections As tMember=(52,2,2,1) '(isSolid.BOL,Ruled.BOL).INT
	ArcOfEllipse As tMember=(54,2,6,1) '(cen.VAR,majorradius.DBL,minorradius.DBL,startAngle.DBL,endAngle.DBL,vec.VAR).INT
	BSPline As tMember=(55,2,1,1) '(isClose.BOL).INT
	SphereAngle As tMember=(56,2,5,1) '(cen.VAR,radius.DBL,angle1.DBL,angle2.DBL,angle3.DBL).INT
	CylinderAngle As tMember=(57,2,5,1) '(cen.VAR,radius.DBL,height.DBL,angle.DBL,vec.VAR).INT
	ConeAngle As tMember=(58,2,6,1) '(cen.VAR,r1.DBL,r2.DBL,height.DBL,angle.DBL,vec.VAR).INT
	BSPlineSurface As tMember=(62,2,0,1) '().INT
	ClearExportID As tMember=(68,2,0,1) '().ANYPTR
	Fillet3DSolid As tMember=(79,2,3,1) '(ID.INT,fillet.DBL,jointype.SHR).BOL
	Offset3DSolid As tMember=(80,2,3,1) '(ID.INT,Offset.DBL,jointype.SHR).INT
	DeleteLayer As tMember=(83,2,1,1) '(layerName.STR).BOL
	Spiral3D As tMember=(87,2,6,1) '(pnt.VAR,loops.SHR,startRadius.DBL,hg.DBL,vg.DBL,div.SHR).INT
	CursorPos As tMember=(90,2,3,1) '(x.DBL.P,y.DBL.P,z.DBL.P).ANYPTR
	Chamfer3DSolid As tMember=(91,2,2,1) '(ID.INT,dist.DBL).BOL
	EntToFace As tMember=(113,2,2,1) '(ent.INT,isDel.BOL).INT
	
	
	' control de ventana
	ZoomALL As tMember=(123,2,0,1) '().ANYPTR
	ViewPan As tMember=(149,2,2,1) '(dx.SHR,dy.SHR).ANYPTR
	ZoomWin As tMember=(150,2,4,1) '(minX.SHR,minY.SHR,maxX.SHR,maxY.SHR).ANYPTR
	Zoom As tMember=(151,2,4,1) '(X1.SHR,Y1.SHR,X2.SHR,Y2.SHR).ANYPTR
	ViewRotate As tMember=(152,2,5,1) '(axis.SHR,angle.DBL,x.DBL,y.DBL,z.DBL).ANYPTR
	ReDrawView As tMember=(162,2,0,1) '().ANYPTR
	UpdateView As tMember=(474,2,0,1) '().ANYPTR
	ToDrawZoom As tMember=(250,2,0,1) '().ANYPTR
	ToDrawZoomAll As tMember=(251,2,0,1) '().ANYPTR
	ToDrawZoomWindow As tMember=(252,2,0,1) '().ANYPTR
	ToDrawPan As tMember=(249,2,0,1) '().ANYPTR
	ToDrawOrbit As tMember=(253,2,0,1) '().ANYPTR

	' NURBS
	NURBS As tMember=(286,2,2,1) '(Degree.SHR,Periodic.BOL).INT
	BeginNURBS As tMember=(287,2,0,1) '().ANYPTR
	EndNURBS As tMember=(288,2,0,1) '().ANYPTR
	NURBSDegree As tMember=(290,2,0,1) '().SHR
	NURBSIsPeriodic As tMember=(291,2,0,1) '().BOL
	NURBSIsRational As tMember=(292,2,0,1) '().BOL
	RemoveNURBSWeight As tMember=(299,2,1,1) '(index.SHR).BOL
	RemoveNURBSKnot As tMember=(301,2,1,1) '(index.SHR).BOL
	RemoveNURBSMultiplicity As tMember=(303,2,1,1) '(index.SHR).BOL
	ResetNURBS As tMember=(304,2,3,1) '(ent.INT,Degree.SHR,IsPeriodic.BOL).BOL

	' generales sin orden alguno
	LockScreen As tMember=(155,2,1,1) '(isLock.BOL).ANYPTR
	RGBToIndex As tMember=(156,2,3,1) '(red.DBL,green.DBL,blue.DBL).SHR
	Text3D As tMember=(159,2,6,1) '(str.STR,font.STR,lbpt.VAR,high.DBL,Rotate.DBL,thickness.DBL).INT
	Draft3DSolid As tMember=(160,2,3,1) '(ID.INT,angle.DBL,vec.VAR).BOL
	DeleteEntKind As tMember=(166,2,1,1) '(enttype.SHR).ANYPTR
	InitTriangulation As tMember=(170,2,1,1) '(ID.INT).BOL
	ClearTriangleBuffer As tMember=(173,2,0,1) '().ANYPTR
	Explode As tMember=(174,2,1,1) '(ID.INT).BOL
	Fillet3DPolyline As tMember=(175,2,2,1) '(ent.INT,fillet.DBL).INT
	BreakEntity As tMember=(184,2,5,1) '(ent.INT,pnt1.VAR,pnt2.VAR,outent1.INT.P,outent2.INT.P).BOL
	Extend As tMember=(185,2,3,1) '(boundary.INT,ent.INT,pnt.VAR).BOL
	ArcByVec As tMember=(186,2,3,1) '(pnt1.VAR,vec.VAR,pnt2.VAR).BOL
	ABCD As tMember=(187,2,4,1) '(ent1.INT,ent2.INT,pnt1.VAR,pnt2.VAR).BOL
	fillet As tMember=(188,2,5,1) '(ent1.INT,ent2.INT,pnt1.VAR,pnt2.VAR,.DBL).INT
	Chamfer As tMember=(189,2,6,1) '(ent1.INT,ent2.INT,pnt1.VAR,pnt2.VAR,dist1.DBL,dist2.DBL).INT
	Stretch As tMember=(190,2,5,1) '(ent.INT,corner1.VAR,corner2.VAR,from.VAR,to.VAR).BOL
	WBlock As tMember=(192,2,2,1) '(name.STR,basept.VAR).BOL
	ClearBlockBuffer As tMember=(194,2,0,1) '().ANYPTR
	Polar As tMember=(228,2,6,1) '(cen.VAR,vec.VAR,dist.DBL,x.DBL.P,y.DBL.P,z.DBL.P).ANYPTR
	PointDistance As tMember=(233,2,6,1) '(spX.DBL,spY.DBL,spZ.DBL,epX.DBL,epY.DBL,epZ.DBL).DBL
	PolarOnPlane As tMember=(234,2,7,1) '(pt.VAR,angle.DBL,length.DBL,VecNormalize.VAR,x.DBL.P,y.DBL.P,z.DBL.P).BOL
	InsertBlock As tMember=(269,2,7,1) '(blockname.STR,insertpt.VAR,xscale.DBL,yscale.DBL,zscale.DBL,angle.DBL,axis.VAR).INT
	IndexToRGB As tMember=(271,2,4,1) '(index.SHR,red.SHR.P,green.SHR.P,blue.SHR.P).ANYPTR

    ' esta es mejor no usar, tenemos en su lugar Vec2Var(x,y,z) que es mas directo
	MakeVariant As tMember=(279,2,3,1) '(x.DBL,y.DBL,z.DBL).VAR

	Remove3DPtBuf As tMember=(297,2,1,1) '(index.SHR).BOL
	Cylinder2P As tMember=(305,2,3,1) '(radius.DBL,pnt1.VAR,pnt2.VAR).INT
	BeginMesh As tMember=(308,2,0,1) '().ANYPTR
	EndMesh As tMember=(309,2,0,1) '().ANYPTR
	MakeMesh As tMember=(311,2,0,1) '().INT
	Project3DTo2D As tMember=(313,2,2,1) '(ent.INT,projectvec.VAR).INT
	Put2DToBuffer As tMember=(316,2,1,1) '(ent.INT).INT
	MakeFaceFromWires As tMember=(322,2,0,1) '().INT
	DimAligned As tMember=(324,2,4,1) '(dimStr.STR,pnt1.VAR,pnt2.VAR,anypnt.VAR).INT
	CompudToShape As tMember=(332,2,1,1) '(ent.INT).ANYPTR
	CopyFacesFrom3DSolid As tMember=(333,2,0,1) '().INT
	DeleteFacesFrom3DSolid As tMember=(335,2,0,1) '().BOL
	DraftFacesFrom3DSolid As tMember=(336,2,3,1) '(ent.INT,vec.VAR,angle.DBL).BOL
	ExtrudeFacesFrom3DSolid As tMember=(337,2,3,1) '(ent.INT,height.DBL,angle.DBL).BOL
	ExtrudeFacesByPathFrom3DSolid As tMember=(338,2,2,1) '(ent.INT,spine.INT).BOL
	CalculateNormalize As tMember=(342,2,6,1) '(pnt1.VAR,pnt2.VAR,pnt3.VAR,vx.DBL.P,vy.DBL.P,vz.DBL.P).ANYPTR
	ProjectPointDistance As tMember=(351,2,5,1) '(pnt1.VAR,pnt2.VAR,midpt1.VAR,midpt2.VAR,isWidth.BOL).DBL
	ForcePointToPlan As tMember=(352,2,1,1) '(isForce.BOL).ANYPTR
	ProjectLineToPlan As tMember=(353,2,10,1) '(pnt1.VAR,pnt2.VAR,orgpt.VAR,vec.VAR,spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P).ANYPTR
	TestFuntion As tMember=(354,2,1,1) '(filename.STR).INT
	DeleteSymbol As tMember=(358,2,1,1) '(SymbolName.STR).BOL
	NewSymbol As tMember=(362,2,1,1) '(isTip.BOL).ANYPTR
	EditSymbol As tMember=(363,2,1,1) '(SymbolName As WSTR.P).BOL
	MakeUniteEnity As tMember=(365,2,0,1) '().INT
	RedisplayEntity As tMember=(366,2,1,1) '(ent.INT).BOL
	MakeMeshBottom As tMember=(367,2,2,1) '(ent.INT,height.DBL).INT
	ClearSectionIDBuffer As tMember=(370,2,0,1) '().ANYPTR
	MirrorByPlane As tMember=(371,2,3,1) '(ID.INT,cen.VAR,vec.VAR).INT
	BoxDirectSense As tMember=(372,2,5,1) '(pnt.VAR,dx.DBL,dy.DBL,dz.DBL,vec.VAR).INT
	IntersectShapeWire As tMember=(375,2,2,1) '(EntShape.INT,EntWire.INT).INT
	RevolByAngle As tMember=(387,2,3,1) '(ent.INT,axis.INT,angle.DBL).INT
	Edge3Surface As tMember=(393,2,3,1) '(ent1.INT,ent2.INT,ent3.INT).INT
	Edge4Surface As tMember=(394,2,4,1) '(ent1.INT,ent2.INT,ent3.INT,ent4.INT).INT
	Split3DSolid As tMember=(395,2,3,1) '(ent.INT,origin.VAR,vec.VAR).INT
	EllipseByAxis As tMember=(397,2,6,1) '(cen.VAR,majorradius.DBL,minorradius.DBL,vec.VAR,XDirection.VAR,YDirection.VAR).INT
	ArcOfEllipseByAxis As tMember=(398,2,8,1) '(cen.VAR,majorradius.DBL,minorradius.DBL,startAngle.DBL,endAngle.DBL,vec.VAR,XDirection.VAR,YDirection.VAR).INT
	ClearIDBuffer As tMember=(401,2,0,1) '().ANYPTR
	SendCommandStr As tMember=(409,2,1,1) '(commandstr.STR).ANYPTR
	DivideEnt As tMember=(420,2,2,1) '(ent.INT,divNum.INT).BOL
	Coordinate2Screen As tMember=(421,2,5,1) '(cx.DBL,cy.DBL,cz.DBL,sX.INT.P,sY.INT.P).ANYPTR
	AbsoluteAnimation As tMember=(423,2,1,1) '(isEnable.BOL).ANYPTR
	NetworkSrf As tMember=(425,2,0,1) '().INT
	MakeSolidFromFaces As tMember=(430,2,0,1) '().INT
	MeshAddOnlyNewVertex As tMember=(431,2,8,1) '(x.DBL,y.DBL,z.DBL,cRed.INT,cGreen.INT,cBlue.INT,tU.DBL,tV.DBL).INT
	MeshAddIndexTriangle As tMember=(432,2,6,1) '(v1.INT,v2.INT,v3.INT,nx.DBL,ny.DBL,nz.DBL).INT
	MeshColorMode As tMember=(433,2,1,1) '(isColorMode.BOL).ANYPTR
	MeshTextureFile As tMember=(434,2,1,1) '(texturefile.STR).ANYPTR
	ConvertMeshToSolid As tMember=(435,2,1,1) '(meshid.INT).INT
	Split3DSolidBySurface As tMember=(436,2,2,1) '(ent.INT,surface.INT).INT
	Impress As tMember=(437,2,3,1) '(ent.INT,face.INT,Offset.DBL).INT
	ImpressWithHole As tMember=(438,2,3,1) '(ent.INT,face.INT,depth.DBL).INT
	DeleteMeshTriangle As tMember=(445,2,2,1) '(meshid.INT,index.INT).BOL
	MeshUVMode As tMember=(447,2,1,1) '(isUVMode.BOL).ANYPTR
	MakeTINMesh As tMember=(450,2,0,1) '().INT
	MakeSS As tMember=(452,2,1,1) '(ss.VAR).INT
	RotatePoint As tMember=(458,2,13,1) '(x.DBL,y.DBL,z.DBL,bax.DBL,bay.DBL,baz.DBL,vx.DBL,vy.DBL,vz.DBL,angle.DBL,ox.DBL.P,oy.DBL.P,oz.DBL.P).ANYPTR
	RotateVector As tMember=(459,2,13,1) '(x.DBL,y.DBL,z.DBL,bax.DBL,bay.DBL,baz.DBL,vx.DBL,vy.DBL,vz.DBL,angle.DBL,ox.DBL.P,oy.DBL.P,oz.DBL.P).ANYPTR
	ScalePoint As tMember=(464,2,10,1) '(x.DBL,y.DBL,z.DBL,bax.DBL,bay.DBL,baz.DBL,sca.DBL,ox.DBL.P,oy.DBL.P,oz.DBL.P).ANYPTR
	ImpressSmooth As tMember=(475,2,3,1) '(ent.INT,face.INT,Offset.DBL).INT
	CancelCommand As tMember=(485,2,0,1) '().ANYPTR
	CreateFlatText As tMember=(495,2,21,1) '(str.STR,font.STR,wx.INT,wy.INT,fontsize.INT,tR.INT,tG.INT,tB.INT,width.INT,height.INT,bR.INT,bG.INT,bB.INT,eR.INT,eG.INT,eB.INT,topspace.INT,leftspace.INT,bottomspace.INT,rightspace.INT,thickness.INT).INT
	DeleteFlatText As tMember=(502,2,1,1) '(tID.INT).BOL
	CreateFlatLine As tMember=(503,2,8,1) '(wsx.INT,wsy.INT,wex.INT,wey.INT,width.DBL,cR.INT,cG.INT,cB.INT).INT
	DeleteFlatLine As tMember=(507,2,1,1) '(tID.INT).BOL
	RadiusDimension As tMember=(510,2,4,1) '(ent.INT,isAuto.BOL,str.STR,pos.VAR).INT
	DiameterDimension As tMember=(515,2,4,1) '(ent.INT,isAuto.BOL,str.STR,pos.VAR).INT
	LengthDimension As tMember=(516,2,7,1) '(p1.VAR,p2.VAR,dimtype.INT,vec.VAR,isAuto.BOL,str.STR,pos.VAR).INT
	AngleDimension As tMember=(517,2,7,1) '(ent1.INT,ent2.INT,pnt1.VAR,pnt2.VAR,isAuto.BOL,str.STR,pos.VAR).INT
	PointDimension As tMember=(520,2,5,1) '(ent.INT,isAuto.BOL,str.STR,pos.VAR,vec.VAR).INT
	LockLayer As tMember=(529,2,2,1) '(layerName.STR,isLock.BOL).BOL
	PlotLayer As tMember=(531,2,2,1) '(layerName.STR,isPlot.BOL).BOL
	FreezeLayer As tMember=(533,2,2,1) '(layerName.STR,isFreeze.BOL).BOL
	MBlock As tMember=(536,2,2,1) '(name.STR,basept.VAR).BOL
	LockFlatTextToPt As tMember=(539,2,3,1) '(tID.INT,isLock.BOL,lockpt.VAR).BOL
	LockFlatLineToPt As tMember=(540,2,4,1) '(tID.INT,isLock.BOL,locksp.VAR,lockep.VAR).BOL
	Screen2Coordinate As tMember=(542,2,5,1) '(sX.INT,sY.INT,cx.DBL.P,cy.DBL.P,cz.DBL.P).ANYPTR
	ForcePointDimToWCS As tMember=(554,2,1,1) '(isForce.BOL).ANYPTR
	Region As tMember=(560,2,0,1) '().INT
	PickRegion As tMember=(561,2,2,1) '(sX.INT,sY.INT).INT
	RenameLayer As tMember=(562,2,2,1) '(oldname.STR,newname.STR).BOL
	InitFonts As tMember=(568,2,0,1) '().ANYPTR
	MakeAxis As tMember=(575,2,6,1) '(bx.DBL,by.DBL,bz.DBL,vx.DBL,vy.DBL,vz.DBL).INT
	Split3DSolidBySolid As tMember=(579,2,2,1) '(ent1.INT,ent2.INT).INT
	RemoveAllTex As tMember=(583,2,0,1) '().ANYPTR
	LockDelKey As tMember=(586,2,1,1) '(islockdel.BOL).ANYPTR
	ForceLineColorOnFace As tMember=(615,2,1,1) '(color.SHR).ANYPTR
	DeleteBlockDefine As tMember=(618,2,1,1) '(name.STR).BOL
	StoreView As tMember=(621,2,0,1) '().ANYPTR
	RestoreView As tMember=(622,2,0,1) '().ANYPTR
	Ax3Trasf As tMember=(626,2,6,1) '(ent.INT,origin1.VAR,dir1.VAR,origin2.VAR,dir2.VAR,xdir2.VAR).BOL
	Ax3Trasf2 As tMember=(627,2,7,1) '(ent.INT,origin1.VAR,dir1.VAR,xdir1.VAR,origin2.VAR,dir2.VAR,xdir2.VAR).BOL
	ClearRectangleBuffer As tMember=(642,2,0,1) '().ANYPTR

	VECUCS2WCS As tMember=(567,2,6,1) '(ucsVX.DBL,ucsVY.DBL,ucsVZ.DBL,wcsVX.DBL.P,wcsVY.DBL.P,wcsVZ.DBL.P).ANYPTR
	UCS2WCS As tMember=(416,2,6,1) '(ucsX.DBL,ucsY.DBL,ucsZ.DBL,wcsX.DBL.P,wcsY.DBL.P,wcsZ.DBL.P).ANYPTR
	WCS2UCS As tMember=(417,2,6,1) '(wcsX.DBL,wcsY.DBL,wcsZ.DBL,ucsX.DBL.P,ucsY.DBL.P,ucsZ.DBL.P).ANYPTR


' #######################################################################################################################
' solo en la V15.9.4.0 de 2018
	HideExplode As tMember=(636,2,1,1) '(isOn.BOL).ANYPTR
	ClearExplodeIDBuffer As tMember=(637,2,0,1) '().ANYPTR
	ClearHideExplode As tMember=(638,2,0,1) '().ANYPTR
	GetTriangleFaceIndex As tMember=(639,2,1,1) '(index.INT).INT
	KeepWorkPlaneDirectionView As tMember=(640,2,2,1) '(isOn.BOL,isCenter.BOL).ANYPTR
	GetShpClassType As tMember=(641,2,1,1) '(ent.INT).INT
	ArrayByRecangle As tMember=(642,2,5,1) '(ent.INT,rows.INT,cols.INT,rdist.DBL,cdist.DBL).INT
	ArrayByPolar As tMember=(643,2,5,1) '(ent.INT,cen.VAR,num.INT,angle.DBL,isRotate.BOL).INT
	GetWireFirstAndLastPt As tMember=(644,2,7,1) '(ent.INT,sX.DBL.P,sY.DBL.P,sz.DBL.P,ex.DBL.P,ey.DBL.P,ez.DBL.P).BOL
	EnableClusterLines As tMember=(645,2,1,1) '(isOn.BOL).ANYPTR
	RedrawClusterLines As tMember=(646,2,0,1) '().ANYPTR
	ClearClusterLines As tMember=(647,2,0,1) '().ANYPTR
	EnableAutoSetLang As tMember=(648,2,1,1) '(isOn.BOL).ANYPTR
	EnableClusterPoints As tMember=(649,2,1,1) '(isOn.BOL).ANYPTR
	RedrawClustePoints As tMember=(650,2,0,1) '().ANYPTR
	ClearClusteePoints As tMember=(651,2,0,1) '().ANYPTR
	InsertGroupFromFile As tMember=(652,2,2,1) '(name.STR,insertpt.VAR).INT
	SetGroupName As tMember=(653,2,2,1) '(grpid.INT,name.STR).BOL
	MakeGroup As tMember=(654,2,2,1) '(name.STR,basept.VAR).INT
	MakeGroupWithPlane As tMember=(655,2,5,1) '(name.STR,basept.VAR,Pln_org.VAR,Pln_dir.VAR,Pln_xdir.VAR).INT
	WriteGroup As tMember=(656,2,2,1) '(grpid.INT,filename.STR).BOL
	DeleteGroupDefine As tMember=(657,2,1,1) '(name.STR).BOL
	SetAfterMakeGroup As tMember=(658,2,1,1) '(mode.SHR).ANYPTR
	GetGroupInsPt As tMember=(659,2,4,1) '(grpid.INT,x.DBL.P,y.DBL.P,z.DBL.P).BOL
	GetGroupName As tMember=(660,2,1,1) '(grpid.INT).STR
	IsGroup As tMember=(661,2,1,1) '(grpid.INT).BOL
	SelectLang As tMember=(662,2,1,1) '(lng.INT).BOL
	GetGroupAllIDs As tMember=(663,2,1,1) '(grpid.INT).BOL
	SetHotPoint As tMember=(664,2,2,1) '(ent.INT,pnt1.VAR).BOL
	GetHotPointSize As tMember=(665,2,1,1) '(ent.INT).INT
	GetHotPoint As tMember=(666,2,5,1) '(ent.INT,index.INT,pX.DBL.P,pY.DBL.P,pZ.DBL.P).BOL
	GetHotEnt As tMember=(667,2,0,1) '().INT
	EnableHotEntOnNotComm As tMember=(668,2,1,1) '(isOn.BOL).ANYPTR
	EnableHotEnt As tMember=(669,2,1,1) '(isOn.BOL).ANYPTR
	AxTrasf As tMember=(691,2,6,1) '(ent.INT,origin1.VAR,dir1.VAR,xdir1.VAR,origin2.VAR,dir2.VAR).BOL
	SetGroupPlaneByBoxFace As tMember=(692,2,2,1) '(grpid.INT,faceinx.INT).BOL
	SetGroupInsPt As tMember=(694,2,2,1) '(grpid.INT,pt.VAR).BOL
	EnalbeOnMoveToPt As tMember=(698,2,1,1) '(isOn.BOL).ANYPTR
	GetGroupBndPt As tMember=(699,2,5,1) '(grpid.INT,inX.INT,x.DBL.P,y.DBL.P,z.DBL.P).BOL
	EnableGroupBndHaveMesh As tMember=(700,2,1,1) '(isHave.BOL).ANYPTR
	CalVectorAngle As tMember=(702,2,4,1) '(dir1.VAR,dir2.VAR,ydir.VAR,xDir.VAR).DBL
	Enable3DTextUserPlane As tMember=(706,2,5,1) '(isOn.BOL,org.VAR,dir.VAR,xDir.VAR,ydir.VAR).ANYPTR
	GetCamera As tMember=(714,2,6,1) '(atX.DBL.P,atY.DBL.P,atZ.DBL.P,eyeX.DBL.P,eyeY.DBL.P,eyeZ.DBL.P).ANYPTR
	VectorAngle As tMember=(715,2,2,1) '(dir1.VAR,dir2.VAR).DBL
	IsPtIn3DSolid As tMember=(716,2,2,1) '(ent.INT,pt.VAR).BOL
	LockPerspectiveMouseWheel As tMember=(717,2,1,1) '(isLock.BOL).ANYPTR
	IsMesh As tMember=(722,2,1,1) '(ent.INT).BOL
	SetRGBColor As tMember=(723,2,4,1) '(ent.INT,r.INT,g.INT,b.INT).BOL
	IsSupportRayTrace As tMember=(724,2,0,1) '().BOL
	GetDistPtAndLineSeg As tMember=(732,2,7,1) '(pt.VAR,sp.VAR,ep.VAR,dist.DBL.P,ox.DBL.P,oy.DBL.P,oz.DBL.P).BOL
	EnableOrthoHVMode As tMember=(733,2,1,1) '(isOn.BOL).ANYPTR
	SetDrawPolyLinePt As tMember=(734,2,4,1) '(inX.INT,x.DBL,y.DBL,z.DBL).ANYPTR
	EnableCommandOnLBDown As tMember=(735,2,1,1) '(isOn.BOL).ANYPTR
	GetLengthDimPts As tMember=(736,2,7,1) '(ent.INT,spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P).BOL
	GetDrawPolyLineSize As tMember=(737,2,0,1) '().INT
	SetGridOrgPt As tMember=(738,2,2,1) '(orgX.DBL,orgY.DBL).ANYPTR
	SetGridColor As tMember=(739,2,6,1) '(r1.DBL,g1.DBL,b1.DBL,r2.DBL,g2.DBL,b2.DBL).ANYPTR
	ConvertToGrid As tMember=(740,2,6,1) '(x.DBL,y.DBL,z.DBL,ox.DBL.P,oy.DBL.P,oz.DBL.P).ANYPTR
	Rectangle_ As tMember=(741,2,5,1) '(minX.DBL,minY.DBL,maxX.DBL,maxY.DBL,z.DBL).INT
	Sector As tMember=(742,2,4,1) '(cen.VAR,radius.DBL,startAngle.DBL,endAngle.DBL).INT
	GetGroupAxis As tMember=(743,2,10,1) '(grpid.INT,orgX.DBL.P,orgY.DBL.P,orgZ.DBL.P,dirX.DBL.P,dirY.DBL.P,dirZ.DBL.P,xDirX.DBL.P,xDirY.DBL.P,xDirZ.DBL.P).BOL
	Ax3TrasfWithZAsYAxis As tMember=(744,2,7,1) '(ent.INT,origin1.VAR,dir1.VAR,xdir1.VAR,origin2.VAR,dir2.VAR,xdir2.VAR).BOL
	MeshScaleByXYZAxis3 As tMember=(746,2,4,1) '(ent.INT,xscale.DBL,yscale.DBL,zscale.DBL).BOL
	DeactivateEnt As tMember=(755,2,1,1) '(ent.INT).BOL
	ActivateEnt As tMember=(774,2,1,1) '(ent.INT).BOL
	IsDisplayed As tMember=(777,2,1,1) '(ent.INT).BOL
	IsHaveTexture As tMember=(789,2,1,1) '(ent.INT).BOL
	GetEntTexture As tMember=(797,2,1,1) '(ent.INT).STR
	DisableRectSelect As tMember=(798,2,1,1) '(isDisable.BOL).ANYPTR
	SetScrRadOfOsnap As tMember=(800,2,1,1) '(rad.INT).ANYPTR
	GetMouseBoxFace As tMember=(801,2,6,1) '(minX.DBL,minY.DBL,minZ.DBL,maxX.DBL,maxY.DBL,maxZ.DBL).INT
	EnableExpDxfOnlyWire As tMember=(811,2,1,1) '(isOn.BOL).ANYPTR
	GetPlankLWAT As tMember=(812,2,5,1) '(ent.INT,length.DBL.P,width.DBL.P,area.DBL.P,thickness.DBL.P).BOL
	GetEntMaterial As tMember=(815,2,1,1) '(ent.INT).STR
	Get2DArcPtByTwoPtAndRad As tMember=(820,2,8,1) '(X1.DBL,Y1.DBL,X2.DBL,Y2.DBL,rad.DBL,isclockwise.BOL,mx.DBL.P,my.DBL.P).ANYPTR
	SetGridOrgColor As tMember=(822,2,7,1) '(isOn.BOL,r1.DBL,g1.DBL,b1.DBL,r2.DBL,g2.DBL,b2.DBL).ANYPTR
	ChangeTextureFile As tMember=(833,2,2,1) '(ent.INT,filename As WSTR.P).BOL
	LockMouseWheel As tMember=(853,2,1,1) '(isOn.BOL).ANYPTR
	SetTriedronPosition As tMember=(856,2,1,1) '(posType.INT).ANYPTR
	GetOutLineOfFaceByDir As tMember=(875,2,2,1) '(ent.INT,dir.VAR).INT
	GetOutLineSegmentOfFace As tMember=(876,2,11,1) '(index.INT,spX.DBL.P,spY.DBL.P,spZ.DBL.P,epX.DBL.P,epY.DBL.P,epZ.DBL.P,vx.DBL.P,vy.DBL.P,vz.DBL.P,isArc.BOL.P).BOL
	MovePoint As tMember=(877,2,12,1) '(x.DBL,y.DBL,z.DBL,sX.DBL,sY.DBL,sz.DBL,ex.DBL,ey.DBL,ez.DBL,ox.DBL.P,oy.DBL.P,oz.DBL.P).ANYPTR
	RightButtonOrbit As tMember=(879,2,1,1) '(isOn.BOL).ANYPTR
	Enable3DSolidDrag As tMember=(880,2,1,1) '(isOn.BOL).ANYPTR


	pMark As Integer = -1
	pThis As Integer
End Type        ' ew_DAdraw

	'Use like that to use these dispach/invoke functions
	'  Dim Shared As ew_DAdraw ewObj_Disp
	'  SetObj ( @ewObj_Disp , ewObj_Ptr ) ' connect to object
	'  ex : AxCall ewObj_Disp.putMonth,vptr(05)


'================================================================================
'Dispatch ew_DAdrawEvents     ?Event interface for EWDraw Control
'Const IID_ew_DAdrawEvents="{20EA3801-7619-4C3F-940B-50BB8F799FC2}"
'================================================================================
Type ew_DAdrawEvents
	' comunes a todas las versiones
	Click As tMember=(-600,2,0,1) '().ANYPTR
	DblClick As tMember=(-601,2,0,1) '().ANYPTR
	MouseMove As tMember=(-606,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	MouseDown As tMember=(-605,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	MouseUp As tMember=(-607,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	KeyDown As tMember=(-602,2,3,1) '(KeyCode.SHR,nRep.SHR,Shift.SHR).ANYPTR
	KeyUp As tMember=(-604,2,3,1) '(KeyCode.SHR,nRep.SHR,Shift.SHR).ANYPTR
	
	
#if 0	
	' en la 15.5.2 tienen diferente ID (7xx) respecto a las 15.9.4
	GetProcInfo As tMember=(700,2,5,1) '(info.STR,isGetPoint.BOL,isGetAngle.BOL,isGetValue.BOL,isGetEnt.BOL).ANYPTR
	ViewMouseMove As tMember=(701,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	ViewMouseDown As tMember=(702,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	ViewMouseUp As tMember=(703,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	AfterInit As tMember=(704,2,0,1) '().ANYPTR
#endif
	
	
#if 1
	' estos son de la 15.9.4 con ID cambiado (9xx)
	GetProcInfo As tMember = (900,2,5,1) '(info.STR,isGetPoint.BOL,isGetAngle.BOL,isGetValue.BOL,isGetEnt.BOL).ANYPTR
	ViewMouseMove As tMember = (901,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	ViewMouseDown As tMember = (902,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	ViewMouseUp As tMember = (903,2,7,1) '(Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
	AfterInit As tMember = (904,2,0,1) '().ANYPTR
	
	' y estas 3 nuevas en esta version 15.9.4
	ViewKeyUp As tMember = (905,2,3,1) '(KeyCode.UINT,nRep.UINT,nFlags.UINT).ANYPTR
	ViewKeyDown As tMember = (906,2,3,1) '(KeyCode.UINT,nRep.UINT,nFlags.UINT).ANYPTR
	MouseDownOver As tMember = (907,2,8,1) '(iType.SHR,Button.SHR,Shift.SHR,xWin.INT,yWin.INT,xCoord.DBL,yCoord.DBL,zCoord.DBL).ANYPTR
#endif

	pMark As Integer = -1
	pThis As Integer
End Type        ' ew_DAdrawEvents

	'Use like that to use these dispach/invoke functions
	'  Dim Shared As ew_DAdrawEvents ewObj_Disp
	'  SetObj ( @ewObj_Disp , ewObj_Ptr ) ' connect to object
	'  ex : AxCall ewObj_Disp.putMonth,vptr(05)


