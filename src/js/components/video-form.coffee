import El from 'el.js/src'
import { isRequired, isEmail } from 'shop.js/src/containers/middleware'
import $ from 'zepto-modules/_min'
import akasha from 'akasha'

export class VideoForm extends El.Form
  tag: 'video-form'

  configs:
    'email': [isRequired, isEmail]

  submited: false

  _submit: ->
    opts =
      mailinglistId: '94uloYDqfDKlbJ'
      email: @data.get 'email'

    @client.mailinglist.subscribe opts
      .finally =>
        @submited = true
        akasha.set 'submited', true
        @setupRedirects()
        window.location.hash = 'neuromethodtrailer'

        @scheduleUpdate()
      # .catch (e)->
      #   console.log 'Submit Failed', e

  init: ->
    super arguments...
    $(@root).addClass 'ready'

    @submited = !!(akasha.get 'submited')
    if @submited
      @setupRedirects()

  setupRedirects: ->
    $('[href="#opt-in"], .btn-trailer').on 'click', ->
      window.location.hash = 'neuromethodtrailer'
      return false

VideoForm.register()
