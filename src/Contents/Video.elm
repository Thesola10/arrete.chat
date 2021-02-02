module Contents.Video exposing (content)

import Contents exposing (Contents)

import Html exposing (Html)
import Browser.Navigation exposing (load)
import Browser.Events as Events
import Browser.Dom exposing (getViewport)

import Element exposing (Element, el, text)

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
    el S.Generic [] (text "Hello")
        |> Element.layout S.stylesheet

---- UPDATES ----

init : () -> (E.Model, Cmd E.Message)
init _ = 
    ({ nothing = Nothing, width = 0 }, firstLoad)

firstLoad : Cmd E.Message
firstLoad = Task.perform (\v -> WidthChange <| round v.scene.width) getViewport

subscriptions : E.Model -> Sub E.Message
subscriptions model =
    Events.onResize (\w _ -> WidthChange w)

update : E.Message -> E.Model -> (E.Model, Cmd E.Message)
update msg model = case msg of
    WidthChange i -> ({model | width = i}, Cmd.none)
    _ -> (model, Cmd.none)
