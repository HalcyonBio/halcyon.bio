import El from 'el.js/src'
import Promise from 'broken'

export class Verifier extends El.View
  tag: 'verifier'

  html: '<yield/>'

  init: ->
    super arguments...

  verify: (e) ->
    e.stopPropagation()
    e.preventDefault()

    ps = []
    for name, input of @parent.inputs
      pRef = {}
      input.trigger 'validate', pRef
      if pRef.p?
        ps.push pRef.p

    p = Promise.settle(ps).then (results) =>
      for result in results
        if !result.isFulfilled()
          return
      @onVerified results

  onVerified: ->

Verifier.register()
