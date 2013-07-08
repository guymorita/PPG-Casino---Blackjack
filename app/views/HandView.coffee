class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '
  <h2>
  <% if(isDealer){ %>Dealer<% }else{ %>You<% } %>
  <% if(isDealer){}else{ %><span class="score"></span><% } %>
    </h2>
    '

  initialize: ->
    @collection.on 'add remove change', =>
      @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').append @collection.scores()[0]
    # @$('.score').append @collection.scores()[1]
