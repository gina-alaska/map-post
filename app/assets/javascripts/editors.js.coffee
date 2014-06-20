$(document).on 'ready page:load', ->
  $('[data-behavior="datetime-picker"]').datetimepicker({
    sideBySide: true,
    useSeconds: false,
    minDate: moment().format('L')
  })