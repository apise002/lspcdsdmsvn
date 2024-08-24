; cdsdm_init.il
;

procedure( cdsdm_init()
  let( ( svn_url flag_define cmd cid result ) 

    when( cdsdm_init_form()

      svn_url     = cdsdm_init_form->cdsdm_init_svn_field->value
	  flag_define = cdsdm_init_form->flag_define->value

	  if(flag_define then
	    flag_define = "1"
	  else
	    flag_define = "0"
	  )

      cmd = sprintf( nil "%s %s %s %s" cdsdm_svn->svn_cmd_init svn_url flag_define cdsdm_svn->work_dir)
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


procedure( cdsdm_init_form()
  let( ( svn_url flag_define )

    svn_url = hiCreateStringField(
	?name		'cdsdm_init_svn_field
	?prompt		"SVN URL:"
	?value		""
	?defValue	""
    )

	flag_define = hiCreateBooleanButton(
    ?name `flag_define
    ?buttonText "want define to cds.lib?"
	?value t
    ?defValue t
    ?callback ""
    )

    hiCreateAppForm(
	?name		'cdsdm_init_form
	?formTitle	"cdsDM: SVN Initialization"
	?fields		list( svn_url flag_define )
	?buttonLayout	'(OKCancel)
    )

    hiDisplayForm('cdsdm_init_form)

  )
)