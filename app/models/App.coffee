#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'stack', new Stack(model: @)
    # @set 'masterSetBet', false
    @newGame()

  newGame: ->
    @set 'deck', deck = new Deck()
    # After a new deck is created, we want to have the player bet. Once they hit the set button, deal them and it goes from there.
    # listen for the set bet event. when it hears it, re-render the appview.
    # don't render the handviews until betSet in stack is true.
    # @get('stack').on 'betIsSet', =>
    #   @set 'masterSetBet', true
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    debugger
    @get('playerHand').on 'playerHit', =>
      if @get('playerHand').scores()[0] > 21
        @endGame()
    @get('playerHand').on 'playerStand', =>
      @endGame()

  endGame: ->
    # debugger
    @get('dealerHand').models[0].flip()
    @get('dealerHand').hit() while @get('dealerHand').scores()[0] < 16
    playerScore = @highestValidHand(@get('playerHand'))
    dealerScore = @highestValidHand(@get('dealerHand'))
    @currentStack = @get('stack').get('chipStack')
    @currentBet = @get('stack').get('curBet')
    if dealerScore > 21 and playerScore < 22
      @youWin()
    else if playerScore > 21
      @youLose()
    else if playerScore > dealerScore
      @youWin()
    else
      @youLose()
    @newGame()

  youLose: ->
    @get('stack').set('chipStack', @currentStack - @currentBet)
    @get('stack').set('curBet', 0)
    @get('stack').set('betSet', false)
    alert "You lose!"

  youWin: ->
    @get('stack').set('chipStack', @currentStack + @currentBet)
    @get('stack').set('curBet', 0)
    @get('stack').set('betSet', false)
    alert "You Win!"

  highestValidHand: (obj) ->
    scoresArray = obj.scores()
    if scoresArray[1] <= 21
      return scoresArray[1]
    else
      return scoresArray[0]