port module Contents.Video exposing (content)

import Contents exposing (Contents)

import Html exposing (Html)
import Browser.Events as Events
import Browser.Dom exposing (getViewport)

import Element exposing (screen, column, modal)
import Element.Attributes exposing (px, clip, width, height, paddingXY)

import Elements.Video as E exposing (Message(..))

import Styles.Video as S

import Task

---- EXPORT ----

content : Contents E.Model E.Message
content =
    { view = view
    , init = init
    , subs = subscriptions
    , update = update
    }

---- VIEW ----

view : E.Model -> Html E.Message
view m =
    column S.Generic []
    [ screen <| E.videoFrame S.Backdrop
        [ clip
        , width  (px <| toFloat m.width)
        , height (px <| toFloat m.height)
        ] "/assets/arrete.webm"
    , modal S.Generic 
        [ paddingXY (toFloat <| m.width // 2 - 50) (toFloat <| m.height // 2 - 50) 
        ] (E.playBtn m.playing)
    ] |> Element.viewport S.stylesheet

---- UPDATES ----

init : () -> (E.Model, Cmd E.Message)
init _ = 
    ({ width = 0, height = 0, playing = False }, firstLoad)

firstLoad : Cmd E.Message
firstLoad = Task.perform 
    (\v -> SizeChange (round v.scene.width) (round v.scene.height)) getViewport

subscriptions : E.Model -> Sub E.Message
subscriptions _ =
    Sub.batch
        [ Events.onResize SizeChange
        , isPlaying GetPlaying
        ]

update : E.Message -> E.Model -> (E.Model, Cmd E.Message)
update msg model = case msg of
    SizeChange i j -> ({model | width = i, height = j}, Cmd.none)
    SetPlaying b -> (model, setPlaying b)
    GetPlaying b -> ({model | playing = b}, Cmd.none)
    _ -> (model, Cmd.none)

---- PORTS ----

port setPlaying : Bool -> Cmd msg

port isPlaying : (Bool -> msg) -> Sub msg
