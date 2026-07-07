
' SAVE y OPEN EWD emplean un fichero global "FicheroEWD"
If LW=32777 Then 'Open EWD
    FicheroEWD=seleccionar_fichero( ,"EWD" )
    axcall(EWD.OpenEWD,txt2BSTR(FicheroEWD))
    axcall EWD.ZoomALL,vptr(TRUE)
endif
If LW=32778 Then 'Save EWD
    if FicheroEWD="" then ' si no se ha cargado, pide un nombre
        FicheroEWD=seleccionar_fichero( ,"EWD", 1 )
    end if
    axcall(EWD.SaveEwd,txt2BSTR(FicheroEWD))
end if
If LW=32779 Then ' Save AS ...
    FicheroEWD=seleccionar_fichero( ,"EWD", 1 )
    axcall(EWD.SaveEwd,txt2BSTR(FicheroEWD))
end if



' ficheros por defecto en IMPORT / EXPORT tipicos de OPENCASCADE
If LW=32794 Then   'BREP IMPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"BREP" )
    axcall(EWD.ImpFile,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32802 Then  ' BREP EXPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"BREP", 1 )
    axcall(EWD.ExpFile,txt2BSTR(fichero))
end if



If LW=32795 Then 'STEP IMPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"STP" )
    axcall(EWD.IMPStep214,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32804 Then  'STEP EXPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"STP", 1 )
    axcall(EWD.ExpStep214,txt2BSTR(fichero))
end if



If LW=32796 Then 'IMPORTAR IGES
  Dim fichero as String
  fichero=seleccionar_fichero( ,"IGS" )
  axcall(EWD.IMPIges214,txt2BSTR(fichero))
  axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32805 Then 'EXPORTAR IGES
  Dim fichero as String
  fichero=seleccionar_fichero( ,"IGS", 1 )
  axcall(EWD.EXPIges214,txt2BSTR(fichero))
end if



If LW=32800 Then  'DXF IMPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"DXF" )
    axcall(EWD.IMPDXF,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32808 Then  'DXF_MESH IMPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"DXF" )
    axcall(EWD.IMPDXFMesh,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32801 Then  'DXF_MESH EXPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"DXF", 1 )
    axcall(EWD.EXPDXFMesh,vptr(selentidad),txt2BSTR(fichero))
end if



If LW=32797 Then  'STL_MESH IMPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"STL" )
    axcall(EWD.IMPSTL,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32806 Then  'STLEXPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"STL", 1)
    axcall(EWD.EXPSTL,vptr(selentidad),txt2BSTR(fichero),1) ' saca los STL como binarios por defecto (param 3=1)
end if



If LW=32798 Then  'OBJ_MESH IMPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"OBJ" )
    axcall(EWD.IMPOBJ,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if
If LW=32807 Then  'OBJ EXPORT
    Dim fichero as String
    fichero=seleccionar_fichero( ,"OBJ" )
    axcall(EWD.EXPOBJ,vptr(selentidad),txt2BSTR(fichero))
end if



If LW=32799 Then  '3DS_MESH IMPORT (NO HAY EXPORT)
    Dim fichero as String
    fichero=seleccionar_fichero( ,"3DS" )
    axcall(EWD.Imp3DSFile,txt2BSTR(fichero))
    axcall EWD.ZoomALL,vptr(TRUE)
end if

