class Clock
  @REFRESH_TIMER: 1000

  constructor: (@elem) ->
    @elem.append '<div id="clock_time"></div><div id="clock_date" class="small dimmed"></div>'
    @time = @elem.find '#clock_time'
    @date = @elem.find '#clock_date'
    moment.locale('pl')

  refresh: =>
    @time.html moment().format('LT')
    @date.html moment().format('L')

$ ->
  elem = $('#clock')
  if elem.length > 0
    clock = new Clock elem
    clock.refresh()
    setInterval clock.refresh, Clock.REFRESH_TIMER
