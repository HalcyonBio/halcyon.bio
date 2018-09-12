import El from 'el.js/src'

export class Raw extends El.View
  tag: 'raw'

  field: ''

  init: ->
    super arguments...

    @on 'updated', =>
      if @data
        rawHtml = @data.get @field
        @root.innerHTML = rawHtml.replace(/\n/g, '<br/>') if rawHtml

    @on 'mount', =>
      # not sure why this is a thing, need to reevaluate
      if @data
        rawHtml = @data.get @field
        @root.innerHTML = rawHtml.replace(/\n/g, '<br/>') if rawHtml

Raw.register()

