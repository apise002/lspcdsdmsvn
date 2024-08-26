; init.il
;

; sets the priority value for child processes
ipcSetPriority(0)

; make table
when( null(boundp('cdsdm_svn)) || null(tablep(cdsdm_svn))
  cdsdm_svn = makeTable("cdsdm_svn")
)

; path
cdsdm_svn->path = getShellEnvVar("LSPCDSDMSVN_HOME")
cdsdm_svn->bin = strcat( cdsdm_svn->path "/bin" )
cdsdm_svn->skill = strcat( cdsdm_svn->path "/skill" )

; load
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_init.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_checkin.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_checkout.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_cancel.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_delete.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_update.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_status.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_tag.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_cmd_xterm.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_proc_common.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_menu_cdsLibMgr_proc.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_menu_schlay_proc.il" ) )
load( strcat( cdsdm_svn->skill "/cdsdm_menu_schlay.il" ) )

; var
cdsdm_svn->work_dir = cdsdm_get_workdir()
cdsdm_svn->backup_name = ".cds.lib.lspcdsdmsvn"
cdsdm_svn->backup_path = cdsdm_cdslib_backup()

; command
cdsdm_svn->chmod = "/bin/chmod"
cdsdm_svn->cp = "/bin/cp -rf"
cdsdm_svn->svn = "svn"
cdsdm_svn->gzip = "/bin/gzip"
cdsdm_svn->rm = "/bin/rm -rf"
cdsdm_svn->xterm = cdsdm_get_xterm()

; bin
cdsdm_svn->svn_cmd_init = strcat(cdsdm_svn->bin "/svn_cmd_init")
cdsdm_svn->svn_cmd_checkin = strcat(cdsdm_svn->bin "/svn_cmd_checkin")
cdsdm_svn->svn_cmd_checkout = strcat(cdsdm_svn->bin "/svn_cmd_checkout")
cdsdm_svn->svn_cmd_cancel = strcat(cdsdm_svn->bin "/svn_cmd_cancel")
cdsdm_svn->svn_cmd_delete = strcat(cdsdm_svn->bin "/svn_cmd_delete")
cdsdm_svn->svn_cmd_update = strcat(cdsdm_svn->bin "/svn_cmd_update")
cdsdm_svn->svn_cmd_status = strcat(cdsdm_svn->bin "/svn_cmd_status")
cdsdm_svn->svn_cmd_tag_add = strcat(cdsdm_svn->bin "/svn_cmd_tag_add")
cdsdm_svn->svn_cmd_tag_info = strcat(cdsdm_svn->bin "/svn_cmd_tag_info")

; contact
println("[INFOR] lspcdsdmsvn initial successful")
println("[INFOR] any problem or question, contact apise_001@163.com")

;BindKey
hiSetBindKey("Schematics" "Shift<Key>1" "cdsdm_schlay_proc(\"cdsdm_lmgr_status\")"   )
hiSetBindKey("Schematics" "Shift<Key>2" "cdsdm_schlay_proc(\"cdsdm_lmgr_checkout\")" )
hiSetBindKey("Schematics" "Shift<Key>3" "cdsdm_schlay_proc(\"cdsdm_lmgr_cancel\")"   )
hiSetBindKey("Symbol"     "Shift<Key>1" "cdsdm_schlay_proc(\"cdsdm_lmgr_status\")"   )
hiSetBindKey("Symbol"     "Shift<Key>2" "cdsdm_schlay_proc(\"cdsdm_lmgr_checkout\")" )
hiSetBindKey("Symbol"     "Shift<Key>3" "cdsdm_schlay_proc(\"cdsdm_lmgr_cancel\")"   )
hiSetBindKey("Layout"     "Shift<Key>1" "cdsdm_schlay_proc(\"cdsdm_lmgr_status\")"   )
hiSetBindKey("Layout"     "Shift<Key>2" "cdsdm_schlay_proc(\"cdsdm_lmgr_checkout\")" )
hiSetBindKey("Layout"     "Shift<Key>3" "cdsdm_schlay_proc(\"cdsdm_lmgr_cancel\")"   )