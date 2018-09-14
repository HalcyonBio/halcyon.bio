import El from 'el.js/src'

export class Timer extends El.View
  tag: 'timer'

  distance: 0

  init: ->
    super arguments...

    @countDownDate = new Date("September 23, 2018").getTime()

    x = ()=>
      now = (new Date).getTime()
      distance = @countDownDate - now
      @days = Math.floor(distance / 1000 / 60 / 60 / 24)
      @hours = Math.floor(distance / 1000 / 60 / 60 % 24)
      @minutes = Math.floor(distance / 1000 / 60 % 60)
      @seconds = Math.floor(distance / 1000) % 60
      @centiseconds = Math.floor(distance / 10) % 100
      @update()
      requestAnimationFrame x

    requestAnimationFrame x

  getDays: ->
    if @days > 0
      if @days < 10
        return '0' + @days
      return @days

    return '00'

  getHours: ->
    if @hours > 0
      if @hours < 10
        return '0' + @hours
      return @hours

    return '00'

  getMinutes: ->
    if @minutes > 0
      if @minutes < 10
        return '0' + @minutes
      return @minutes

    return '00'

  getSeconds: ->
    if @seconds > 0
      if @seconds < 10
        return '0' + @seconds
      return @seconds

    return '00'

  getCentiSeconds: ->
    if @centiseconds > 0
      if @centiseconds < 10
        return '0' + @centiseconds
      return @centiseconds

    return '00'


Timer.register()

