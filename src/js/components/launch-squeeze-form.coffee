import El from 'el.js/src'
import { isRequired, isEmail } from 'shop.js/src/containers/middleware'
import $ from 'zepto-modules/_min'

export class LaunchSqueezeForm extends El.Form
  tag: 'launch-squeeze-form'

  configs:
    'email': [isRequired, isEmail]

  step: 1

  start: ->
    @step = 2
    @scheduleUpdate()

  back: ->
    switch @step
      when 4 then 3

  _submit: ->
    switch @step
      when 2 then @step = 3
      when 3 then @step = 4
    @scheduleUpdate()

  init: ->
    super arguments...
    $(@root).addClass 'ready'

LaunchSqueezeForm.register()
