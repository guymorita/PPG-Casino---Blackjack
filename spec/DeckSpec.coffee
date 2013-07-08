describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      expect(deck.length).toBe 50
      oldLastCard = deck.last()
      hand.hit()
      expect(oldLastCard).toEqual hand.last()
      expect(deck.length).toBe 49
      oldLastCard = deck.last()
      hand.hit()
      expect(oldLastCard).toEqual hand.last()
      expect(deck.length).toBe 48
