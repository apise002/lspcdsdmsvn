; cdsdm_update.il
;

procedure( cdsdm_update(lib cell view cat)
  let( ( tmp_dir lib_dir i cmd cid result )

    when ( cdsdm_update_form()

	  tmp_dir = ddGetObjReadPath(ddGetObj(lib))
	  lib_dir = ""

	  for( i 1 length(parseString(tmp_dir "/"))-1
        lib_dir = strcat( lib_dir "/" nthelem(i parseString(tmp_dir "/")) )
      )

	  cmd = sprintf( nil "%s lib_dir=%s lib=%s cell=%s view=%s cat=%s" cdsdm_svn->svn_cmd_update lib_dir lib cell view cat )
	  ;println(cmd)
	  cid = ipcBeginProcess(cmd)
      ipcWait(cid)
      result = ipcReadProcess(cid 10)

	  if(rexMatchp("succeed" result) then
	    ddsHiRefresh()
	  )
	  
	  result
    )
  )
)

procedure( cdsdm_update_form()
  let( (  )

    hiDisplayAppDBox(
	?name		'cdsdm_update_form
	?dboxBanner	"Warning"
	?dboxText   "Do you want to update?"
	?buttonLayout	'OKCancel
    )

  )
)