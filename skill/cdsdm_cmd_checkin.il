; cdsdm_checkin.il
;

procedure( cdsdm_checkin(lib cell view cat)
  let( ( mtag tmp_dir lib_dir i cmd cid result )

    when( cdsdm_checkin_form()

	  mtag = cdsdm_checkin_form->cdsdm_mtag_field->value

	  tmp_dir = ddGetObjReadPath(ddGetObj(lib))
	  lib_dir = ""

	  for( i 1 length(parseString(tmp_dir "/"))-1
        lib_dir = strcat( lib_dir "/" nthelem(i parseString(tmp_dir "/")) )
      )

	  cmd = sprintf( nil "%s lib_dir=%s lib=%s cell=%s view=%s cat=%s mtag=\"%s\"" cdsdm_svn->svn_cmd_checkin lib_dir lib cell view cat mtag )
	  ;println(cmd)
	  cid = ipcBeginProcess(cmd)
      ipcWait(cid)
      result = ipcReadProcess(cid 10)
	  
	  result
	)
  )
)


procedure( cdsdm_checkin_form()
  let( ( mtag )

    mtag = hiCreateStringField(
	?name		'cdsdm_mtag_field
	?prompt		"SVN Check In Tag Information:"
	?value		""
	?defValue	""
    )

    hiCreateAppForm(
	?name		'cdsdm_checkin_form
	?formTitle	"cdsDM: SVN Check In"
	?fields		list( mtag )
	?buttonLayout	'(OKCancel)
    )

    hiDisplayForm('cdsdm_checkin_form)

  )
)