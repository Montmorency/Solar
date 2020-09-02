{-# LANGUAGE TypeOperators, ConstraintKinds, ScopedTypeVariables, TypeFamilies,
             TypeSynonymInstances, FlexibleInstances, FlexibleContexts, 
             DataKinds, UndecidableInstances #-}

module Irradiate where
--Dimensionally Type Checked Module for standard solar energy calculations.
import Data.Metrology
import Data.Metrology.SI.Mono
--Unit Declarations
data Year = Year
instance Unit Year where
  type BaseUnit Year = Second
  conversionRatio _ = 60 * 60 * 24 * 365.242
--https://en.wikipedia.org/wiki/Irradiance
--
type KJpm2 = Kilo :@ Joule :/ (Meter :^ Two)
type KWpm2 = Kilo :@ Watt :/ (Meter :^ Two)
type IrradianceDim = Power :/ Area
type TintIrradianceDim = Energy :/ Area

--type Irradiance = MkQu_DLN IrradianceDim DefaultLCSU Double
type Irradiance = MkQu_ULN KWpm2 DefaultLCSU Double
type TintIrradiance = MkQu_ULN KJpm2 DefaultLCSU Double
type PVSize = MkQu_ULN (Meter :^ Two) DefaultLCSU Double 
type EnergyYield = MkQu_ULN (Kilo :@ Joule) DefaultLCSU Double

panelArea :: Double -> PVSize
panelArea x = x % (Meter :^ sTwo) 

irrad :: Double -> Irradiance
irrad x = redim $ x % (Watt :/ (Meter :^ sTwo))

tintirr :: Double -> (TintIrradiance)
tintirr x = x % ( Kilo :@ Joule :/ (Meter :^ sTwo))

calculateEnergyYield :: TintIrradiance -> PVSize -> EnergyYield
calculateEnergyYield x y = redim $ x |*| y

multiplyEnergyYieldByPR :: Double -> EnergyYield -> EnergyYield
multiplyEnergyYieldByPR x y  = x *| y
