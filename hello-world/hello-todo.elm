import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Html as Html

main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }
{-Model-}

type alias Model =
    { todo: String
    , tacos: List String
    }

model =
    { todo = ""
    , tacos = []
    }
{-Update-}
type Msg = UpdateText String

update msg model =
    case msg of
        UpdateText text ->
            { model | todo = text }

        AddItem ->
            { model | tacos = model.todo :: model.tacos }

{-View-}
view model =
    div []
        [ input [ kind "text"
            , onInput UpdateText
            , value model.todo
            ] []
        , button [ onClick AddItem ] [ text "Add Todo" ]
        , div [] [ text model.todo ]
        ]

