module Styles.Video exposing (..)

import Style exposing (..)
import Style.Color      as Color
import Style.Font       as Font
import Style.Border     as Border
import Style.Transition as Transition

---- Selectors ----
type Class  = Backdrop
            | Generic

---- Values ----

---- Sections ----
stylesheet : StyleSheet Class variation
stylesheet = styleSheet
    [ style Backdrop
        [
        ]
    ]
