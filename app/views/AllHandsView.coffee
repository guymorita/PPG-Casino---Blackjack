class window.AllHandsView extends Backbone.View

  template: _.template ''

  initialize: ->
    # @model.on 'change', @render, @
    debugger
    @render()

  render: ->
    @$('.player-hand-container span ul').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container span ul').html new HandView(collection: @model.get 'dealerHand').el


