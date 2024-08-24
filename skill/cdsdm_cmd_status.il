; cdsdm_status.il
;

procedure( cdsdm_status(lib cell view cat)
  let( ( tmp_dir lib_dir i cmd cid result )

	  tmp_dir = ddGetObjReadPath(ddGetObj(lib))
	  lib_dir = ""

	  for( i 1 length(parseString(tmp_dir "/"))-1
        lib_dir = strcat( lib_dir "/" nthelem(i parseString(tmp_dir "/")) )
      )

	  cmd = sprintf( nil "%s lib_dir=%s lib=%s cell=%s view=%s cat=%s" cdsdm_svn->svn_cmd_status lib_dir lib cell view cat )
	  ;println(cmd)
	  cid = ipcBeginProcess(cmd)
      ipcWait(cid)
      result = ipcReadProcess(cid 10)
	  
	  result
  )
)