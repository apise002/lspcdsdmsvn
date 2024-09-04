
/*
Main Virtuoso Menu
*/

procedure( PostInstallTrigger(l_args)
  let( ( win cv lib libId)

    win  = hiGetCurrentWindow()
    cv   = geGetEditCellView()
	lib  = cv->libName

	if( strlen(lib)>0 && (libId=ddGetObj(lib)) && member(lib ddGetLibList()~>name) && isDir(strcat(ddGetObjReadPath(libId) "/.svn")) then

      hiCreatePulldownMenu(
         'LspCdsDmSvnSchLayMenu
         "lspCdsDmSvn"
         list(
            hiCreateMenuItem(?name 'item1 ?itemText "Init ..."            ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_init\"     )" )
            hiCreateSeparatorMenuItem(?name 'itemd1)                      
            hiCreateMenuItem(?name 'item2 ?itemText "Checkin ..."         ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_checkin\"  )" )
            hiCreateMenuItem(?name 'item3 ?itemText "Checkout ..."        ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_checkout\" )" )
            hiCreateMenuItem(?name 'item4 ?itemText "Cancel Checkout ..." ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_cancel\"   )" )
            hiCreateMenuItem(?name 'item5 ?itemText "Delete ..."          ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_delete \"  )" )
            hiCreateMenuItem(?name 'item6 ?itemText "Update ..."          ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_update\"   )" )
            hiCreateMenuItem(?name 'item7 ?itemText "Status ..."          ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_status\"   )" )
			hiCreateMenuItem(?name 'item8 ?itemText "History ..."         ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_history\"  )" )
			hiCreateSeparatorMenuItem(?name 'itemd2)                      
            hiCreateMenuItem(?name 'item9 ?itemText "Xterm"               ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_xterm\"    )" )
         )
      )

	else

	  hiCreatePulldownMenu(
         'LspCdsDmSvnSchLayMenu
         "lspCdsDmSvn"
         list(
            hiCreateMenuItem(?name 'item1 ?itemText "Init ..."            ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_init\"     )" )
            hiCreateSeparatorMenuItem(?name 'itemd1)                       
            hiCreateMenuItem(?name 'item8 ?itemText "Xterm"               ?callback "cdsdm_schlay_proc( \"cdsdm_lmgr_xterm\"    )" )
         )
      )
	)

    if(not(member('LspCdsDmSvnSchLayMenu hiGetBannerMenus(hiGetCurrentWindow()))) then
	  hiInsertBannerMenu(win LspCdsDmSvnSchLayMenu hiGetNumMenus(win))
	)
	
  )
)

viewTypeList=list("schematic" "schematicXL" "schematicEXL" "schematicGXL" "schematicSymbol" "layout" "maskLayout" "maskLayoutXL" "maskLayoutEXL" "maskLayoutGXL")
foreach(viewType viewTypeList
  when(member(viewType deGetAllViewTypes())
    deRegUserTriggers(viewType nil nil 'PostInstallTrigger )
  )
)