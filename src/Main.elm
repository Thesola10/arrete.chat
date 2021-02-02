module Main exposing (main)

import Browser as Browser
import Html exposing (Html)
import Contents exposing (Contents)
import Contents.Video as C
import Elements.Video as E

main : Program () E.Model E.Message
main = contentElement C.content

contentElement : Contents model msg -> Program () model msg
contentElement co = Browser.element
    { init = co.init
    , view = co.view
    , update = co.update
    , subscriptions = co.subs
    }
