{-# LANGUAGE TypeOperators, ConstraintKinds, ScopedTypeVariables, TypeFamilies,
             TypeSynonymInstances, FlexibleInstances, FlexibleContexts, DataKinds #-}

module Irradiate where
--
--Dimensionally Type Checked Module for standard solar energy calculations.
--
import Data.Dimensions.SI
import Data.Metrology.Poly
import Data.Metrology.SI.Poly ( SI )
import Data.Units.SI
import Data.Units.SI.Prefixes

--import Tests.Compile.CGS
--Area already defined units-defs/Data/Metrology/SI/PolyTypes.hs 
--type Area = (Meter :* Meter)
--PlaneOA KWH/m2 

type Irradiance = (Watt :* Hour) :/ (Meter :^ Two)
type PVSize = Area
type PerformanceRatio = Double
type EnergyYield = Joule

poai :: MkQu_ULN Irradiance lcsu Double
poai = 1041.2 % Irradiance

roofDim :: MkQu_DLN Area lcsu Double
roofDim  = 4.03 % Area

--data SolarArray = SolarArray { poai :: Irradiance 
--                             , pvsize :: PVSize   
--                             , pr :: PerformanceRatio
--                             }

calculateEnergyYield :: MkQu_ULN Irradiance lcsu Double -> MkQu_DLN Area lcsu Double -> MkQu_DLN Energy lcsu Double
calculateEnergyYield poai pvsize = redim $ poai |*| pvsize

