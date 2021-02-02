module Contents exposing (Contents)

import Html exposing (Html)

type alias Contents model msg =
    { view : model -> Html msg
    , init : () -> (model, Cmd msg)
    , subs : model -> Sub msg
    , update : msg -> model -> (model, Cmd msg)
    }
