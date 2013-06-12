Wws.Views ||= {}
Wws.Views.Admin ||= {}

class Wws.Views.AdminView extends Backbone.View

  el: "body"

  initialize: () ->
    this.initToggleBehaviour()
    this.initDatePicker()
    this.initDateTimePicker()
    this.setActiveTab()
    $('a[data-toggle="tab"]').on 'shown', (event) =>
      this.changeFormHashTag(event.currentTarget)
    $(".chosen-select").chosen
      no_results_text: "Pas de résultat pour"

  changeActivityPeriod: (e) ->
    window.location.href = window.location.pathname + "?period=#{$(e.target).val()}"

  setActiveTab: () ->
    if window.location.hash != "" && $('a[href="'+window.location.hash+'"]').length > 0
      tab = $('a[href="'+window.location.hash+'"]')
      tab.tab("show")
      this.changeFormHashTag(tab)

  changeFormHashTag: (tab_link) ->
    hash = $(tab_link).attr("href")
    form = $(tab_link).parents("form")
    if $(form).length == 0
      form = $(".page-form").first()
    if hash?
      window.location.hash = hash
    if hash? && $(form).length > 0
      current_action = form.attr("action")
      new_action = if current_action.indexOf("#") == -1 then current_action+hash else current_action.replace(/#.*/, hash)
      form.attr("action", new_action)

  initToggleBehaviour: () ->
    $("input[data-behaviour='toggle']").each () ->
      if !$(this).is(":checked")
        $($(this).data("target")).hide()

    $("input[data-behaviour='toggle']").change () ->
      $($(this).data("target")).toggle()

  initDatePicker: () ->
    $(".date-picker").datepicker
      language: "fr",
      dateFormat: "dd/mm/yy",
      changeYear: true,
      changeMonth: true,
      yearRange: "-75:+5",
      autoclose: true,
      todayHighlight: true

  initDateTimePicker: () ->
    $('.datetime-picker').datetimepicker
      dateFormat: "dd/mm/yy"
      timeFormat: "HH:mm"

    $('.time-picker').datetimepicker
      timeFormat: "HH:mm"
      timeOnly: true      