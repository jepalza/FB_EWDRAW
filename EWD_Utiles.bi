' utiles necesario para enviar info al EWDRAW OCX que no existen o no valen en el AXSUITE

' funcion para convertir un ARRAY de 3 elementos 3D en VARIANT ARRAY
' convertida de un ejemplo EWDRAW 2005 de CPP ("VCSample1Dlg.cpp")
' y adaptada al AXSUITE3 para usarse como se usa "VPTR"
Function Vec2Var(x as double, y as double, z as double) AS VARIANT Ptr
	Dim AS VARIANT tmp1
	Dim AS VARIANT tmp2
	Dim AS VARIANT tmp3
	Dim AS VARIANT Ptr arr = callocate(1, sizeof(VARIANT))
	
	tmp1.vt = VT_R8
	tmp1.dblVal = x
	
	tmp2.vt = VT_R8
	tmp2.dblVal = y

	tmp3.vt = VT_R8
	tmp3.dblVal = z
	Dim AS SAFEARRAYBOUND vec3(1)
	vec3(0).lLbound = 0
	vec3(0).cElements = 3
	Dim As SAFEARRAY ptr psa = SafeArrayCreate(VT_VARIANT, 1, @vec3(0))
	for i as long = 0 to 2
		Select Case i
			case 0:
				SafeArrayPutElement(psa, @i, @tmp1)
			case 1:
				SafeArrayPutElement(psa, @i, @tmp2)
			case 2:
				SafeArrayPutElement(psa, @i, @tmp3)
		End Select
	Next i
	
	arr->vt = VT_ARRAY Or VT_VARIANT
	arr->parray = psa
	return arr
End Function

Function xyz2var(ByVal x As Double,byval y As Double,ByVal z As Double) As variant Ptr
	Dim As Integer coordenadas
	Dim As VARIANT arr
		
	Dim as VARIANT tmp
	dim as SAFEARRAYBOUND sab
	
	arr.vt = VT_ARRAY or VT_VARIANT
	sab.lLbound   = 0
	sab.cElements = 3
	arr.parray=SafeArrayCreate(VT_VARIANT,1,cast(SAFEARRAYBOUND ptr,@sab))
	Dim as BSTR bptr
	Dim ws as WString * 20

   WS=wstr(Str(x))
   bptr=SysAllocString(@ws)
   tmp.vt = VT_BSTR   
   tmp.bstrVal = bptr
   coordenadas=0
   SafeArrayPutElement(arr.parray,@coordenadas,@tmp)

   ws=wstr(Str(y))
   coordenadas=1
   SafeArrayPutElement(arr.parray,@coordenadas,@tmp)

   ws=wstr(Str(z))
   coordenadas=2
   SafeArrayPutElement(arr.parray,@coordenadas,@tmp)
   SysFreeString(bptr)	

	Return @arr
End Function

' esta funcion la he pillado de internet y retocado a la forma de AX_LITE
' la original ToBSTR de aqui no funciona con EWDRAW OCX
' para enviar cadenas de texto al EWDRAW usar esta unicamente, por que solo admite BSTR
Function txt2BSTR( FB_WString As WString Ptr) As VARIANT Ptr
	Return vptr(SysAllocString( FB_WString ))
End Function
	

' para recuperar datos de EWDRAW usando punteros
Function pdbl(byref x As Double) As VARIANT Ptr
	dim pv as VARIANT ptr = callocate(1, sizeof(VARIANT))
	pv -> vt = VT_BYREF or VT_R8
	pv -> byref = varptr(x)
	Return pv
End Function

Function pshr(byref x As Short) As VARIANT Ptr
	dim pv as VARIANT ptr = callocate(1, sizeof(VARIANT))
	pv -> vt = VT_BYREF or VT_I2
	pv -> byref = varptr(x)
	Return pv
End Function

Function pint(byref x As Integer) As VARIANT Ptr
	dim pv as VARIANT ptr = callocate(1, sizeof(VARIANT))
	pv -> vt = VT_BYREF or VT_I4
	pv -> byref = varptr(x)
	Return pv
End Function

Function pbool(byref x As Bool) As VARIANT Ptr
	dim pv as VARIANT ptr = callocate(1, sizeof(VARIANT))
	pv -> vt = VT_BYREF or VT_BOOL
	pv -> byref = varptr(x)
	Return pv
End Function





'''''''''''''''''''''''''''''''''''
' rutinas para seleccion de fichero
'''''''''''''''''''''''''''''''''''
#Include Once "windows.bi"
#Include "win/commdlg.bi"

Dim Shared hWndForm as HWnd ' ventanas de seleccion de ficheros o carpetas

' coger el nombre de un solo fichero
Declare Function seleccionar_fichero( ByVal HWnd as HWnd=NULL , ext as string, guardar as integer = 0 ) as String
	


'''''''''''''''''''''''''''''
' para elegir UN SOLO fichero
'''''''''''''''''''''''''''''
' el manejador de ventana, puede ser el de la ventana windows que ya tengamos creada
' o dejarlo por defecto (NULL) y sale "en el aire"
Function seleccionar_fichero( ByVal hWndFicheros as HWnd=Null, ext as string, guardar as integer = 0) as String
    Dim ofn as OPENFILENAME
    Dim filename as ZString * MAX_PATH+1
	 Dim mascara as string = ("Ficheros (*."+ucase(ext)+")"+chr(0)+"*."+ucase(ext)+""+chr(0))
    
    With ofn
        .lStructSize         = SizeOf( OPENFILENAME )
        .hwndOwner           = hWndFicheros
        .hInstance           = GetModuleHandle( Null )
        .lpstrFilter         = StrPtr( mascara )
        .lpstrCustomFilter   = Null
        .nMaxCustFilter      = 0
        .nFilterIndex        = 1
        .lpstrFile           = @filename
        .nMaxFile            = SizeOf( filename )
        .lpstrFileTitle      = Null
        .nMaxFileTitle       = 0
        .lpstrInitialDir     = Null
        .lpstrTitle          = @"Selecciona fichero"
        .Flags               = OFN_EXPLORER Or OFN_FILEMUSTEXIST Or OFN_PATHMUSTEXIST
        .nFileOffset         = 0
        .nFileExtension      = 0
        .lpstrDefExt         = Null
        .lCustData           = 0
        .lpfnHook            = Null
        .lpTemplateName      = Null
    End With

	if guardar=1 then ' elegir para guardar ...
		 If( GetSaveFileName( @ofn ) = False ) Then
				Return ""
		 Else
				' le sumo la ext si no la hemos puesto al elegir nombre del nuevo fichero
				if lcase(right(filename,3))<>lcase(ext) then filename=filename+"."+ext
				Return filename
		 End IF
	else ' ... o para leer
		 If( GetOpenFileName( @ofn ) = False ) Then
			  Return ""
		 Else
			  Return filename
		 End If
	endif
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''
