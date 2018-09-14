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
      affiliate: akasha.get 'referrer'
      source: window.location.href

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
        window.location.hash = '#optincta'

      if window.location.hash == '#episode-three' && !@submitted
        window.location.hash = '#optincta'

      requestAnimationFrame =>
        if window.location.hash == '#optincta'
          el = $(@root).find('.main-optin input[name="email"]')
          el.focus()
          $('#episodes').scrollIntoView()

      window.addEventListener 'hashchange', =>
        requestAnimationFrame =>
          if window.location.hash == '#optincta'
            el = $(@root).find('.main-optin input[name="email"]')
            el.focus()
            $('#episodes').scrollIntoView()

      $(@root).find('input[name="email"]').on 'keypress', (e) =>
        @submit() if e.keyCode is 13

  setupRedirects: ->
    $('.ep1-link').attr 'href', '#episode-one'
    $('.ep2-link').attr 'href', '#episode-two'
    $('.ep3-link').attr 'href', '#episode-three'

    # Uncomment and update these are videos come out
    # $('.ep4-link').attr 'href', '#episode-four'
    $('.btn-trailer-TURNEDOFF').on 'click', ->
      window.location.hash = ''
      requestAnimationFrame ->
        window.location.hash = '#episode-one'
      return false

  showVideo: (n, collapse)->
    return (e) =>
      @videoToShow = n
      if @submitted && collapse
        @episodeToggle e, n

  episodeToggle: (e, n)->
    ep1 = $('#episode-one')
    ep2 = $('#episode-two')
    ep3 = $('#episode-three')
    # ep4 = $('episode-four')
    ep = null
    switch n
      when 1 then ep = ep1
      when 2 then ep = ep2
      when 3 then ep = ep3
      # when 4 then ep = ep4

    target = $(e.currentTarget)

    ty = $('#thank-you')
    trailer = $('#neuromethodtrailer')
    if ep.css('display') == 'none'
      trailer.css 'display', 'none'
      ty.css 'display', 'none'
      ep1.css 'display', 'none'
      ep2.css 'display', 'none'
      ep3.css 'display', 'none'
      for epi in [ep1, ep2, ep3]
        if ep[0] == epi[0]
          continue
        iframe = epi.find 'iframe'
        src = iframe.attr 'src'
        iframe.attr 'src', ''
        iframe.attr 'src', src

      iframe = trailer.find 'iframe'
      src = iframe.attr 'src'
      iframe.attr 'src', ''
      iframe.attr 'src', src

      # ep4.style.display = 'none'
      ep.css 'display', 'block'
      window.location.hash = target.attr 'href'
      requestAnimationFrame ->
        window.location.hash = target.attr 'href'
        requestAnimationFrame ->
          ep[0].scrollIntoView()
          setTimeout ->
            ep[0].scrollIntoView()
          , 500

    e.preventDefault()
    e.stopPropagation()

  trailerToggle: ->
    trailer = $('#neuromethodtrailer')
    ep1 = $('#episode-one')
    ep2 = $('#episode-two')
    ep3 = $('#episode-three')
    # ep4 = document.getElementById 'episode-four'
    if trailer.css('display') == 'none'
      trailer.css 'display', 'flex'

      ep1.css 'display', 'none'
      ep2.css 'display', 'none'
      ep3.css 'display', 'none'
      # ep4.style.display = 'none'
    window.location.hash = '#neuromethodtrailer'

  closeTrailer: ->
    trailer = $('#neuromethodtrailer')
    iframe = trailer.find('iframe')
    src = iframe.attr 'src'
    iframe.attr 'src', ''
    iframe.attr 'src', src

VideoForm.register()
