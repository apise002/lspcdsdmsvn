; cdsdm_proc_common.il
;

procedure( cdsdm_get_workdir()
  let( (cid result )

    cid = ipcBeginProcess("pwd")
    ipcWait(cid)
    result = ipcReadProcess(cid 10)

	car(parseString(result "\n"))
  )
)

procedure( cdsdm_cdslib_backup()
  let( ( cdslib (cdslib_backup "") )

    cdslib = ddGetStartup("cds.lib")
    for( i 1 length(parseString(cdslib "/"))-1
      cdslib_backup = strcat( cdslib_backup "/" nthelem(i parseString(cdslib "/")) )
    )

    strcat(cdslib_backup "/" cdsdm_svn->backup_name )

  )
)

procedure( cdsdm_get_xterm()
  let( (a b c result)

	result = "/usr/bin/xterm"
	a = "/bin/xterm"
	b = "/bin/konsole"
	c = "/usr/bin/konsole"

    if(isFile(a) result = a )
	if(isFile(b) result = b )
	if(isFile(c) result = c )

	result

  )
)