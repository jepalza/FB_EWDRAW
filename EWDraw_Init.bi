
#Include Once "Windows.bi"        ' Windows specific, if not defined yet
#Include Once "Ax_lite.bi"        ' this one is needed

' eventos
Dim Shared As Dword Obj_Event    ' for object events
#Define Decl_Ev1_ Declare Function _DAdrawEvents_Events_Connect(ByVal As any Ptr, ByRef As dword) As Integer
#Define Decl_Ev2_ Declare Function _DAdrawEvents_Events_Disconnect(ByVal As any Ptr, ByVal As dword) As Integer
	Decl_Ev1_      ' indirect declare to avoid FireFly duplication 
	Decl_Ev2_      ' indirect declare to avoid FireFly duplication 

Function WinOcx  ( hparent as hwnd , ancho as long, alto as long) as hwnd ' make window for control
	Dim as integer x= 2 
	Dim as integer y= 32 
	Dim as integer w= ancho 
	Dim as integer h= alto-50	
	dim as string N = "FreeBasic CAD JEpalza"  	' Name of the window , change for your need
	dim as string P = "EWDRAW.EWDrawCtrl.1"  ' prodId of the window , change for your need
	Dim as HWND OcxHwnd
	'OcxHwnd = AxWinChild( hparent , N , P , x , y , w , h ) ' adapt to your needs  see Axlite.bi
	'OcxHwnd = AxWinTool( hparent , N , P , x , y , w , h ) ' or try this for Tool floating window
	OcxHwnd = AxWinFull( hparent , N , P , x , y , w , h ) ' or try this for Full floating window
	Function = OcxHwnd
End Function 


function Call_Init(OcxHwnd As HWND) As any ptr ' be called from initialization of the control form
    dim as any ptr Obj_Ptr = AxCreate_Object( OcxHwnd )   'get object control address with control hwnd
	' The events are now connected .....
	_DAdrawEvents_Events_Connect( Obj_Ptr , Obj_Event ) 'connect object with its event
    return Obj_Ptr
End function


Sub Call_OnClose(Obj_Ptr As any ptr ) ' normaly be called from close form command
	 AxRelease_Object(Obj_Ptr)  'release object
     _DAdrawEvents_Events_Disconnect( Obj_Ptr , Obj_Event ) 'connect object with its event
End Sub