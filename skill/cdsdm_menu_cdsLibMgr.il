
let( (dm)
    dm = ddGetPathDMSys(simplifyFilename(getWorkingDir()))
    when(null(dm) || equal(dm "none")
      lmgrManageMenuItems(list("designCascade") nil)
    )
    lmgrDisplayMessage( "Loading cdsDM Version 1.0\n" )
)

lmgrCreateMenu( "cdsdmCascade" '(("label" "cdsDM") ("mapCallback" ("cdsdm_lmgr_cb")) ) )
lmgrAddMenuItems( "menuBar" "" '("cdsdmCascade") )

lmgrCreateMenuItem( "cdsdm_lmgr_sep1" "separator" nil )
lmgrCreateMenuItem( "cdsdm_lmgr_sep2" "separator" nil )
lmgrCreateMenuItem( "cdsdm_lmgr_sep3" "separator" nil )

lmgrCreateMenuItem( "cdsdm_lmgr_init" "simple"
    '(("label"	"Init ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)

lmgrCreateMenuItem( "cdsdm_lmgr_checkin" "simple"
    '(("label"	"Checkin ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_checkout" "simple"
    '(("label"	"Checkout ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_cancel" "simple"
    '(("label"	"Cancel Checkout ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_delete" "simple"
    '(("label"	"Delete ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_update" "simple"
    '(("label"	"Update ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_status" "simple"
    '(("label"	"Status ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_history" "simple"
    '(("label"	"History ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_tag_add" "simple"
    '(("label"	"Tag Add ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_tag_info" "simple"
    '(("label"	"Tag Info ...")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_xterm" "simple"
    '(("label"	"Xterm")
      ("callback" ("cdsdm_lmgr_proc"))
     )
)

lmgrAddMenuItems( "cdsdmCascade" "LCVlcv"  '(
		"cdsdm_lmgr_sep1" "cdsdm_lmgr_init"
		"cdsdm_lmgr_sep2" "cdsdm_lmgr_checkin" "cdsdm_lmgr_checkout" "cdsdm_lmgr_cancel" "cdsdm_lmgr_delete" "cdsdm_lmgr_update" "cdsdm_lmgr_status"
) )
lmgrAddMenuItems( "cdsdmCascade" "Vv"  '(
		                  "cdsdm_lmgr_history"
) )
lmgrAddMenuItems( "cdsdmCascade" "Ll"  '(
		                  "cdsdm_lmgr_tag_add" "cdsdm_lmgr_tag_info"
) )
lmgrAddMenuItems( "cdsdmCascade" "LCVlcv"  '(
		"cdsdm_lmgr_sep3" "cdsdm_lmgr_xterm"
) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lmgrCreateMenuItem( "cdsdm_lmgr_sep4" "separator" nil )

lmgrCreateMenuItem( "cdsdm_lmgr_cat_checkin" "simple"
    '(("label"	"Category Checkin ...")
      ("callback" ("cdsdm_lmgr_cat_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_cat_checkout" "simple"
    '(("label"	"Category Checkout ...")
      ("callback" ("cdsdm_lmgr_cat_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_cat_cancel" "simple"
    '(("label"	"Category Cancel Checkout ...")
      ("callback" ("cdsdm_lmgr_cat_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_cat_delete" "simple"
    '(("label"	"Category Delete ...")
      ("callback" ("cdsdm_lmgr_cat_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_cat_update" "simple"
    '(("label"	"Category Update ...")
      ("callback" ("cdsdm_lmgr_cat_proc"))
     )
)
lmgrCreateMenuItem( "cdsdm_lmgr_cat_status" "simple"
    '(("label"	"Category Status ...")
      ("callback" ("cdsdm_lmgr_cat_proc"))
     )
)

lmgrAddMenuItems( "cdsdmCascade" "t"  '(
		"cdsdm_lmgr_sep4" "cdsdm_lmgr_cat_checkin" "cdsdm_lmgr_cat_checkout" "cdsdm_lmgr_cat_cancel"
		                  "cdsdm_lmgr_cat_delete"  "cdsdm_lmgr_cat_update"   "cdsdm_lmgr_cat_status"
) )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

lmgrCreateMenu("popup" '(("mapCallback" ("cdsdm_lmgr_popup")) ))