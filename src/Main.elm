module Main exposing (main)

import Browser as Browser
import Contents exposing (Contents)
import Contents.Video as C
import Elements.Video as E

main : Program () E.Model E.Message
main = contentElement C.content

contentElement : Contents model msg -> Program () model msg
contentElement co = Browser.document
    { init = co.init
    , view = \m -> { title = "ARRETE", body = [co.view m] }
    , update = co.update
    , subscriptions = co.subs
    }
