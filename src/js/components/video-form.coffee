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
  formId: 'ZJu7xDJJHejlW7'

  _submit: ->
    opts =
      formId: @formId
      email: @data.get 'email'
      affiliate: akasha.get 'referrer'
      source: window.location.href

    @client.form.subscribe opts
      .finally =>
        @submitted = true
        akasha.set '_submitted', true
        @setupRedirects()
        # switch @videoToShow
        #   when 0 then window.location.hash = '#episode-four'
        #   when 1 then window.location.hash = '#episode-one'
        #   when 2 then window.location.hash = '#episode-two'
        #   # Uncomment and update these are videos come out

        #   when 3 then window.location.hash = '#episode-three'
        #   when 4 then window.location.hash = '#episode-four'

        @scheduleUpdate()

        window.location.href = 'https://halcyon.bio/#cmp_4d225e97-d4d9-4ae0-9589-d9e7a86e5005'
      # .catch (e)->
      #   console.log 'Submit Failed', e
      #
    return false

  init: ->
    super arguments...
    @submitted = !!(akasha.get '_submitted')

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

      if window.location.hash == '#episode-four' && !@submitted
        window.location.hash = '#optincta'

      onOptincta = =>
        el = $(@root).find('.main-optin input[name="email"]')
        el.focus()
        $('#')[0].scrollIntoView()

      onEpisode = =>
        trailer = $('#neuromethodtrailer')
        trailer.hide()
        $(window.location.hash)[0].scrollIntoView()
        requestAnimationFrame =>
          $(window.location.hash)[0].scrollIntoView()

      requestAnimationFrame =>
        switch window.location.hash
          when '#optincta' then onOptincta()
          when '#episode-one' then onEpisode()
          when '#episode-two' then onEpisode()
          when '#episode-three' then onEpisode()
          when '#episode-four' then onEpisode()

      window.addEventListener 'hashchange', =>
        requestAnimationFrame =>
          switch window.location.hash
            when '#optincta' then onOptincta()
            when '#episode-one' then onEpisode()
            when '#episode-two' then onEpisode()
            when '#episode-three' then onEpisode()
            when '#episode-four' then onEpisode()

      $(@root).find('input[name="email"]').on 'keypress', (e) =>
        if e.keyCode is 13
          @data.set 'email', $(e.currentTarget).val()
          @submit()

  setupRedirects: ->
    $('.ep1-link').attr 'href', '#episode-one'
    $('.ep2-link').attr 'href', '#episode-two'
    $('.ep3-link').attr 'href', '#episode-three'
    $('.ep4-link').attr 'href', '#episode-four'
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
      return true

  episodeToggle: (e, n)->
    ep1 = $('#episode-one')
    ep2 = $('#episode-two')
    ep3 = $('#episode-three')
    ep4 = $('#episode-four')
    ep = null
    switch n
      when 1 then ep = ep1
      when 2 then ep = ep2
      when 3 then ep = ep3
      when 4 then ep = ep4

    target = $(e.currentTarget)

    ty = $('#thank-you')
    trailer = $('#neuromethodtrailer')
    if ep.css('display') == 'none'
      trailer.css 'display', 'none'
      ty.css 'display', 'none'
      ep1.css 'display', 'none'
      ep2.css 'display', 'none'
      ep3.css 'display', 'none'
      ep4.css 'display', 'none'
      for epi in [ep1, ep2, ep3, ep4]
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

      # ep4.style.display = 'none' < delete?
      ep.css 'display', 'block'
      window.location.hash = target.attr 'href'
      requestAnimationFrame ->
        window.location.hash = target.attr 'href'
        requestAnimationFrame ->
          ep[0].scrollIntoView()
          setTimeout ->
            ep[0].scrollIntoView()
          , 500

    # e.preventDefault()
    # e.stopPropagation()

  trailerToggle: ->
    trailer = $('#neuromethodtrailer')
    ep1 = $('#episode-one')
    ep2 = $('#episode-two')
    ep3 = $('#episode-three')
    ep4 = $('#episode-four')
    if trailer.css('display') == 'none'
      trailer.css 'display', 'flex'

      ep1.css 'display', 'none'
      ep2.css 'display', 'none'
      ep3.css 'display', 'none'
      ep4.css 'display', 'none'
    window.location.hash = '#neuromethodtrailer'

  closeTrailer: ->
    trailer = $('#neuromethodtrailer')
    iframe = trailer.find('iframe')
    src = iframe.attr 'src'
    iframe.attr 'src', ''
    iframe.attr 'src', src

VideoForm.register()
