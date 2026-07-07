
' lineas
If LW=32888  or LW=ID_BOT30 Then axcall(EWD.ToDrawLine) ' ToDrawLine
If LW=32889  or LW=ID_BOT31 Then axcall(EWD.ToDrawRectang) 'ToDrawRectangle
If LW=32890  or LW=ID_BOT32 Then axcall(EWD.ToDrawPolyline) 'ToDrawPolyline
If LW=32893  or LW=ID_BOT33 Then axcall(EWD.ToDrawCircle) 'ToDrawCircle
If LW=32891  or LW=ID_BOT34 Then axcall(EWD.ToDrawArc) 'ToDrawArc
'If LW=32892 Then axcall(EWD.ToDrawArc) 'Arc_by_3P
'If LW=32894 Then axcall(EWD.ToDrawCircle_by_3P) 'ToDrawCircle_by_3P
If LW=32895  or LW=ID_BOT35 Then axcall(EWD.ToDrawBSPline) 'ToDrawBSPline
If LW=32896  or LW=ID_BOT36 Then axcall(EWD.ToDrawEllipse) 'ToDrawEllipse
If LW=32897  or LW=ID_BOT37 Then axcall(EWD.ToDrawEllipseArc) 'ToDrawEllipse_Arc

If LW=32898  or LW=ID_BOT29 Then axcall(EWD.ToDrawPoint) 'ToDrawPoint
If LW=32899  or LW=ID_BOT42 Then axcall(EWD.ToDraw2DText) 'Text
If LW=32900  or LW=ID_BOT38 Then axcall(EWD.ToDrawMakeFace) 'ToDrawMakeFace
If LW=32911  or LW=ID_BOT39 Then axcall(EWD.ToDrawPrism) 'ToDrawPrism
'If LW=32901  or LW=ID_BOT0 Then axcall(EWD.ToDrawImage) 'ToDrawImage

' solidos
If LW=32903  or LW=ID_BOT25 Then axcall(EWD.ToDrawBox) 'ToDrawBox
If LW=32904  or LW=ID_BOT24 Then axcall(EWD.ToDrawCylinder) 'ToDrawCylinder
If LW=32905  or LW=ID_BOT23 Then axcall(EWD.ToDrawSphere) 'ToDrawSphere
If LW=32907  or LW=ID_BOT26 Then axcall(EWD.ToDrawCone) 'ToDrawCone
If LW=32908  or LW=ID_BOT27 Then axcall(EWD.ToDrawTorus) 'ToDrawTorus
If LW=32909  or LW=ID_BOT28 Then axcall(EWD.ToDrawWedge) 'ToDrawWedge
If LW=32912  or LW=ID_BOT40 Then axcall(EWD.ToDrawPipe) 'ToDrawPipe
If LW=32913  or LW=ID_BOT41 Then axcall(EWD.ToDrawRevol) 'Revolve
'If LW=32914  or LW=ID_BOT0 Then axcall(EWD.ToDrawThruSections) 'Section

If LW=32926  or LW=ID_BOT11 Then axcall(EWD.ToDrawFillet) 'Fillet
If LW=32927  or LW=ID_BOT12 Then axcall(EWD.ToDrawChamfer) ' DrawChamfer
'If LW=32932 Then axcall(EWD.ToDrawFillet_3D_Polyline) 'Fillet_3D_Polyline
