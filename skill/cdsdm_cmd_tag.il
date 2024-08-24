; cdsdm_tag.il
;

procedure( cdsdm_tag_add(lib)
  let( ( mtag tmp_dir lib_dir i cmd cid result )

    when( cdsdm_tag_add_form()

	  mtag = cdsdm_tag_add_form->cdsdm_mtag_field->value

	  tmp_dir = ddGetObjReadPath(ddGetObj(lib))
	  lib_dir = ""

	  for( i 1 length(parseString(tmp_dir "/"))-1
        lib_dir = strcat( lib_dir "/" nthelem(i parseString(tmp_dir "/")) )
      )

	  cmd = sprintf( nil "%s lib_dir=%s lib=%s mtag=\"%s\"" cdsdm_svn->svn_cmd_tag_add lib_dir lib mtag )
	  ;println(cmd)
	  cid = ipcBeginProcess(cmd)
      ipcWait(cid)
      result = ipcReadProcess(cid 10)
	  
	  result
	)
  )
)

procedure( cdsdm_tag_info(lib)
  let( ( tmp_dir lib_dir i cmd cid result )

	  tmp_dir = ddGetObjReadPath(ddGetObj(lib))
	  lib_dir = ""

	  for( i 1 length(parseString(tmp_dir "/"))-1
        lib_dir = strcat( lib_dir "/" nthelem(i parseString(tmp_dir "/")) )
      )

	  cmd = sprintf( nil "%s lib_dir=%s lib=%s" cdsdm_svn->svn_cmd_tag_info lib_dir lib )
	  ;println(cmd)
	  cid = ipcBeginProcess(cmd)
      ipcWait(cid)
      result = ipcReadProcess(cid 10)
	  
	  result
  )
)

procedure( cdsdm_tag_add_form()
  let( ( mtag )

    mtag = hiCreateStringField(
	?name		'cdsdm_mtag_field
	?prompt		"SVN Tag Add Information:"
	?value		""
	?defValue	""
    )

    hiCreateAppForm(
	?name		'cdsdm_tag_add_form
	?formTitle	"cdsDM: SVN Tag Add"
	?fields		list( mtag )
	?buttonLayout	'(OKCancel)
    )

    hiDisplayForm('cdsdm_tag_add_form)

  )
)