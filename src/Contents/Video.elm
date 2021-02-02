module Contents.Video exposing (content)

import Contents exposing (Contents)

import Html exposing (Html)

import Elements.Video as E

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
    el Generic [] (text Generic "Hello")

---- UPDATES ----

init : () -> (E.Model, Cmd E.Message)
init _ = 
    ({ nothing = Nothing }, firstLoad)

firstLoad : Cmd E.Message
firstLoad = Task.perform (\v -> WidthChange <| round v.scene.width) getViewport

subscriptions : E.Model -> Sub E.Message
subscriptions model =
    Events.onResize (\w _ -> WidthChange w)

update : E.Message -> E.Model -> (E.Model, Cmd E.Message)
update msg model = case msg of
    WidthChange i -> ({model | width = i}, Cmd.none)
    _ -> (model, Cmd.none)
