import El from 'el.js/src'
import { isRequired, isEmail } from 'shop.js/src/containers/middleware'
import $ from 'zepto-modules/_min'
import akasha from 'akasha'

export class VideoForm extends El.Form
  tag: 'video-form'

  configs:
    'email': [isRequired, isEmail]

  submited:    false
  videoToShow: 0

  _submit: ->
    opts =
      mailinglistId: '94uloYDqfDKlbJ'
      email: @data.get 'email'

    @client.mailinglist.subscribe opts
      .finally =>
        @submited = true
        akasha.set 'submited', true
        @setupRedirects()
        switch @videoToShow
          when 0 then window.location.hash = '#thank-you'
          when 1 then window.location.hash = '#episode-one'

          # Uncomment and update these are videos come out
          # when 2 then window.location.hash = '#episode-two'
          # when 3 then window.location.hash = '#episode-three'
          # when 4 then window.location.hash = '#episode-four'

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
          $(@root).find('.main-optin input[name="email"]').focus()

      window.addEventListener 'hashchange', =>
        requestAnimationFrame =>
          if window.location.hash == '#optincta'
            $(@root).find('.main-optin input[name="email"]').focus()

      $(@root).find('input[name="email"]').on 'keypress', (e) =>
        @submit() if e.keyCode is 13

  setupRedirects: ->
    $('.ep1-link').attr 'href', '#episode-one'

    # Uncomment and update these are videos come out
    # $('.ep2-link').attr 'href', '#episode-two'
    # $('.ep3-link').attr 'href', '#episode-three'
    # $('.ep4-link').attr 'href', '#episode-four'
    $('.btn-trailer').on 'click', ->
      window.location.hash = ''
      requestAnimationFrame ->
        window.location.hash = '#episode-one'
      return false

  showVideo: (n)->
    return () =>
      @videoToShow = n

VideoForm.register()
