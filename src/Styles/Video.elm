module Styles.Video exposing (..)

import Style exposing (..)
import Style.Color      as Color
import Style.Filter     as Filter
import Style.Font       as Font
import Style.Border     as Border
import Style.Transition as Transition

---- Selectors ----
type Class  = Backdrop
            | Generic
            | PlayBtn Bool

---- Values ----

---- Sections ----
stylesheet : StyleSheet Class variation
stylesheet = styleSheet
    [ style Backdrop
        [
        ]
    , style (PlayBtn False)
        [ Color.background (rgba 0 0 0 0)
        , Transition.all
        ]
    , style (PlayBtn True)
        [ Color.background (rgba 0 0 0 0)
        , Transition.all
        , Filter.opacity 0
        , hover
            [ Filter.opacity 255 ]
        ]
    ]
