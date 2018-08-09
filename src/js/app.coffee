import $ from 'zepto-modules/_min'

import El from 'el.js/src'
import ref from 'referential'
import Hanzo from 'hanzo.js'

import './components/price'
import './components/gallery'
import './components/launch-squeeze-form'
import './components/video-form'

import './astley'
import './shop'

import Shop from 'shop.js/src'

El.mount('price, gallery')

m = Shop.getMediator()

statusCreated = (res) -> res.status is 201

client = new Hanzo.Api
client.addBlueprints 'mailinglist',
  subscribe:
    method: 'POST'
    url:    (x) -> "/mailinglist/#{x.mailinglistId ? x}/subscribe"
    expects: statusCreated

El.mount 'launch-squeeze-form, video-form',
  client: client
  mediator: m
  data: ref {}

window.addToCart = (productId, number)->
  Shop.setItem productId, number
  m.trigger 'checkout-open'

window?.$ = $
