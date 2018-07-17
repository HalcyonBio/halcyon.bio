import $ from 'zepto-modules/_min'

import El from 'el.js/src'

import './containers/price'
import './containers/gallery'

import './astley'
import './shop'

El.mount 'price, gallery'

window?.$ = $
