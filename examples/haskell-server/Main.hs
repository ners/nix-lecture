{-# LANGUAGE OverloadedStrings #-}

import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp

response =
    responseLBS
        status200
        [(hContentType, "text/plain")]
        "Hello Haskell!"

app _ f = f response

main = runSettings defaultSettings app
