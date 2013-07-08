describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    expect(collection.length).toBe 52
