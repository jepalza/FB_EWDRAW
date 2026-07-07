			
' ---------------------------------
' menu AYUDA/DEMOS
If LW = 33078 Then 'Demo BSPline
	axcall( EWD.Clear3DPtBuf )
	axcall( EWD.AddOne3DVertex, vptr(0.0), vptr(0.0), vptr(0.0 ) )
	axcall( EWD.AddOne3DVertex, vptr(1.0), vptr(2.0), vptr(0.0 ) )
	axcall( EWD.AddOne3DVertex, vptr(3.0), vptr(3.0), vptr(0.0 ) )
	axcall( EWD.AddOne3DVertex, vptr(5.0), vptr(8.0), vptr(0.0 ) )
	dim as integer ent = VariantV(axget(EWD.BSPline,vptr(False)))
	axcall( EWD.DivideEnt, vptr(ent), vptr(16) )
	dim as integer num = VariantV(axget(EWD.Get3DPtBufSize))
	dim as double x,y,z

	dim as short punto_tipo,punto_color
	dim as double punto_escala
	axcall( EWD.GetPointStyle, pshr(punto_color), pshr(punto_tipo), pdbl(punto_escala) )
	'print "punto color:";punto_color;"  tipo:";punto_tipo;"  escala:";punto_escala

	For i as long = 0 To num - 1
		axcall( EWD.Get3DPtBuf, vptr(i), pdbl(x), pdbl(y), pdbl(z) )
		'print i,x,y,z
		axcall( EWD.Point_, vec2var(x, y, z) )
	Next
	axcall( EWD.Clear3DPtBuf )
	axcall( EWD.ZoomALL )
End If

If LW = 33079 Then 'Demo BOOLEANAS     
    dim as integer ent,ent1,ent2
    'dim as variant p1,p2
    'p1 = axget(EWD.MakeVariant,100,150,0) ' esto es mejor usar "Vec2Var(100,150,0)"
    'p2 = axget(EWD.MakeVariant,150,150,0)
    axcall(EWD.SetBooleanOperationTolerance,vptr(0.1))
    
    ' demo BOOLEAN union
    axcall(EWD.SetViewCondition,vptr(1))
    axcall(EWD.DeleteAll)
    ent  = VariantV(axget(EWD.Sphere,Vec2Var(100,150,0),vptr(50)))
    ent1 = VariantV(axget(EWD.Sphere,Vec2Var(150,150,0),vptr(50)))
    ent2 = VariantV(axget(EWD.Union_,vptr(ent),vptr(ent1)))
    axcall(EWD.ZoomALL)

    ' demo BOOLEAN Intersect
    axcall(EWD.SetViewCondition,vptr(1))
    axcall(EWD.DeleteAll)
    ent  = VariantV(axget(EWD.Sphere,Vec2Var(100,150,0),vptr(50)))
    ent1 = VariantV(axget(EWD.Sphere,Vec2Var(150,150,0),vptr(50)))
    ent2 = VariantV(axget(EWD.Intersect,vptr(ent),vptr(ent1)))
    axcall(EWD.ZoomALL)
    
   ' demo BOOLEAN Subtract
    axcall(EWD.SetViewCondition,vptr(1))
    axcall(EWD.DeleteAll)
    ent  = VariantV(axget(EWD.Sphere,Vec2Var(100,150,0),vptr(50)))
    ent1 = VariantV(axget(EWD.Sphere,Vec2Var(150,150,0),vptr(50)))
    ent2 = VariantV(axget(EWD.Subtract,vptr(ent),vptr(ent1)))
    axcall(EWD.ZoomALL)
    
end if

' estas funciones solo en la version 15.9.x ?
If LW = 33081 Then 'Demo RAYTRACING
    axcall(EWD.EnableRayTrace,vptr(true))
    axcall(EWD.SetRayTraceDepth,vptr(10))
    axcall(EWD.EnableDisplayCAEWireframe,vptr(true))
endif   
