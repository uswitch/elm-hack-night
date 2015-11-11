
import Effects exposing (Never)
import Search
import StartApp
import Task
import String
import Graphics.Element exposing (..)


app =
  StartApp.start
    { init = Search.init
    , update = Search.update
    , view = Search.view
    , inputs = [words]
    }


port tasks : Signal (Task.Task Never ())
port tasks = app.tasks

port words_ : Signal String

words = Signal.map (\x -> if String.contains "go" x
                          then Search.Query
                          else Search.QueryChange x) words_

main = app.html
