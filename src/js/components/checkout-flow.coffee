import El from 'el.js/src'
import Shop from 'shop.js/src'
import $ from 'zepto-modules/_min'

m = Shop.getMediator()

unloadFn = (e)=>
  e.preventDefault()
  e.returnValue = 'Your order has not completed yet, are you sure you want to leave?'
  return 'Your order has not completed yet, are you sure you want to leave?'

export class CheckoutFlow extends El.View
  tag: 'checkout-flow'

  step: 'startCheckout'

  upsellStatuses: {}
  upsellEnabled: true

  init: ->
    super arguments...

    @upsellStatuses = {}

    @on 'mount', ->
      $(@root).addClass 'ready'

    @on 'update', ->
      $(@root).find('cart').addClass 'ready'
      $(@root).find('thankyou').addClass 'ready'

    m.on 'submit-success', =>
      @step = 5
      @scheduleUpdate()

    # Set the date we're counting down to
    @countDownDate = new Date().getTime()
    # Update the count down every 1 second
    x = ()=>
      # Get todays date and time
      now = (new Date).getTime()
      # Find the distance between now and the count down date
      distance = @countDownDate - now
      # Time calculations for days, hours, minutes and seconds
      @minutes = Math.floor(distance / 1000 / 60)
      @seconds = Math.floor(distance / 1000) % 60
      @centiseconds = Math.floor(distance / 10) % 100
      # Display the result in the element with id="demo"
      # If the count down is finished, write some text
      if distance <= 0 && @step != 'startCheckout' && @step != 'thankYou'
        @toThankYou()
      @update()
      requestAnimationFrame x

    requestAnimationFrame x

    try
      Shop.clear()
    Shop.setItem 'P7c8KkgxUEGRO0', 1, true
    @data.set 'order.metadata.upsell', false
    @data.set 'order.notifications.email.templateId', 'd-57f034971aec4beb8137c17b1eb71b02'

  getMinutes: ->
    if @minutes > 0
      return @minutes
    return 0

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

  toStart: ->
    @step = 0
    @scheduleUpdate()

  toCart: ->
    @step = 'startCheckout'
    @update()

  toUpsell1: ->
    @submit()
    @mediator.one 'submit-success', =>
      @step = 'mainUpsells'

      # ignore & lock
      Shop.setItem 'P7c8KkgxUEGRO0', 1, true, true
      @data.set 'order.metadata.upsell', true
      @data.set 'order.notifications.email.templateId', 'd-cfe9717a682e47a5b70f16fd794bca45'

      @countDownDate = new Date().getTime() + 300000
      # window.addEventListener 'beforeunload', unloadFn
      document.getElementsByTagName('checkout')[0].scrollIntoView()
      @update()

  toThankYou: ->
    @step = 'thankYou'
    @update()

  # generic upsell logic
  isUpsellSelected: (productId)->
    return @upsellStatuses[productId] && @upsellStatuses[productId].selected

  isUpsellEnabled: ()->
    return @upsellEnabled

  getUpsell: (productId)->
    return @upsellStatuses[productId]

  getUpsellError: (productId)->
    return if @upsellStatuses[productId] then @upsellStatuses[productId].errorMessage else undefined

  upsell: (productId, nextStep)->
    return =>
      @parent.checkedOut = false

      v.selected = false for k, v of @upsellStatuses

      @upsellStatuses[productId] =
        selected: true
        errorMessage: ''

      @upsellEnabled = false

      Shop.setItem productId, 1, true
      @submit()
      @update()

      @mediator.one 'submit-success', =>
        Shop.setItem productId, 1, true, true
        @step = nextStep

        @upsellStatuses[productId] =
          selected: false
          errorMessage: ''

        @countDownDate = new Date().getTime() + 300000
        @upsellEnabled = true
        @update()

        document.getElementsByTagName('checkout')[0].scrollIntoView()

        @mediator.off 'submit-success'
        @mediator.off 'submit-failed'

      @mediator.one 'submit-failed', (err)=>
        @upsellStatuses[productId] =
          selected: true
          errorMessage: err

        @upsellEnabled = true
        @update()

        @mediator.off 'submit-success'
        @mediator.off 'submit-failed'

  # sixMonthUpsell: ->
  #   @sixMonthUpsellSelected = true
  #   Shop.setItem 'rbcKz75Dt2k9AJ', 1, true
  #   @update()
  #   document.getElementsByTagName('checkout')[0].scrollIntoView()
  #   @toThankYou()

  # eliteUpgrade1: ->
  #   @eliteUpgrade1Selected = true
  #   @parent.checkedOut = false
  #   Shop.setItem 'qGcvWn19sxWb1O', 1, true
  #   @submit()
  #   @update()
  #   @mediator.one 'submit-success', =>
  #     Shop.setItem 'qGcvWn19sxWb1O', 1, true, true
  #     document.getElementsByTagName('checkout')[0].scrollIntoView()
  #     @toUpsell2()

  # eliteUpgrade2: ->
  #   @eliteUpgrade2Selected = true
  #   Shop.setItem 'pocm8A9PfzPwZK', 1, true
  #   @update()
  #   document.getElementsByTagName('checkout')[0].scrollIntoView()
  #   @toThankYou()

  # eliteUpgrade3: ->
  #   @eliteUpgrade3Selected = true
  #   Shop.setItem '0Kcx0egPcYqGPA', 1, true
  #   @update()
  #   document.getElementsByTagName('checkout')[0].scrollIntoView()
  #   @toThankYou()

  # oneYearUpsell: ->
  #   @oneYearUpsell = true
  #   Shop.setItem 'rbcKzWg1c2k9AJ', 1, true
  #   @update()
  #   document.getElementsByTagName('checkout')[0].scrollIntoView()
  #   @toThankYou()

  # executiveUpgrade1: ->
  #   @executiveUpgrade1 = true
  #   @parent.checkedOut = false
  #   Shop.setItem '0Kcx0egPcYqGPA', 1, true
  #   @submit()
  #   @update()
  #   @mediator.one 'submit-success', =>
  #     Shop.setItem '0Kcx0egPcYqGPA', 1, true, true
  #     document.getElementsByTagName('checkout')[0].scrollIntoView()
  #     @toUpsell3()

  # executiveUpgrade2: ->
  #   @executiveUpgrade2 = true
  #   Shop.setItem 'JwcnoBljt4ZK2J', 1, true
  #   @update()
  #   document.getElementsByTagName('checkout')[0].scrollIntoView()
  #   @toThankYou()

CheckoutFlow.register()
