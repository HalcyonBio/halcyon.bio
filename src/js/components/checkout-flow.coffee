import El from 'el.js/src'
import Shop from 'shop.js/src'
import $ from 'zepto-modules/_min'

m = Shop.getMediator()

export class CheckoutFlow extends El.View
  tag: 'checkout-flow'

  step: 0

  upsold: false

  init: ->
    super arguments...

    @on 'update', ->
      $(@root).find('cart').addClass 'ready'

    m.on 'submit-success', =>
      @step = 5
      @scheduleUpdate()

    # Set the date we're counting down to
    @countDownDate = new Date().getTime()
    @distance = 0
    # Update the count down every 1 second
    x = setInterval =>
      # Get todays date and time
      now = (new Date).getTime()
      # Find the distance between now and the count down date
      distance = @countDownDate - now
      # Time calculations for days, hours, minutes and seconds
      @seconds = Math.floor(distance / 1000)
      # Display the result in the element with id="demo"
      # If the count down is finished, write some text
      if @seconds <= 0 && @step > 0 && @step <4
        @toCheckout()
      @update()
      console.log('seconds: ', @seconds)
    , 1000

  getSeconds: ->
    if @seconds > 0
      return @seconds
    return 0

  toStart: ->
    @step = 0
    @scheduleUpdate()

  toCart: ->
    @step = 1
    @countDownDate = new Date().getTime() + 60000
    @seconds = 60
    @update()

  toUpsell1: ->
    @step = 2
    @upsold = true
    @countDownDate = new Date().getTime() + 30000
    @seconds =30
    @update()

  toUpsell2: ->
    @step = 3
    @upsold = true
    @countDownDate = new Date().getTime() + 30000
    @seconds = 30
    @update()

  toCheckout: ->
    @step = 4
    @upsold = true
    @scheduleUpdate()

  toThankYou: ->
    @step = 5
    @scheduleUpdate()

  eliteUpgrade1: ->
    Shop.clear()
    Shop.setItem 'qGcvWn19sxWb1O', 1
    @toUpsell1()

  eliteUpgrade2: ->
    Shop.setItem 'pocm8A9PfzPwZK', 1, true
    @toCheckout()

  executiveUpgrade1: ->
    Shop.clear()
    Shop.setItem '0Kcx0egPcYqGPA', 1
    @toUpsell2()

  executiveUpgrade2: ->
    Shop.setItem 'JwcnoBljt4ZK2J', 1, true
    @toCheckout()

CheckoutFlow.register()
