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
<<<<<<< HEAD
        window.location.hash = 'neuromethodtrailer'
=======
        window.location.hash = '#trailer2424neuro'
>>>>>>> f9643654aa62e3dba0bdac9075d4450f935e94a3

        @scheduleUpdate()
      # .catch (e)->
      #   console.log 'Submit Failed', e

  init: ->
    super arguments...
    $(@root).addClass 'ready'

    @submited = !!(akasha.get 'submited')
    if @submited
      @setupRedirects()

    if window.location.hash == '#trailer2424neuro' && !@submited
      window.location.hash = ''

    requestAnimationFrame ->
      if window.location.hash == '#opt-in'
        $('input[name="email"]').focus()

    window.addEventListener 'hashchange', ->
      requestAnimationFrame ->
        if window.location.hash == '#opt-in'
          $('input[name="email"]').focus()

  setupRedirects: ->
<<<<<<< HEAD
    $('[href="#opt-in"], .btn-trailer').on 'click', ->
      window.location.hash = 'neuromethodtrailer'
=======
    $('[href="#opt-in"]').attr 'href', '#trailer2424neuro'
    $('.btn-trailer').on 'click', ->
      window.location.hash = ''
      requestAnimationFrame ->
        window.location.hash = '#trailer2424neuro'
>>>>>>> f9643654aa62e3dba0bdac9075d4450f935e94a3
      return false

VideoForm.register()
