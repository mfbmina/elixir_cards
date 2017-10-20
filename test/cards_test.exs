defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates 12 cards" do
    length = length(Cards.create_deck)
    assert(length == 12)
  end

  test "shuffle is not equal to create_deck" do
    deck = Cards.create_deck
    refute(Cards.shuffle(deck) == deck)
  end

  test "contains? returns true when deck has a card" do
    deck = Cards.create_deck
    assert(Cards.contains?(deck, "Ace of Spades") == true)
  end

  test "contains? returns false when deck hasn't a card" do
    deck = Cards.create_deck
    assert(Cards.contains?(deck, "King of Spades") == false)
  end

  test "deal returns N cards as hand" do
    deck = Cards.create_deck
    { hand, _deck } = Cards.deal(deck, 5)
    length = length(hand)
    assert(length == 5)
  end

  test "deal returns the rest of cards as deck" do
    deck = Cards.create_deck
    { _hand, deck } = Cards.deal(deck, 5)
    length = length(deck)
    assert(length == 7)
  end

  test "create_hand returns a shuffled hand" do
    { hand, _deck } = Cards.create_hand(3)
    deck = Cards.create_deck
    { new_hand, _deck } = Cards.deal(deck, 3)
    refute(hand == new_hand)
  end
end
