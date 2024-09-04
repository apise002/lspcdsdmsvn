; cdsdm_lmgr_proc.il
;

procedure( cdsdm_lmgr_proc( @optional lmgr lib cell view dum cat )
    case( lmgr
	    ( "cdsdm_lmgr_init"	        cdsdm_init()                      )
		( "cdsdm_lmgr_checkin"	    cdsdm_checkin(lib cell view "")   )
		( "cdsdm_lmgr_checkout"	    cdsdm_checkout(lib cell view "")  )
		( "cdsdm_lmgr_cancel"	    cdsdm_cancel(lib cell view "")    )
		( "cdsdm_lmgr_delete"	    cdsdm_delete(lib cell view "")    )
        ( "cdsdm_lmgr_update"	    cdsdm_update(lib cell view "")    )
        ( "cdsdm_lmgr_status"	    cdsdm_status(lib cell view "")    )
		( "cdsdm_lmgr_history"	    cdsdm_history(lib cell view "")  )
		( "cdsdm_lmgr_tag_add"	    cdsdm_tag_add(lib)                )
		( "cdsdm_lmgr_tag_info"	    cdsdm_tag_info(lib)               )
        ( "cdsdm_lmgr_xterm"	    cdsdm_xterm(lib cell view cat)    )
    )
)

procedure( cdsdm_lmgr_cat_proc( @optional lmgr lib cell view dum cat )
    if(cat=="" cat="Empty")
    case( lmgr
		( "cdsdm_lmgr_cat_checkin"	cdsdm_checkin(lib "" "" cat)  )
		( "cdsdm_lmgr_cat_checkout"	cdsdm_checkout(lib "" "" cat) )
		( "cdsdm_lmgr_cat_cancel"	cdsdm_cancel(lib "" "" cat)   )
		( "cdsdm_lmgr_cat_delete"	cdsdm_delete(lib "" "" cat)   )
        ( "cdsdm_lmgr_cat_update"	cdsdm_update(lib "" "" cat)   )
        ( "cdsdm_lmgr_cat_status"	cdsdm_status(lib "" "" cat)   )
    )
)

procedure( cdsdm_lmgr_popup( @optional lmgr lib cell view dum cat )
  when( member("cdsdmCascade" lmgrQueryNamedObjects())
    if( strlen(lib)>0  then
      cdsdm_lmgr_cb( lmgr lib cell view dum cat )
    else
	  lmgrManageMenuItems( list( 
		            "cdsdm_lmgr_sep2" "cdsdm_lmgr_checkin" "cdsdm_lmgr_checkout" "cdsdm_lmgr_cancel" "cdsdm_lmgr_delete" "cdsdm_lmgr_update" "cdsdm_lmgr_status" "cdsdm_lmgr_history"
					                  "cdsdm_lmgr_tag_add" "cdsdm_lmgr_tag_info"
					"cdsdm_lmgr_sep4" "cdsdm_lmgr_cat_checkin" "cdsdm_lmgr_cat_checkout" "cdsdm_lmgr_cat_cancel"
		                              "cdsdm_lmgr_cat_delete"  "cdsdm_lmgr_cat_update"   "cdsdm_lmgr_cat_status"
					      ) nil )
    )
  )
)

procedure( cdsdm_lmgr_cb(@optional lmgr lib cell view dum cat )
  let( ( libId )

    if( strlen(lib)>0 && (libId=ddGetObj(lib)) && member(lib ddGetLibList()~>name) && isDir(strcat(ddGetObjReadPath(libId) "/.svn")) then

	    lmgrManageMenuItems( list(
	                "cdsdm_lmgr_sep1" "cdsdm_lmgr_init"
		            "cdsdm_lmgr_sep2" "cdsdm_lmgr_checkin" "cdsdm_lmgr_checkout" "cdsdm_lmgr_cancel" "cdsdm_lmgr_delete" "cdsdm_lmgr_update" "cdsdm_lmgr_status" "cdsdm_lmgr_history"
					                  "cdsdm_lmgr_tag_add" "cdsdm_lmgr_tag_info"
		            "cdsdm_lmgr_sep3" "cdsdm_lmgr_xterm"
					"cdsdm_lmgr_sep4" "cdsdm_lmgr_cat_checkin" "cdsdm_lmgr_cat_checkout" "cdsdm_lmgr_cat_cancel"
		                              "cdsdm_lmgr_cat_delete"  "cdsdm_lmgr_cat_update"   "cdsdm_lmgr_cat_status"
				          ) t )
    else
	    lmgrManageMenuItems( list( 
		            "cdsdm_lmgr_sep2" "cdsdm_lmgr_checkin" "cdsdm_lmgr_checkout" "cdsdm_lmgr_cancel" "cdsdm_lmgr_delete" "cdsdm_lmgr_update" "cdsdm_lmgr_status" "cdsdm_lmgr_history"
					                  "cdsdm_lmgr_tag_add" "cdsdm_lmgr_tag_info"
					"cdsdm_lmgr_sep4" "cdsdm_lmgr_cat_checkin" "cdsdm_lmgr_cat_checkout" "cdsdm_lmgr_cat_cancel"
		                              "cdsdm_lmgr_cat_delete"  "cdsdm_lmgr_cat_update"   "cdsdm_lmgr_cat_status"
					      ) nil )
    )
  )
)