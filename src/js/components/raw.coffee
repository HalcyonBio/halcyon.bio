import El from 'el.js/src'

export class Raw extends El.View
  tag: 'raw'

  rawHtml: ''

  init: ->
    super arguments...

    @root.innerHTML = @rawHtml

Raw.register()

