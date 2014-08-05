@export_try = (idx) ->
  content = $("#kpt_tries_attributes_#{idx}_content").val()
  $("#try_content").val(content)
  $("#export_form").submit()
  false

$ -> 
  $('#export_form').bind('ajax:complete', (data, res, xhr) ->
    alert("タスクを登録しました")
  )