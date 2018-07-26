import El from 'el.js/src'
import Shop from 'shop.js/src'

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

  addToCart: ->
    if @subscribe
      Shop.setItem 'KncQypzPIEOePB', 1
      Shop.setItem 'D1cONpe5ueODn1', 0
    else
      Shop.setItem 'D1cONpe5ueODn1', 1
      Shop.setItem 'KncQypzPIEOePB', 0

Price.register()
