module Main exposing (..)

import Html exposing (Html, div, text, program)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import View exposing (view)
import Update exposing (update)
import Commands exposing (fetchPlayers)
import Navigation exposing (Location)
import Routing


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchPlayers )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
