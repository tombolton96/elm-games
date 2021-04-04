module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, class, classList)
import Random exposing (generate)
import Random.List exposing (shuffle)
import Debug exposing (toString)


-- MODEL
type alias Model =
  { cards : List Card
  , points : Int
  }

type CardValue
  = Ace
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Jack
  | Queen
  | King

type Suit
  = Spades
  | Hearts
  | Diamonds
  | Clubs

type alias Card =
  { value : CardValue
  , suit : Suit
  }

card_list : List Card
card_list = 
  [ { value = Ace, suit = Spades }
  , { value = Two, suit = Spades }
  , { value = Three, suit = Spades }
  , { value = Four, suit = Spades }
  , { value = Five, suit = Spades }
  , { value = Six, suit = Spades }
  , { value = Seven, suit = Spades }
  , { value = Eight, suit = Spades }
  , { value = Nine, suit = Spades }
  , { value = Ten, suit = Spades }
  , { value = Jack, suit = Spades }
  , { value = Queen, suit = Spades }
  , { value = King, suit = Spades }
  , { value = Ace, suit = Hearts }
  , { value = Two, suit = Hearts }
  , { value = Three, suit = Hearts }
  , { value = Four, suit = Hearts }
  , { value = Five, suit = Hearts }
  , { value = Six, suit = Hearts }
  , { value = Seven, suit = Hearts }
  , { value = Eight, suit = Hearts }
  , { value = Nine, suit = Hearts }
  , { value = Ten, suit = Hearts }
  , { value = Jack, suit = Hearts }
  , { value = Queen, suit = Hearts }
  , { value = King, suit = Hearts }
  , { value = Ace, suit = Clubs }
  , { value = Two, suit = Clubs }
  , { value = Three, suit = Clubs }
  , { value = Four, suit = Clubs }
  , { value = Five, suit = Clubs }
  , { value = Six, suit = Clubs }
  , { value = Seven, suit = Clubs }
  , { value = Eight, suit = Clubs }
  , { value = Nine, suit = Clubs }
  , { value = Ten, suit = Clubs }
  , { value = Jack, suit = Clubs }
  , { value = Queen, suit = Clubs }
  , { value = King, suit = Clubs }
  , { value = Ace, suit = Diamonds }
  , { value = Two, suit = Diamonds }
  , { value = Three, suit = Diamonds }
  , { value = Four, suit = Diamonds }
  , { value = Five, suit = Diamonds }
  , { value = Six, suit = Diamonds }
  , { value = Seven, suit = Diamonds }
  , { value = Eight, suit = Diamonds }
  , { value = Nine, suit = Diamonds }
  , { value = Ten, suit = Diamonds }
  , { value = Jack, suit = Diamonds }
  , { value = Queen, suit = Diamonds }
  , { value = King, suit = Diamonds }
  ]

model : Model
model =
  { cards = card_list
  , points = 0
  }


-- UPDATE

type Msg
  = Shuffle
  | ShuffledList (List Card)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg currModel =
  case msg of
    Shuffle ->
      ( currModel, generate ShuffledList (shuffle model.cards) )

    ShuffledList shuffledList ->
      ( { currModel | cards = shuffledList }, Cmd.none )


-- VIEW

view : Model -> Html Msg
view m =
  div []
    [ div [ class "cards" ] ( List.map viewCard m.cards )
    , div [] [ button [ onClick Shuffle ] [ text "Shuffle" ] ]
    ]

viewCard : Card -> Html Msg
viewCard c =
  div [ classList [
          ("card", True),
          ("red", c.suit == Hearts || c.suit == Diamonds )
        ]
      ] [ text (card c) ]

card : Card -> String
card c =
  case c.suit of
    Spades ->
      case c.value of
        Ace -> "🂡"
        Two -> "🂢"
        Three -> "🂣"
        Four -> "🂤" 
        Five -> "🂥"
        Six -> "🂦"
        Seven -> "🂧" 
        Eight -> "🂨"
        Nine -> "🂩"
        Ten -> "🂪"
        Jack -> "🂫"
        Queen -> "🂭"
        King -> "🂮"
    Hearts ->
      case c.value of
        Ace -> "🂱"
        Two -> "🂲"
        Three -> "🂳"
        Four -> "🂴"
        Five -> "🂵"
        Six -> "🂶"
        Seven -> "🂷"
        Eight -> "🂸"
        Nine -> "🂹"
        Ten -> "🂺"
        Jack -> "🂻"
        Queen -> "🂽"
        King -> "🂾"
    Diamonds ->
      case c.value of
        Ace -> "🃁"
        Two -> "🃂"
        Three -> "🃃"
        Four -> "🃄"
        Five -> "🃅"
        Six -> "🃆"
        Seven -> "🃇"
        Eight -> "🃈"
        Nine -> "🃉"
        Ten -> "🃊"
        Jack -> "🃋"
        Queen -> "🃍"
        King -> "🃎"
    Clubs ->
      case c.value of
        Ace -> "🃑"
        Two -> "🃒"
        Three -> "🃓"
        Four -> "🃔"
        Five -> "🃕"
        Six -> "🃖"
        Seven -> "🃗"
        Eight -> "🃘"
        Nine -> "🃙"
        Ten -> "🃚"
        Jack -> "🃛"
        Queen -> "🃝"
        King -> "🃞"


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> (model, Cmd.none)
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
