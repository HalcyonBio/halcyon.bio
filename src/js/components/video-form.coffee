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
        window.location.hash = '#thank-you'

        @scheduleUpdate()
      # .catch (e)->
      #   console.log 'Submit Failed', e

  init: ->
    super arguments...
    @submited = !!(akasha.get 'submited')

    @on 'mount', =>
      $(@root).addClass 'ready'

      if @submited
        @setupRedirects()

      if window.location.hash == '#episode-one' && !@submited
        window.location.hash = ''

      requestAnimationFrame =>
        if window.location.hash == '#optincta'
          $(@root).find('input[name="email"]').focus()

      window.addEventListener 'hashchange', =>
        requestAnimationFrame =>
          if window.location.hash == '#optincta'
            $(@root).find('input[name="email"]').focus()

      $(@root).find('input[name="email"]').on 'keypress', (e) =>
        @submit() if e.keyCode is 13

  setupRedirects: ->
    $('[href="#optincta"]').attr 'href', '#episode-one'
    $('.btn-trailer').on 'click', ->
      window.location.hash = ''
      requestAnimationFrame ->
        window.location.hash = '#episode-one'
      return false

VideoForm.register()
