import $ from 'zepto-modules/_min'

import El from 'el.js/src'
import ref from 'referential'

import './components/price'
import './components/gallery'
import './components/launch-squeeze-form'

import './astley'
import './shop'

import Shop from 'shop.js/src'

El.mount 'price, gallery'

m = Shop.getMediator()

El.mount 'launch-squeeze-form',
  mediator: m
  data: ref {}

window.addToCart = (productId, number)->
  Shop.setItem productId, number
  m.trigger 'checkout-open'

window?.$ = $
