class window.Stack extends Backbone.Model

  initialize: ->
    @set 'chipStack', 2000
    @set 'curBet', 0
    @set 'betSet', false
    # @on 'change:betSet', =>
    #   @trigger 'betIsSet', @
    # @get('betSet').on 'change', =>
      # trigger 'betIsSet', @