; cdsdm_delete.il
;

procedure( cdsdm_delete(lib cell view cat)
  let( ( flag_delete_svn flag_delete_local tmp_dir lib_dir i cmd cid result ) 

    when( cdsdm_delete_form()

      flag_delete_svn   = cdsdm_delete_form->flag_delete_svn->value
	  flag_delete_local = cdsdm_delete_form->flag_delete_local->value

	  if(flag_delete_svn then
	    flag_delete_svn = "1"
	  else
	    flag_delete_svn = "0"
	  )
	  if(flag_delete_local then
	    flag_delete_local = "1"
	  else
	    flag_delete_local = "0"
	  )

	  tmp_dir = ddGetObjReadPath(ddGetObj(lib))
	  lib_dir = ""

	  for( i 1 length(parseString(tmp_dir "/"))-1
        lib_dir = strcat( lib_dir "/" nthelem(i parseString(tmp_dir "/")) )
      )

	  cmd = sprintf( nil "%s lib_dir=%s lib=%s cell=%s view=%s cat=%s flag_svn=%s flag_local=%s" cdsdm_svn->svn_cmd_delete lib_dir lib cell view cat flag_delete_svn flag_delete_local)
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


procedure( cdsdm_delete_form()
  let( ( flag_delete_svn flag_delete_local )

	flag_delete_svn = hiCreateBooleanButton(
    ?name `flag_delete_svn
    ?buttonText "want delete date of svn and local?"
	?value t
    ?defValue t
    ?callback "flag_delete_svn_CB(hiGetCurrentForm())"
    )

	flag_delete_local = hiCreateBooleanButton(
    ?name `flag_delete_local
    ?buttonText "want delete date of only local?"
	?value nil
    ?defValue nil
    ?callback "flag_delete_local_CB(hiGetCurrentForm())"
    )

    hiCreateAppForm(
	?name		'cdsdm_delete_form
	?formTitle	"cdsDM: SVN Delete"
	?fields		list( flag_delete_svn flag_delete_local )
	?buttonLayout	'(OKCancel)
    )

    hiDisplayForm('cdsdm_delete_form)

  )
)

procedure( flag_delete_svn_CB(theForm)
  let( ( value )

	value = theForm->flag_delete_svn->value

	if(value==t then
	  theForm->flag_delete_local->value = nil
	else
	  theForm->flag_delete_local->value = t
	)

  )
)

procedure( flag_delete_local_CB(theForm)
  let( ( value )

	value = theForm->flag_delete_local->value

	if(value==t then
	  theForm->flag_delete_svn->value = nil
	else
	  theForm->flag_delete_svn->value = t
	)

  )
)