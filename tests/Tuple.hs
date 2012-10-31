{-# LANGUAGE NoImplicitPrelude #-}

module Tuple where

import           Language.Fay.FFI
import           Language.Fay.Prelude

main = do
     print (jsTup ("Test", 1))
     printTup (fayTup "[\"Test\", 1]")


print :: String -> Fay ()
print = ffi "console.log(%1)"

printTup :: (String, Double) -> Fay ()
printTup = ffi "console.log(%1)"

jsTup :: (String, Double) -> String
jsTup = ffi "JSON.stringify(%1)"

fayTup :: String -> (String, Double)
fayTup = ffi "JSON.parse(%1)"

fromFay :: (String, Double) -> String
fromFay = ffi "Fay$$fayToJs(%1)"
