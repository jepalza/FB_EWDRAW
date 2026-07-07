'================================================================================
'Event - EWDraw ActiveX Control module?{F6C21C7B-8EF8-41A3-85F1-7B8D5F7433CA}
'================================================================================

' prepara una cadena DOUBLE a STRING limitando la precision a 3 decimales 
' para poder ver coordenadas en la barra de estado
function formatea(a as double) as string
    dim as string sa=str(fix(a*1000)/1000)
    a=instr(sa,".")
    if a then sa=left(sa,a+4)
    return sa
end function


'================================================================================
'Event Dispatch - _DAdrawEvents     ?Event interface for EWDraw Control
Const _DAdrawEvents_IID_CP="{20EA3801-7619-4C3F-940B-50BB8F799FC2}"
'================================================================================
'================================================================================
'Event=Click, ID=-600 ?
'================================================================================
Function _DAdrawEvents_Click(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)

	'*** Put your code here ***
'print "Click ";IdEvent
	Function=S_OK
End Function

'================================================================================
'Event=DblClick, ID=-601 ?
'================================================================================
Function _DAdrawEvents_DblClick(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)

	'*** Put your code here ***
'print "DblClick ";IdEvent
	Function=S_OK
End Function

'================================================================================
'Event=MouseMove, ID=-606 ?
'================================================================================
Function _DAdrawEvents_MouseMove(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim Button As Short
	Dim Shift As Short

	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double
    
	Dim xWin As Integer
	Dim yWin As Integer
        
	Static xWinOld As Integer
	Static yWinOld As Integer
    
    Dim xWinActual As Integer
	Dim yWinActual As Integer
    
	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
    if Button=4then ' boton centro 
        if xWinOld<>0 andalso yWinOld<>0 then 
            ' mover vista
            axcall(EWD.ViewPan,vptr(xWin-xWinOld),vptr(-(yWin-yWinOld)))
        endif
    end if
    
    xWinOld=xWin
    yWinOld=yWin

	Function=S_OK
End Function

'================================================================================
'Event=MouseDown, ID=-605 ?
'================================================================================
Function _DAdrawEvents_MouseDown(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim Button As Short
	Dim Shift As Short
	Dim xWin As Integer
	Dim yWin As Integer
	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double

	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
'print "MouseDown:";Button,Shift,xWin,yWin," X";fix(xCoordinate);" Y";fix(yCoordinate);" Z";fix(zCoordinate)
	Function=S_OK
End Function

'================================================================================
'Event=MouseUp, ID=-607 ?
'================================================================================
Function _DAdrawEvents_MouseUp(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim Button As Short
	Dim Shift As Short
	Dim xWin As Integer
	Dim yWin As Integer
	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double

	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
    'if Shift=1 then axcall(EWD.ToDrawOrbit,vptr(false)):axcall(EWD.ToDrawPan,vptr(false))
'print "MouseUp:";Button,Shift,xWin,yWin," X";fix(xCoordinate);" Y";fix(yCoordinate);" Z";fix(zCoordinate)
	Function=S_OK
End Function

'================================================================================
'Event=KeyDown, ID=-602 ?
'================================================================================
Function _DAdrawEvents_KeyDown(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim KeyCode As Short
	Dim nRep As Short
	Dim Shift As Short

	KeyCode=VariantV(pv[2])
	nRep=VariantV(pv[1])
	Shift=VariantV(pv[0])
	'*** Put your code here ***
print "KeyDown:";KeyCode,nRep,Shift
	Function=S_OK
End Function

'================================================================================
'Event=KeyUp, ID=-604 ?
'================================================================================
Function _DAdrawEvents_KeyUp(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim KeyCode As Short
	Dim nRep As Short
	Dim Shift As Short

	KeyCode=VariantV(pv[2])
	nRep=VariantV(pv[1])
	Shift=VariantV(pv[0])
	'*** Put your code here ***
print "KeyUp:";KeyCode,nRep,Shift
	Function=S_OK
End Function




'================================================================================
'   las 5 siguientes varian su ID entre versiones 15.5.2 y 15.9.4 (70x vs. 90x)
'================================================================================


'================================================================================
'Event=GetProcInfo, ID=700 ? 900 ?
'================================================================================
Function _DAdrawEvents_GetProcInfo(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim info As BSTR
	Dim isGetPoint As BOOL
	Dim isGetAngle As BOOL
	Dim isGetValue As BOOL
	Dim isGetEnt As BOOL

	'info=VariantV(pv[4])
	isGetPoint=VariantV(pv[3])
	isGetAngle=VariantV(pv[2])
	isGetValue=VariantV(pv[1])
	isGetEnt=VariantV(pv[0])
	'*** Put your code here ***
print "GetProcInfo";isGetPoint,isGetAngle,isGetValue,isGetEnt
	Function=S_OK
End Function

'================================================================================
'Event=ViewMouseMove, ID=701 ? 901 ?
'================================================================================
Function _DAdrawEvents_ViewMouseMove(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim Button As Short
	Dim Shift As Short
	Dim xWin As Integer
	Dim yWin As Integer
	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double

	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
    dim as string coordenadas3d=""
    
    coordenadas3d="X"+formatea(xCoordinate)+" Y"+formatea(yCoordinate)+" Z"+formatea(zCoordinate)
    SetWindowText(hStatusBar, coordenadas3d)
'    if Button=4 and Shift=1 then axcall(EWD.ToDrawOrbit)
'    if Button=2 and Shift=1 then axcall(EWD.ToDrawPan)
'print "ViewMouseMove:";Button,Shift,xWin,yWin," X";fix(xCoordinate);" Y";fix(yCoordinate);" Z";fix(zCoordinate)
	Function=S_OK
End Function

'================================================================================
'Event=ViewMouseDown, ID=702 ? 902 ?
'================================================================================
Function _DAdrawEvents_ViewMouseDown(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim Button As Short
	Dim Shift As Short
	Dim xWin As Integer
	Dim yWin As Integer
	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double

	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
'print "ViewMouseDown:";Button,Shift,xWin,yWin," X";fix(xCoordinate);" Y";fix(yCoordinate);" Z";fix(zCoordinate)
	Function=S_OK
End Function

'================================================================================
'Event=ViewMouseUp, ID=703 ? 903 ?
'================================================================================
Function _DAdrawEvents_ViewMouseUp(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim Button As Short
	Dim Shift As Short
	Dim xWin As Integer
	Dim yWin As Integer
	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double

	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
'print "ViewMouseUp:";Button,Shift,xWin,yWin," X";fix(xCoordinate);" Y";fix(yCoordinate);" Z";fix(zCoordinate)
	Function=S_OK
End Function

'================================================================================
'Event=AfterInit, ID=704 ? 904 ?
'================================================================================
Function _DAdrawEvents_AfterInit(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)

	'*** Put your code here ***
print "AfterInit:";IdEvent
	Function=S_OK
End Function






'================================================================================
'   las tres llamadas que siguen son exclusivas de la 15.9.4 (ID=905,906,907)
'================================================================================


'================================================================================
'Event=ViewKeyUp, ID=905 ?
'================================================================================
Function _DAdrawEvents_ViewKeyUp(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim KeyCode As Uinteger
	Dim nRep As Uinteger
	Dim nFlags As Uinteger

	KeyCode=VariantV(pv[2])
	nRep=VariantV(pv[1])
	nFlags=VariantV(pv[0])
	'*** Put your code here ***
print "ViewKeyUp:";KeyCode,nRep,nFlags
	Function=S_OK
End Function

'================================================================================
'Event=ViewKeyDown, ID=906 ?
'================================================================================
Function _DAdrawEvents_ViewKeyDown(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim KeyCode As Uinteger
	Dim nRep As Uinteger
	Dim nFlags As Uinteger

	KeyCode=VariantV(pv[2])
	nRep=VariantV(pv[1])
	nFlags=VariantV(pv[0])
	'*** Put your code here ***
print "ViewKeyDown:";KeyCode,nRep,nFlags
	Function=S_OK
End Function

'================================================================================
'Event=MouseDownOver, ID=907 ?
'================================================================================
Function _DAdrawEvents_MouseDownOver(ByVal pCookie As Events_IDispatchVtbl Ptr, ByVal pdispparams As DISPPARAMS Ptr) As HRESULT
	Dim pThis As Dword=>pCookie->pThis
	Dim IdEvent As Dword = cast(Dword, pCookie)
	Dim pv As Variant Ptr = pdispparams->rgVArg
	Dim iType As Short
	Dim Button As Short
	Dim Shift As Short
	Dim xWin As Integer
	Dim yWin As Integer
	Dim xCoordinate As Double
	Dim yCoordinate As Double
	Dim zCoordinate As Double

	iType=VariantV(pv[7])
	Button=VariantV(pv[6])
	Shift=VariantV(pv[5])
	xWin=VariantV(pv[4])
	yWin=VariantV(pv[3])
	xCoordinate=VariantV(pv[2])
	yCoordinate=VariantV(pv[1])
	zCoordinate=VariantV(pv[0])
	'*** Put your code here ***
print "MouseDownOver:";iType,Button,Shift,xWin,yWin," X";fix(xCoordinate);" Y";fix(yCoordinate);" Z";fix(zCoordinate)
	Function=S_OK
End Function








Function _DAdrawEvents_IDispatch_Invoke(ByVal pUnk As IDispatch Ptr, ByVal dispidMember As DispID, ByVal riid As IID Ptr, _
  ByVal lcid As LCID, ByVal wFlags As Ushort, ByVal pdispparams As DISPPARAMS Ptr, Byval pvarResult As Variant Ptr, _
  ByVal pexcepinfo As EXCEPINFO Ptr, ByVal puArgErr As Uint Ptr) As Hresult
'print "IDispatch_Invoke:";dispidMember
	If Varptr(pdispparams) Then
		Select Case dispidMember
			' comunes a todas las versiones
			Case -600 '
				Function=_DAdrawEvents_Click(cast(Any Ptr,pUnk), pdispparams)
			Case -601 '
				Function=_DAdrawEvents_DblClick(cast(Any Ptr,pUnk), pdispparams)
			Case -605 '
				Function=_DAdrawEvents_MouseDown(cast(Any Ptr,pUnk), pdispparams)
			Case -606 '
				Function=_DAdrawEvents_MouseMove(cast(Any Ptr,pUnk), pdispparams)
			Case -607 '
				Function=_DAdrawEvents_MouseUp(cast(Any Ptr,pUnk), pdispparams)

            ' teclado
			Case -602 '
				beep:Function=_DAdrawEvents_KeyDown(cast(Any Ptr,pUnk), pdispparams)
			Case -604 '
				beep:Function=_DAdrawEvents_KeyUp(cast(Any Ptr,pUnk), pdispparams)
				
#if 0
			' solo en la 15.5.4
			Case 700 '
				Function=_DAdrawEvents_GetProcInfo(cast(Any Ptr,pUnk), pdispparams)
			Case 701 '
				Function=_DAdrawEvents_ViewMouseMove(cast(Any Ptr,pUnk), pdispparams)
			Case 702 '
				Function=_DAdrawEvents_ViewMouseDown(cast(Any Ptr,pUnk), pdispparams)
			Case 703 '
				Function=_DAdrawEvents_ViewMouseUp(cast(Any Ptr,pUnk), pdispparams)
			Case 704 '
				Function=_DAdrawEvents_AfterInit(cast(Any Ptr,pUnk), pdispparams)
#endif

#if 1
			' solo en la 15.9.4
			Case 900 '
				Function=_DAdrawEvents_GetProcInfo(cast(Any Ptr,pUnk), pdispparams)
			Case 901 '
				Function=_DAdrawEvents_ViewMouseMove(cast(Any Ptr,pUnk), pdispparams)
			Case 902 '
				Function=_DAdrawEvents_ViewMouseDown(cast(Any Ptr,pUnk), pdispparams)
			Case 903 '
				Function=_DAdrawEvents_ViewMouseUp(cast(Any Ptr,pUnk), pdispparams)
			Case 904 '
				Function=_DAdrawEvents_AfterInit(cast(Any Ptr,pUnk), pdispparams)
				
			' estas son nuevas solo en la 15.9.4
			Case 905 '
				Function=_DAdrawEvents_ViewKeyUp(cast(Any Ptr,pUnk), pdispparams)
			Case 906 '
				Function=_DAdrawEvents_ViewKeyDown(cast(Any Ptr,pUnk), pdispparams)
			Case 907 '
				Function=_DAdrawEvents_MouseDownOver(cast(Any Ptr,pUnk), pdispparams)
#endif

			Case Else
				Function = DISP_E_MEMBERNOTFOUND
		End Select
	End If
End Function

















' --------------------------------------------------------------------------------------------
' _DAdrawEvents Events Connection function
' --------------------------------------------------------------------------------------------
Function _DAdrawEvents_Events_Connect ( ByVal pUnk As Any Ptr, ByRef dwcookie As Dword ) As Integer
    'print "_DAdrawEvents_Events_Connect"
	Function = Ax_Events_cnx ( _DAdrawEvents_IID_CP , pUnk , dwcookie, ProcPtr ( _DAdrawEvents_IDispatch_Invoke ))
End Function

Function _DAdrawEvents_Events_Disconnect ( ByVal pUnk As Any Ptr, ByVal dwcookie As Dword ) As Integer
    'print "_DAdrawEvents_Events_Disconnect"
	Function = Ax_Events_cnx ( _DAdrawEvents_IID_CP , pUnk , dwcookie )
End Function

