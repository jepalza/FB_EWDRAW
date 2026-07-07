
' clase EWDRAW registrada en la OCX
'Const ProgID_EWdraw = "EWDRAW.EWDrawCtrl.1"

' estos datos en un principio no son necesarios, pero los dejo como referencia
'Const LIBID_EWDRAWLib    = "{F6C21C7B-8EF8-41A3-85F1-7B8D5F7433CA}" ' EWDraw ActiveX Control Module
'Const DIID__DAdraw       = "{28D4BD95-AEEB-48A0-A50D-9D4F5D97349E}" ' Default Interface
'Const DIID__DAdrawEvents = "{20EA3801-7619-4C3F-940B-50BB8F799FC2}" ' Default Event Interface
'Const CLSID_EWdraw       = "{05870C58-4F79-46F1-AE70-BCEBE4A53FE9}" ' EWDraw Control

' OBLIGATORIO asignar esta variable para las version 15.9 en adelante
' la necesitan a nivel DOS para saber donde estan los sombreadores GLSL de "TKOpenGL.DLL" de la carpeta "ewdshdsrc"
setenviron("CSF_ShadersDirectory=.\ewdshdsrc\")



' inicializacion
Dim Shared As any ptr Obj_Ptr     ' object Ptr   
#include "EWDraw_Init.bi"

' llamadas a INVOKE del EWDRAW OCX
#include "EWDraw_Invoke.bi"
Dim Shared As _DAdraw EWD ' vTable type ptr


' barra de estado inferior. debe ir ANTES de EVENTS por que se emplea alli
Dim Shared As HWND hStatusBar

' eventos
#include "EWDraw_Events.bi"
Dim Shared As ew_DAdrawEvents EV_EWD ' vTable type ptr

' general
#include "EWD_utiles.bi"
#include "res\Res.bi"

'empezamos
AxInit(True)  ' True : if at least 1 Ocx control is a Visual control (use Atl) , else False


' manejadores de ventanas
Dim Shared ActX As HWND
Dim Shared WinFRM As HWND
'Dim Shared hWndAbout As HWND
Dim Shared OcxHwnd As HWND

' menus de iconos graficos
#Include Once "win/commdlg.bi"
#Include Once "win/commctrl.bi"
Dim Shared As HWND hWndToolBar0 
Dim Shared As HWND hWndToolBar1 
Dim Shared As HWND hWndToolBar2 
Dim Shared As HWND hWndToolBar3 
Dim Shared As integer altoiconos=24  ' medidas iconos graficos de menus
Dim Shared As integer anchoiconos=24
Dim Shared As Integer numbotones=47   ' numero de botones graficos a mostrar
' instancia a la barra de menus
Dim Shared As HINSTANCE hInst_menu

' ventana
dim Shared as long winEWDancho
		winEWDancho=numbotones*(anchoiconos+7) ' ancho ideal para acoger 42 botones
dim Shared as long winEWDalto=1000


' fichero EWD cargado como principal, usado ademas para guardar
Dim shared FicheroEWD as String

' entidad seleccionada, usada para varios propositos, como deformar, modificar, estirar, guardar, etc
dim shared as integer selentidad
dim shared as integer selentidad2 ' cuando se necesitan dos, como en los casos BOOLEAN

Function WndProc(ByVal hwnd_ As HWND, _
                 ByVal msg_ As UINT, _
                 ByVal wParam_ As WPARAM, _
                 ByVal lParam_ As LPARAM) As LRESULT
 
	Dim rc As RECT
	Select Case msg_
		Case WM_CREATE
		   ' para meter un borde fino alrededor del menu, añadir WS_BORDER
            hWndToolBar0 = CreateWindowEx(0, TOOLBARCLASSNAME, NULL, _ 
													WS_CHILD Or WS_VISIBLE Or _
													TBSTYLE_FLAT Or CCS_ADJUSTABLE Or _
													CCS_NODIVIDER Or TBSTYLE_WRAPABLE _
													, 0, 0, 0, 0,_
													hWnd_, cast(HMENU,ID_TBR_TOOLBAR), hInst_menu, NULL) 
            'if hWndToolBar=0 Then MessageBox(NULL, "ToolBar 1", "Error", MB_OK Or MB_ICONERROR) : return 0 
			
			' Send the TB_BUTTONSTRUCTSIZE message, which is required for backward compatibility.
             SendMessage(hWndToolBar0, TB_BUTTONSTRUCTSIZE, cast(WPARAM,sizeof(TBBUTTON)), 0)  

			' para cargar una barra continua de iconos seguidos
			' importante indicar en 'numbotones' cuantos iconos lleva (misma variable que para crearlos)
			dim as HIMAGELIST hImgList = ImageList_Create(anchoiconos, altoiconos, ILC_COLOR16, numbotones, 0 )
			'if (hImgList=0) then MessageBox(NULL, "ToolBar 2", "Error", MB_OK Or MB_ICONERROR) : return 0 
			
			dim as HBITMAP hBitmapImage = cast(HBITMAP,LoadImage(hInst_menu, _
				 MAKEINTRESOURCE( MI_TOOLBAR_CAD ), _ ' AQUI EL NOMBRE DEL BMP
				 IMAGE_BITMAP, numbotones * anchoiconos, altoiconos, _
				 LR_COPYFROMRESOURCE or LR_SHARED  ))
			' este sistema carga un BMP largo con varios iconos seguidos, y los pone automatico todos seguidos
			' un sistema muy curioso y util, por que solo tenemos UN icono largo (importante indicar cuantos lleva)
			ImageList_Add(hImgList, hBitmapImage, NULL)
			
			SendMessage(hWndToolBar0, TB_SETIMAGELIST, cast(WPARAM,0), cast(LPARAM,hImgList))

			' y creamos los botones
			Dim As TBBUTTON tbb(numbotones-1)
			
			' definimos el tipo de botonoes: pueden ser estandar, peques, grandes, tec... ver internes
			Dim As TBADDBITMAP tbbits 
			tbbits.hInst= HINST_COMMCTRL 
			tbbits.nID = IDB_STD_LARGE_COLOR ' IDB_STD_LARGE_COLOR ' para iconos de 24x24
			SendMessage(hWndToolBar0,TB_ADDBITMAP, 0, cast(LPARAM,@tbbits)) 'tapar este y el boton cambia forma

			' el boton se redimensiona segun el tamaño del texto a mostrar. si supera al icono, se agranda
			tbb( 0) = type( 0 , ID_BOT0 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 1) = type( 1 , ID_BOT1 , TBSTATE_ENABLED , TBSTYLE_BUTTON) 'pueden ser TBSTYLE_AUTOSIZE
			tbb( 2) = type( 2 , ID_BOT2 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 3) = type( 3 , ID_BOT3 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 4) = type( 4 , ID_BOT4 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 5) = type( 5 , ID_BOT5 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 6) = type( 6 , ID_BOT6 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 7) = type( 7 , ID_BOT7 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 8) = type( 8 , ID_BOT8 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 9) = type( 9 , ID_BOT9 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 10) = type( 10 , ID_BOT10 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 11) = type( 11 , ID_BOT11 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 12) = type( 12 , ID_BOT12 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 13) = type( 13 , ID_BOT13 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 14) = type( 14 , ID_BOT14 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 15) = type( 15 , ID_BOT15 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 16) = type( 16 , ID_BOT16 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 17) = type( 17 , ID_BOT17 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 18) = type( 18 , ID_BOT18 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 19) = type( 19 , ID_BOT19 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 20) = type( 20 , ID_BOT20 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 21) = type( 21 , ID_BOT21 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 22) = type( 22 , ID_BOT22 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 23) = type( 23 , ID_BOT23 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 24) = type( 24 , ID_BOT24 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 25) = type( 25 , ID_BOT25 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 26) = type( 26 , ID_BOT26 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 27) = type( 27 , ID_BOT27 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 28) = type( 28 , ID_BOT28 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 29) = type( 29 , ID_BOT29 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 30) = type( 30 , ID_BOT30 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 31) = type( 31 , ID_BOT31 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 32) = type( 32 , ID_BOT32 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 33) = type( 33 , ID_BOT33 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 34) = type( 34 , ID_BOT34 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 35) = type( 35 , ID_BOT35 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 36) = type( 36 , ID_BOT36 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 37) = type( 37 , ID_BOT37 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 38) = type( 38 , ID_BOT38 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 39) = type( 39 , ID_BOT39 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 40) = type( 40 , ID_BOT40 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 41) = type( 41 , ID_BOT41 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 42) = type( 42 , ID_BOT42 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 43) = type( 43 , ID_BOT43 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 44) = type( 44 , ID_BOT44 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 45) = type( 45 , ID_BOT45 , TBSTATE_ENABLED , TBSTYLE_BUTTON)
			tbb( 46) = type( 46 , ID_BOT46 , TBSTATE_ENABLED , TBSTYLE_BUTTON)

			' *****************************************
			' ya podemos mostrar los botones
			' nota:en fb "ubound(tbb)+1"  equivale a "sizeof(tbb)/sizeof(TBBUTTON)"
            SendMessage(hWndToolBar0, TB_ADDBUTTONS, ubound(tbb)+1, cast(LPARAM,@tbb(0))) 

		'Case WM_SYSCOMMAND
'			If (wParam_ And &hFFF0) = SC_CLOSE Then
'				SendMessage (hWnd_, WM_DESTROY, wParam_, lParam_)
'				Exit Function
'			End If

		Case WM_COMMAND
			dim as integer LW=LoWord(wParam_)

            ' cargo aqui cada grupo de actuaciones CAD
            ' al ser muchas, he preferido hecerlo de este modo
            #include "EWD_Demos.bas"  ' demostraciones automaticas (BSPLINE, BOOLEAN, RAYTRACER)
            #include "EWD_Ficheros.bas"  ' tratamientos de ficheros DXF,EWD,IGES,STEP, Etc
            #include "EWD_Elementos.bas" ' creacion de elementos CAD
            #include "EWD_Modificaciones.bas" ' Modificaciones a elementos CAD
            #include "EWD_Comunes.bas" ' generales de todo tipo (UNDO, BORRAR, CONFIG, etc)

		Case WM_SIZE
			If wParam_ <> SIZE_MINIMIZED Then GetClientRect(hWnd_, @rc)
            SendMessage(hStatusBar, WM_SIZE, 0, 0) ' actualiza altura de la barra de estado

		Case WM_CLOSE
            Call_OnClose(Obj_Ptr) ' cierra por completo EWDRAW
			sendmessage hwnd_,WM_DESTROY,0,0
            PostQuitMessage(0)
			Return TRUE
		 
		Case WM_DESTROY
            Call_OnClose(Obj_Ptr) ' cierra por completo EWDRAW
			DestroyWindow(ActX)
			PostQuitMessage(0)
			Return TRUE

		Case WM_DESTROY
            Call_OnClose(Obj_Ptr) ' cierra por completo EWDRAW
			DestroyWindow(ActX)
			PostQuitMessage(0)
            
		Exit Function

	End Select
	
	Return DefWindowProc(hwnd_, msg_, wParam_, lParam_)
End Function


Function WINMAIN (ByVal hInst As HINSTANCE, ByVal hPrevInst As HINSTANCE, _
                      lpszCmdLine As ZString Ptr, ByVal nCmdShow As Long) As Long
	Dim msg_          As  MSG
	Dim szClassName   As ZString * 128
	Dim szWindowTitle As ZString * 128
	Dim wcex          As WNDCLASSEX
	Dim hAccelTable	  As HACCEL ' atajos teclado 
		 
	' instacia para la barra de menus
	hInst_menu=hInst
	
	szClassName = "ewdrawapp" ' puede ser cualquier nombre
	szWindowTitle = "EWDraw" ' puede ser cualquier nombre
	 
	wcex.cbSize = Sizeof(wcex)
	wcex.style  = CS_VREDRAW OR CS_HREDRAW
	wcex.lpfnWndProc = @WndProc
	wcex.cbClsExtra = 0
	wcex.cbWndExtra = 0
	wcex.hInstance = hInst
	wcex.hIcon   = LoadIcon(NULL, ByVal IDI_APPLICATION )
	wcex.hIconSm = LoadIcon(NULL, ByVal IDI_APPLICATION)
	wcex.hCursor = LoadCursor(NULL, ByVal IDC_ARROW)
	wcex.hbrBackground = Cast(HBRUSH,COLOR_BTNFACE + 1)
	wcex.lpszMenuName = MAKEINTRESOURCE(IDR_MENUS)
	'wcex.lpszMenuName = Null
	wcex.lpszClassName = StrPtr(szClassName)
 
	If RegisterClassEx(@wcex) = 0 Then
		MessageBeep(0)
		Return FALSE
		Exit Function
	End If

' si usamos RESOURCES para leer la configuracion de la ventana principal, esto no es necesario
' pero en mi caso, lo prefiero, es mas controlable desde aqui
	WinFRM = CreateWindowEx(WS_EX_CONTROLPARENT, _
                        szClassName,   _
                        "EWDraw OCX FB JEpalza", _
                         WS_OVERLAPPEDWINDOW, _
                         100, _
                         25,  _
                         winEWDancho+16+4, _ ' +16+4 para que entre el marco
                         winEWDalto +64+4, _ ' +64+4 para dejar sitio a menus
                        NULL, _
                        NULL, _
                        hInst, _
                        ByVal NULL)

    ' barra inferior de estado
    hStatusBar = CreateWindowEx( _
        0,                                     _ ' No extended styles
        STATUSCLASSNAME,                       _ ' Status bar class name
        NULL,                                  _ ' No initial text
        WS_CHILD or WS_VISIBLE or SBARS_SIZEGRIP,_ ' Window styles (includes grip in bottom right)
        0, 0, 0, 0,                            _ ' Positions (size will be updated by WM_SIZE)
        WinFRM,                                _ ' Handle to the parent window
        cast(HMENU,ID_MAIN_STATUS),            _ ' Control identifier
        GetModuleHandle(NULL),                 _ ' Instance handle
        NULL                                   _ ' Pointer to window creation data
    )	
    SendMessage(hStatusBar, SB_SETMINHEIGHT, 24, 0) ' altura 24 pixels
                
	OcxHwnd=WinOcx(WinFRM,winEWDancho,winEWDalto)
    Obj_Ptr=Call_Init(OcxHwnd)

	
	' inicia ATL par EWDRAW
    SetObj ( @EWD , Obj_Ptr )

'	ShowWindow(WinFRM, SW_SHOWNORMAL)
'	UpdateWindow WinFRM
    AxWinShow(WinFRM) ' equivale a las dos anteriores de windows

    ' registro EWDRAW
	'axcall EWD.SetRegister,txt2BSTR("try")

    ' valores por defecto de la aplicacion
	'axcall EWD.OpenEwd,txt2BSTR(".\ejemplos\dos_bolas.ewd")
	axcall EWD.SetDisplayTrihedron,vptr(TRUE)
	axcall EWD.SetViewCondition,vptr(7) ' ventana en modo ISO 3D
	axcall EWD.SetViewDisplayMode,vptr(1) ' modo sombreado o modo alambre, por defecto sombreado
	axcall EWD.ZoomALL,vptr(TRUE)
	
	'axcall EWD.DisableRightMenu,vptr(TRUE) ' menu del boton derecho deshabilitado
	axcall EWD.RightButtonOrbit,vptr(TRUE) ' giros con boton derecho, en vez de izquierdo SOLO VERSION 15.9!!!!
	axcall EWD.SetPointType,vptr(120),vptr(2),vptr(2.0) ' punto color 120=verde, 2=forma '*', escala 2
    axcall EWD.EnableWireOfShape,vptr(true) ' siempre modo alambre+solido
    axcall EWD.SetWireOfShape,vptr(130),vptr(3) ' ademas, color 130 y grueso 3
	axcall EWD.EnableUndoRedo,vptr(TRUE) ' habilita espacio hacer/deshacer
	
    ' podemos elegir entre fondo color X
	'axcall EWD.SetBackGroundColor,vptr(0) ' fondo negro
    ' o fondo BMP
	axcall EWD.SetBackGroundImage,txt2BSTR(".\TexLib\fondo.bmp")
    
	' activar los menus aunque no sirve de gran cosa, solo para emergencias o depuracion
	' son fijos, inamovibles y descolocan la ventana.
	'axget(EWD.SetDisplayToolBar,vptr(TRUE))
    
	while( GetMessage(@msg_, NULL, 0, 0)) 
		TranslateMessage( @msg_ ) 
		DispatchMessage( @msg_ ) 
	Wend
	
	Return  FALSE
End Function




End WINMAIN(getmoduleHandle(0),NULL,Command,SW_SHOW)
 		