
' operaciones BOOLEANAS
If LW=32934  or LW=ID_BOT46 Then axcall(EWD.ToDrawUnion) 'Union
If LW=32935  or LW=ID_BOT45 Then axcall(EWD.ToDrawIntersect) 'Intersect
If LW=32937  or LW=ID_BOT44 Then axcall(EWD.ToDrawSubtract) 'Subtract



If LW=32923  or LW=ID_BOT8  Then axcall(EWD.ToDrawRotate) 'Rotate
If LW=32924  or LW=ID_BOT9  Then axcall(EWD.ToDrawScale) 'Scale
If LW=32925  or LW=ID_BOT10 Then axcall(EWD.Explode,vptr(selentidad)) 'Explode
If LW=32928  or LW=ID_BOT13 Then axcall(EWD.ToDrawBreak) 'Break
If LW=32929  or LW=ID_BOT14 Then axcall(EWD.ToDrawExtend) 'Extend
If LW=33012  or LW=ID_BOT15 Then axcall(EWD.Join,vptr(selentidad),vptr(selentidad2)) 'Join

' esta podria ser tambien "ToDrawBreak"
If LW=33039  or LW=ID_BOT16 Then axcall(EWD.DivideEnt,vptr(selentidad),vptr(2)) 'Divide por 2 una entidad
If LW=32930  or LW=ID_BOT43 Then axcall(EWD.ToDrawColor) 'Change_Color
If LW=32999  or LW=ID_BOT0 Then axcall(EWD.ToDrawDelete) 
If LW=32916  or LW=ID_BOT1 Then axcall(EWD.ToDrawCopy) 'Copy
If LW=32918  or LW=ID_BOT4 Then axcall(EWD.ToDrawMirror) 'Mirror
If LW=32919  or LW=ID_BOT5 Then axcall(EWD.MirrorByPlane) 'Mirror_3D_by_plan
If LW=32921  or LW=ID_BOT6 Then axcall(EWD.ToDrawOffset) 'Offset
If LW=32922  or LW=ID_BOT7 Then axcall(EWD.ToDrawMove) 'Move

'analizar estas
'If LW=32939 Then axcall(EWD.Copy_face) 'Copy_face
'If LW=32940 Then axcall(EWD.Delete_face) 'Delete_face
'If LW=32941 Then axcall(EWD.Extrude_face) 'Extrude_face
'If LW=32942 Then axcall(EWD.Extrude_face_by_path) 'Extrude_face_by_path
'If LW=33001 Then axcall(EWD.Offset_3D_Solid) 'Offset_3D_Solid
'If LW=32945 Then axcall(EWD.Transparent) 'Transparent
'If LW=32947 Then axcall(EWD.WBlock) 'WBlock
'If LW=32948 Then axcall(EWD.InsertBlock) 'InsertBlock
'If LW=32949 Then axcall(EWD.Image) 'Image
'If LW=32951 Then axcall(EWD.3DS_file) '3DS_file
'If LW=32952 Then axcall(EWD.Stl_file) 'Stl_file
'If LW=32954 Then axcall(EWD.Get_Entity_length) 'Get_Entity_length
'If LW=32955 Then axcall(EWD.Get_Entity_Area) 'Get_Entity_Area
'If LW=32956 Then axcall(EWD.Get_Entity_Volume) 'Get_Entity_Volume
'If LW=32957 Then axcall(EWD.User_data) 'User_data
'If LW=32958 Then axcall(EWD.Texture_to_Shape) 'Texture_to_Shape
'If LW=32959 Then axcall(EWD.Project_3D_solid_to_2D) 'Project_3D_solid_to_2D
'If LW=33002 Then axcall(EWD.Intersect_points_between_wire_and_shape) 'Intersect_points_between_wire_and_shape
'If LW=32961 Then axcall(EWD.Get_Section_from_3D_solid) 'Get_Section_from_3D_solid
'If LW=33082 Then axcall(EWD.Get_ID_fo_entity) 'Get_ID_fo_entity
'If LW=33062 Then axcall(EWD.CAD_Help) 'CAD_Help
'If LW=33044 Then axcall(EWD.BuyNow) 'BuyNow
'If LW=33045 Then axcall(EWD.Contact) 'Contact
'If LW=33046 Then axcall(EWD.Register) 'Register
'If LW=33077 Then axcall(EWD.User_Manual) 'User_Manual
'If LW=33078 Then axcall(EWD.Sample) 'Sample
'If LW=33079 Then axcall(EWD.Other_CAD_DEMO) 'Other_CAD_DEMO
'If LW=33081 Then axcall(EWD.Ray-Trace_render_DEMO) 'Ray-Trace_render_DEMO
