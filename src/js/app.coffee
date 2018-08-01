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

El.mount 'launch-squeeze-form',
  mediator: Shop.getMediator()
  data: ref {}

window?.$ = $
