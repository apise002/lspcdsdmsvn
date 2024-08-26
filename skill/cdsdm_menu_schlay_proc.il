; cdsdm_schlay_proc.il
;

procedure( cdsdm_schlay_proc( lmgr )
  let( ( cv result mode)

    cv = geGetEditCellView()
    result = cdsdm_lmgr_proc(lmgr cv->libName cv->cellName cv->viewName "" "")
	when( result
	  mode = cv~>mode
	  
      case( lmgr
	  	( "cdsdm_lmgr_checkin"	if(and(rexMatchp("succeed" result) (mode != "r")) geChangeEditMode("r")) )
	  	( "cdsdm_lmgr_checkout"	if(and(rexMatchp("succeed" result) (mode != "a")) geChangeEditMode("a")) )
	  	( "cdsdm_lmgr_cancel"	if(and(rexMatchp("succeed" result) (mode != "r")) geChangeEditMode("r")) )
      )
	)

  )
)