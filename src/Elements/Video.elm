module Elements.Video exposing (..)

import Styles.Video as S exposing (Class(..))

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)

---- MODEL ----

type alias Model =
    { nothing: Maybe Int
    , width: Int }

---- MESSAGE ----

type Message
    = ShowMenu Bool
    | WidthChange Int

---- Elements ----
