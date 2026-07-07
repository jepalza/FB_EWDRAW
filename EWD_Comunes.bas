If LW=32776 Then 
    if (MessageBox(NULL, "Borrar TODO (SI/NO)", "Empezar de nuevo", MB_YESNO)=IDYES) then
        axcall( EWD.DeleteAll ) ' NEW
    endif
endif


If LW=327760 or LW=ID_BOT0 Then axcall( EWD.ToDrawDelete ) ' NEW
            
' improsora, no l ouso
'If LW=32790 Then axcall(EWD.ChangePrinter) 'Print_setup
'If LW=32791 Then axcall(EWD.Print) 'Print
'If LW=32792 Then axcall(EWD.PrintView) 'Print_Preview
			
If LW=32793 Then SendMessage (hWnd_, WM_DESTROY, wParam_, lParam_):Exit Function ' salir

If LW=32965 or LW=ID_BOT2 Then axcall(EWD.Undo) 'Undo
If LW=32966 or LW=ID_BOT3 Then axcall(EWD.Redo) 'Redo
'If LW=32839 Then axcall(EWD.Select_all) 'Select_all
'If LW=32967 Then axcall(EWD.Invert_Select) 'Invert_Select
'If LW=32840 Then axcall(EWD.Clear_select) 'Clear_select
If LW=32841 or LW=ID_BOT17 Then axcall(EWD.ReDrawView) 'Redraw
If LW=32842 Then axcall(EWD.ToDrawPan) 'Pan
If LW=32843 Then axcall(EWD.ToDrawOrbit) 'Orbit
'If LW=32813 Then axcall(EWD.Zoom_window) 'Zoom_window
'If LW=32814 Then axcall(EWD.ToDrawZoomWindow) 'Dynamic_zoom
If LW=32815 or LW=ID_BOT18 Then axcall(EWD.ZoomALL) 'Zoom_all

If LW=32817 or LW=ID_BOT19 Then axcall(EWD.SetViewCondition,vptr(1)) 'Top
If LW=32818 Then axcall(EWD.SetViewCondition,vptr(2)) 'Bottom
If LW=32975 Then axcall(EWD.SetViewCondition,vptr(3)) 'Left
If LW=32976 or LW=ID_BOT21 Then axcall(EWD.SetViewCondition,vptr(4)) 'Right
If LW=32977 or LW=ID_BOT20 Then axcall(EWD.SetViewCondition,vptr(5)) 'Front
If LW=32978 Then axcall(EWD.SetViewCondition,vptr(6)) 'Back

If LW=32979 or LW=ID_BOT22 Then axcall(EWD.SetViewCondition,vptr(7)) 'SW_Isometric
If LW=32980 Then axcall(EWD.SetViewCondition,vptr(8)) 'SE_Isometric
If LW=32981 Then axcall(EWD.SetViewCondition,vptr(9)) 'NE_Isometric
If LW=32982 Then axcall(EWD.SetViewCondition,vptr(10)) 'NW_Isometric



If LW=32984 Then axcall(EWD.SetDisplayTrihedron,vptr(TRUE)) 'Trihedron_On
If LW=32985 Then axcall(EWD.SetDisplayTrihedron,vptr(FALSE)) 'Trihedron_Off

' no lo voy a usar, y ademas, creo que no chuta, no hace nada
'If LW=32987 Then axcall(EWD.SetORTHO,vptr(TRUE)) 'ORTHO_On, ISOMETRICO apagado
'If LW=32988 Then axcall(EWD.SetORTHO,vptr(FALSE)) 'ORTHO_Off, o sea ISOMETRICO

If LW=33021 Then axcall(EWD.EnableAntialiasing,vptr(TRUE)) 'Antialiasing_On
If LW=33022 Then axcall(EWD.EnableAntialiasing,vptr(FALSE)) 'Antialiasing_Off

If LW=32993 Then axcall(EWD.SetViewHideMode,vptr(TRUE)) 'Hide_On
If LW=32994 Then axcall(EWD.SetViewHideMode,vptr(FALSE)) 'Hide_Off



If LW=32990 Then axcall(EWD.SetViewDisplayMode,vptr(1)) 'Shade
If LW=32991 Then axcall(EWD.SetViewDisplayMode,vptr(0)) 'Wire_frame
'  no se como funciona -> If LW=33080 Then axcall(EWD.Texture) 'Texture

'If LW=32997 Then axcall(EWD.Set_Background_color) 'Set_Background_color
'If LW=32998 Then axcall(EWD.Set_Background_image) 'Set_Background_image

