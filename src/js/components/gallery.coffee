import El from 'el.js/src'

export class Gallery extends El.View
  tag: 'gallery'

  current: 0
  total: 0

  init: ->
    @current = parseInt @current, 10
    @total = parseInt @total, 10

    super arguments...

  last: ->
    @current = (@total + @current - 1) % @total
    @scheduleUpdate()

  next: ->
    @current = (@current + 1) % @total
    @scheduleUpdate()

  jump: (n) ->
    return ->
      @current = (@total + n) % @total
      @scheduleUpdate()

Gallery.register()
