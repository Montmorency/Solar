{-# LANGUAGE TypeOperators, ConstraintKinds, ScopedTypeVariables, TypeFamilies,
             TypeSynonymInstances, FlexibleInstances, FlexibleContexts,
             DataKinds #-}

module Main where

import Geoposition
import Irradiate
import Data.Metrology
import Data.Metrology.SI.Mono
import Data.Metrology.Show
import Text.Printf


main :: IO ()
main = do
    let x = tintirr 1041.2
        y = panelArea 4.03
        z = calculateEnergyYield x y
    putStrLn $ show x
    putStrLn $ show y
    putStrLn $ show $ multiplyEnergyYieldByPR 0.8598 z
    putStrLn "Hello, World!" 



