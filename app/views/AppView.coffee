class window.AppView extends Backbone.View

  template: _.template '
    <section class="padding bck theme features" style="height: 510px;">
      <div class="row text center book">
        <div class="column_10 offset_1">
          <h1 class="color default">Dealer Wins All Ties</h1>
        </div>

      <div class="column_4 radius padding-top padding-bottom on-right">
          <div class="dealer-hand-container"><span class="playingCards"><ul class="table"></ul></span></div>
        </div>
      <div class="column_4 radius padding-top padding-bottom on-left">
        <div class="player-hand-container"><span class="playingCards"><ul class="table"></ul></span></div>
      </div>
      </div>
    </section>

    <section class="padding bck dark">
      <div class="row text center book margin-bottom" id="hit_stand_buttons">
        <div class="column_10 offset_1">
          <h1 class="color theme">Place your bets</h1>
          <div></div>

            </br>
            </br>
          <div class="chip-container"></div>
        </div>
      </div>
    </section>
    '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .double-button": -> @model.get('playerHand').double()

  initialize: ->
    @model.on 'change', @render, @
    # debugger
    @model.get('stack').on 'change:betSet', =>
      @renderCards()
    @render()

  render: ->
    @$el.children().detach()
    @$el.append @template()
    @$('.chip-container').html new ChipView(model: @model.get 'stack').el

  renderCards: ->
    @$('.player-hand-container span ul').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container span ul').html new HandView(collection: @model.get 'dealerHand').el
    @$('#hit_stand_buttons div div').first().html ('<button class="hit-button alert">Hit</button> <button class="stand-button alert">Stand</button> <button class="double-button alert">Double Down</button>')
    debugger
    @$('.chip-container').children().children().first().html ('')


