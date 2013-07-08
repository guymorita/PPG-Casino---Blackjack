class window.ChipView extends Backbone.View

  className: 'chips'

  #todo: switch to mustache
  template: _.template '
    <div>
    <button class="bet-1">Bet 1</button>
    <button class="bet-5">Bet 5</button>
    <button class="bet-10">Bet 10</button>
    <button class="bet-25">Bet 25</button>
    <button class="bet-50">Bet 50</button>
    <button class="bet-100">Bet 100</button>
    <button class="clear">Clear Bet</button>
    <button class="all-in">All-in</button>
    <button class="set_bet success" style="margin: 0px 0px 0px 20px">Set Bet</button>
    </div>
    </br>
    <div class="stack"><h3><strong>Stack: <strong></h3></div>
    </br>
    <div class="bet"><h3><strong>Bet: </strong></h3></div>'

  events:
    "click .bet-1": ->
      @attemptBet(1)
      @trigger 'bet'
    "click .bet-5": ->
      @attemptBet(5)
      @trigger 'bet'
    "click .bet-10": ->
      @attemptBet(10)
      @trigger 'bet'
    "click .bet-25": ->
      @attemptBet(25)
      @trigger 'bet'
    "click .bet-50": ->
      @attemptBet(50)
      @trigger 'bet'
    "click .bet-100": ->
      @attemptBet(100)
      @trigger 'bet'
    "click .set_bet": ->
      if @currentBet is 0
        alert "You must make a bet sir/maam"
      else
        @model.set('betSet', true)
    "click .clear": ->
      @currentBet = 0
      @trigger 'bet'
    "click .all-in": ->
      @attemptBet(@currentStack)
      @trigger 'bet'
  attemptBet: (amount) ->
    if @currentStack >= @currentBet + amount
      @currentBet += amount
    else
      alert "You don't have enough money"

  initialize: ->
    @currentStack = @model.get('chipStack')
    @currentBet = 0
    @on 'bet', =>
      # debugger
      # console.log(@currentBet)
      # @modBet = @model.get('curBet')
      @model.set('curBet', @currentBet)
      @render()
    # @model.on 'add remove change', =>
    #   @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template
    @$('.stack').append @model.get('chipStack')
    @$('.bet').append @currentBet
    # @$el.append @collection.map (card) ->
    #   new CardView(model: card).$el
    # @$el.html @template @model get('chipStack')
