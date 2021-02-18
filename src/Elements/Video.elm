module Elements.Video exposing (..)

import Styles.Video as S exposing (Class(..))

import Html exposing (video, source)
import Html.Attributes exposing (src, autoplay, style, id)

import Element exposing (Element, Attribute, el, html, button)
import Element.Attributes as At
import Element.Events exposing (onClick)

import Svg exposing (Svg, svg, polygon, circle, rect)
import Svg.Attributes as SvgA

---- MODEL ----

type alias Model =
    { width: Int
    , height: Int 
    , playing: Bool
    }

---- MESSAGE ----

type Message
    = ShowMenu Bool         -- Tell the menu to appear
    | SizeChange Int Int    -- The viewport size changed
    | SetPlaying Bool       -- [PORT] Tell the video to play/pause
    | GetPlaying Bool       -- [PORT] The video's play state changed

---- Elements ----

-- An HTML <video> tag embeddable into Style Elements
elVideo : String -> Element S.Class v Message
elVideo url =
    video 
        [ autoplay True 
        , style "width" "auto"
        , style "height" "auto"
        , style "min-width" "100%"
        , style "min-height" "100%"
        , id "video"
        ] 
        [ source [ src url ] []
        -- This workaround is necessary because Cloudflare's IPFS gateway
        -- disallows video streaming :/
        , source [ src <| "https://gateway.ipfs.io/ipns/arrete.chat/" ++ url ] []
        ] |> html

-- A container to add Style Elements attributes to the video
videoFrame : S.Class -> List (Attribute v Message) -> String -> Element S.Class v Message
videoFrame s a url =
    el s a
        (elVideo url)

-- A button to toggle the playing state of the video
playBtn : Bool -> Element S.Class v Message
playBtn state = button PlayBtn
        [ onClick (SetPlaying (not state)) ]
        (if state then pauseS else playS)

---- Shapes ----
playS : Element S.Class v Message
playS = svg [ SvgA.width "100px", SvgA.height "100px" ]
        [ bdCircle
        , polygon
            [ SvgA.points "30,20 80,50 30,80"
            , SvgA.fill "white"
            ] []
        ] |> html

pauseS : Element S.Class v Message
pauseS = svg [ SvgA.width "100px", SvgA.height "100px" ]
        [ bdCircle
        , rect
            [ SvgA.x "30", SvgA.y "30"
            , SvgA.width "15", SvgA.height "40"
            , SvgA.fill "white"
            ] []
        , rect
            [ SvgA.x "55", SvgA.y "30"
            , SvgA.width "15", SvgA.height "40"
            , SvgA.fill "white"
            ] []
        ] |> html

bdCircle : Svg Message
bdCircle = circle
        [ SvgA.cx "50"
        , SvgA.cy "50"
        , SvgA.r "50"
        , SvgA.fill "#000000A0"
        ] []
