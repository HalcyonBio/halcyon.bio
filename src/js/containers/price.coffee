import El from 'el.js'

export class Price extends El.View
  tag: 'price'

  subscribe: true

  init: ->
    super arguments...

  subscription: ->
    @subscribe = true
    @scheduleUpdate()

  onetime: ->
    @subscribe = false
    @scheduleUpdate()

Price.register()
