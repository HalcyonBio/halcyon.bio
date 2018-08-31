import El from 'el.js/src'
import { isRequired, isEmail } from 'shop.js/src/containers/middleware'
import $ from 'zepto-modules/_min'
import akasha from 'akasha'

export class VideoForm extends El.Form
  tag: 'video-form'

  configs:
    'email': [isRequired, isEmail]

  submitted:    false
  videoToShow: 0
  formId: '94uloYDqfDKlbJ'

  _submit: ->
    opts =
      formId: @formId
      email: @data.get 'email'

    @client.form.subscribe opts
      .finally =>
        @submitted = true
        akasha.set 'submitted', true
        @setupRedirects()
        switch @videoToShow
          when 0 then window.location.hash = '#thank-you'
          when 1 then window.location.hash = '#episode-one'
          when 2 then window.location.hash = '#episode-two'
          # Uncomment and update these are videos come out

          when 3 then window.location.hash = '#episode-three'
          # when 4 then window.location.hash = '#episode-four'

        @scheduleUpdate()
      # .catch (e)->
      #   console.log 'Submit Failed', e

  init: ->
    super arguments...
    @submitted = !!(akasha.get 'submitted')

    @on 'mount', =>
      $(@root).addClass 'ready'

      if @submitted
        @setupRedirects()

      if window.location.hash == '#episode-one' && !@submitted
        window.location.hash = '#optincta'

      if window.location.hash == '#episode-two' && !@submitted
        window.location.hash = '#optinctb'

      requestAnimationFrame =>
        if window.location.hash == '#optincta'
          $(@root).find('.main-optin input[name="email"]').focus()

      window.addEventListener 'hashchange', =>
        requestAnimationFrame =>
          if window.location.hash == '#optincta'
            $(@root).find('.main-optin input[name="email"]').focus()

      $(@root).find('input[name="email"]').on 'keypress', (e) =>
        @submit() if e.keyCode is 13

  setupRedirects: ->
    $('.ep1-link').attr 'href', '#episode-one'
    $('.ep2-link').attr 'href', '#episode-two'
    # Uncomment and update these are videos come out

    $('.ep3-link').attr 'href', '#episode-three'
    # $('.ep4-link').attr 'href', '#episode-four'
    $('.btn-trailer-TURNEDOFF').on 'click', ->
      window.location.hash = ''
      requestAnimationFrame ->
        window.location.hash = '#episode-one'
      return false

  showVideo: (n)->
    return () =>
      @videoToShow = n

VideoForm.register()
