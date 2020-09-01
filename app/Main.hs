{-# LANGUAGE TypeOperators, ConstraintKinds, ScopedTypeVariables, TypeFamilies,
             TypeSynonymInstances, FlexibleInstances, FlexibleContexts, DataKinds #-}

module Main where

import Geoposition
import Irradiate (Irradiance)

import Data.Dimensions.SI
import Data.Metrology.Poly
import Data.Metrology.SI.Poly ( SI )
import Data.Units.SI
import Data.Units.SI.Prefixes

main :: IO ()
main = do
    calculateEnergyYield poai roofDim
