module Main where

import Test.QuickCheck

import Lib

main :: IO ()
main = quickCheck (\(StringWithValues x) -> length x /= 0)

main2 :: IO ()
main2 = quickCheck (\(StringWithValues0 x) -> length x /= 0)
