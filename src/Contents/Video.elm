module Contents.Video exposing (content)

import Contents exposing (Contents)

import Html exposing (Html)
import Browser.Navigation exposing (load)
import Browser.Events as Events
import Browser.Dom exposing (getViewport)

import Element exposing (Element, el, text)
import Element.Attributes exposing (px, clip, width, height)

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
    E.videoFrame S.Backdrop
        [ clip
        , width  (px <| toFloat m.width)
        , height (px <| toFloat m.height)
        ] "/assets/arrete.webm"
        |> Element.viewport S.stylesheet

---- UPDATES ----

init : () -> (E.Model, Cmd E.Message)
init _ = 
    ({ width = 0, height = 0 }, firstLoad)

firstLoad : Cmd E.Message
firstLoad = Task.perform 
    (\v -> SizeChange (round v.scene.width) (round v.scene.height)) getViewport

subscriptions : E.Model -> Sub E.Message
subscriptions model =
    Events.onResize SizeChange

update : E.Message -> E.Model -> (E.Model, Cmd E.Message)
update msg model = case msg of
    SizeChange i j -> ({model | width = i, height = j}, Cmd.none)
    _ -> (model, Cmd.none)
