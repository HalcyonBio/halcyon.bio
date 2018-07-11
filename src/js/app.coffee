import $ from 'zepto-modules/_min'

import El from 'el.js'

import './containers/price'
import './containers/gallery'

import './astley'

El.mount 'price, gallery'

window?.$ = $
