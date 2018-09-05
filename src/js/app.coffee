import $ from 'zepto-modules/_min'

import El from 'el.js/src'
import ref from 'referential'
import Hanzo from 'hanzo.js'

import './components/raw'
import './components/price'
import './components/gallery'
import './components/launch-squeeze-form'
import './components/video-form'
import './components/checkout-flow'

import './astley'
import './shop'

import Shop from 'shop.js/src'

import objectAssign from 'es-object-assign'
window.objectAssign = objectAssign

El.mount 'price, gallery, raw'

m = Shop.getMediator()

statusCreated = (res) -> res.status is 201

client = new Hanzo.Api
client.addBlueprints 'form',
  subscribe:
    method: 'POST'
    url:    (x) -> "/form/#{x.formId ? x}/subscribe"
    expects: statusCreated

El.mount 'launch-squeeze-form, video-form',
  client: client
  mediator: m
  data: ref {}

window.addToCart = (productId, number)->
  Shop.setItem productId, number
  m.trigger 'checkout-open'

window.logout = ->
  Shop.client.account.logout()
  window.location.replace '/login'

window?.$ = $

$(window).on 'scroll', ->
  top = $(@).scrollTop()
  test = 3700
  if top >= test
    $('.scrolling-show').addClass 'show'
  else
    $('.scrolling-show').removeClass 'show'

  $('.close-scrolling-show').on 'click', ->
    $('.scrolling-show').hide()


$('.stripe-link')
  .attr('href', '//www.authorize.net')
  .find('img')
  .attr('src', '/img/authorize-net-logo.png')
