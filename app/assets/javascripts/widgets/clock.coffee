class Clock
  @REFRESH_TIMER: 1000

  constructor: (@elem) ->
    @elem.append '<div id="clock_date"></div><div id="clock_time"></div>'
    @date = @elem.find '#clock_date'
    @time = @elem.find '#clock_time'

  refresh: =>
    @date.html moment().format('dddd, LL')
    @time.html moment().format('LT')

$ ->
  elem = $('#clock')
  if elem.length > 0
    clock = new Clock elem
    clock.refresh()
    setInterval clock.refresh, Clock.REFRESH_TIMER
