{-# LANGUAGE ScopedTypeVariables #-}
module Lib where

import Test.QuickCheck


newtype StringWithValues = StringWithValues String deriving (Show)

arbitraryChars :: String -> Gen Char
arbitraryChars chars = do
    i <- choose (0, length chars - 1)
    return (chars !! i)

instance Arbitrary StringWithValues where
    arbitrary = StringWithValues <$> (do
        len :: Int <- choose (1, 100)
        let chars = "123ABCabc"
        mapM (const (arbitraryChars chars)) [1..len])


newtype StringWithValues0 = StringWithValues0 String deriving (Show)

instance Arbitrary StringWithValues0 where
    arbitrary = StringWithValues0 <$> (do
        len :: Int <- choose (0, 100)
        let chars = "123ABCabc"
        mapM (const (arbitraryChars chars)) [1..len])

