defmodule Cards do
  @moduledoc """
    Provides methods to handling decks of cards
  """

  @doc """
    Returns a list of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a list of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Check if a `card` exists in a list of cards

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "King of Spades")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainer of the deck.
    The `hand_size` indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the deck into a file.
    The `filename` indicates the name of the file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(binary, filename)
  end

  @doc """
    Retrives a deck from a file.
    The `filename` indicates the name of the file.
  """
  def load(filename) do
    { status, binary } = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end

  @doc """
    Creates a playing hand by creating a deck, shuffleing it and spliting it into a hand.
    The `hand_size` indicates how many cards should be in the hand.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
