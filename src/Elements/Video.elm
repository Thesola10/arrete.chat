module Elements.Video exposing (..)

import Styles.Video as S exposing (Class(..))

import Html exposing (video)
import Html.Attributes exposing (src, autoplay, style)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)

import Style exposing (Style)

---- MODEL ----

type alias Model =
    { width: Int
    , height: Int }

---- MESSAGE ----

type Message
    = ShowMenu Bool
    | SizeChange Int Int

---- Elements ----

elVideo : String -> Element S.Class v Message
elVideo url =
    video 
        [ src url
        , autoplay True 
        , style "width" "auto"
        , style "height" "auto"
        , style "min-width" "100%"
        , style "min-height" "100%"
        ] [ ] |> html

videoFrame : S.Class -> String -> Element S.Class v Message
videoFrame s url =
    el s []
        (elVideo url)
