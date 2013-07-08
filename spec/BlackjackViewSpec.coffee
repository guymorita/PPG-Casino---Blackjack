describe 'AppView', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    dealerHand = deck.dealDealer()
    playerHand = deck.dealPlayer()

  describe 'deal', ->
    it "should give the player two cards", ->
      expect(playerHand.length).toBe 2
    it "should give the dealer two cards", ->
      expect(dealerHand.length).toBe 2
