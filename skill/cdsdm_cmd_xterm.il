; cdsdm_xterm.il
;

procedure( cdsdm_xterm( lib cell view cat )
  let( ( path )
	
	path = cdsdm_svn->work_dir
	
	if( and(lib=="" cell=="" view=="" cat=="") then
	  path = cdsdm_svn->work_dir
	)
	if( and(lib!="" cell=="" view=="" cat=="") then
	  path = ddGetObjReadPath(ddGetObj(lib))
	)
	if( and(lib!="" cell=="" view=="" cat!="") then
	  path = ddGetObjReadPath(ddGetObj(lib))
	)
	if( and(lib!="" cell!="" view=="" cat=="") then
	  path = ddGetObjReadPath(ddGetObj(lib cell))
	)
	if( and(lib!="" cell!="" view=="" cat!="") then
	  path = ddGetObjReadPath(ddGetObj(lib))
	)
	if( and(lib!="" cell!="" view!="" cat=="") then
	  path = ddGetObjReadPath(ddGetObj(lib cell view))
	)
	if( and(lib!="" cell!="" view!="" cat!="") then
	  path = ddGetObjReadPath(ddGetObj(lib cell))
	)

    ipcBatchProcess( sprintf(nil "cd %s && %s" path cdsdm_svn->xterm )  "" "" )

  )
)