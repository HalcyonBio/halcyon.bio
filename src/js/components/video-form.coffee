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
        window.location.hash = '#neuromethodtrailer'

        @scheduleUpdate()
      # .catch (e)->
      #   console.log 'Submit Failed', e

  init: ->
    super arguments...
    $(@root).addClass 'ready'

    @submited = !!(akasha.get 'submited')
    if @submited
      @setupRedirects()

    if window.location.hash == '#neuromethodtrailer' && !@submited
      window.location.hash = ''

    requestAnimationFrame ->
      if window.location.hash == '#opt-in'
        $('input[name="email"]').focus()

    window.addEventListener 'hashchange', ->
      requestAnimationFrame ->
        if window.location.hash == '#opt-in'
          $('input[name="email"]').focus()

  setupRedirects: ->
    $('[href="#opt-in"]').attr 'href', '#neuromethodtrailer'
    $('.btn-trailer').on 'click', ->
      window.location.hash = ''
      requestAnimationFrame ->
        window.location.hash = '#neuromethodtrailer'
      return false

VideoForm.register()
