Template.showSession.helpers
  't1': ->
    if Session.get('t1') == 1 then 'On' else  'Off'
  't2': ->
    if Session.get('t2') == 1 then 'On' else  'Off'