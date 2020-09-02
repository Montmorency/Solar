{-# LANGUAGE TypeOperators, ConstraintKinds, ScopedTypeVariables, TypeFamilies,
             TypeSynonymInstances, FlexibleInstances, FlexibleContexts,
             DataKinds #-}

module Main where

import Geoposition
import Irradiate
import Data.Metrology.Show

main :: IO ()
main = do
    let x = tintirr 1041.8
        y = panelArea 4.03
        z = calculateEnergyYield x y
    putStrLn $ show x
    putStrLn $ show y
    putStrLn $ show z
    putStrLn "Hello, World!" 
