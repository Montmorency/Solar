{-# LANGUAGE TypeOperators, ConstraintKinds, ScopedTypeVariables, TypeFamilies,
             TypeSynonymInstances, FlexibleInstances, FlexibleContexts, 
             DataKinds, UndecidableInstances #-}

module Irradiate where
--
--Dimensionally Type Checked Module for standard solar energy calculations.
--
--
--im
import Data.Metrology
import Data.Metrology.SI.Mono
--import Data.Metrology.Show


--Unit Declarations
data Year = Year
instance Unit Year where
  type BaseUnit Year = Second
  conversionRatio _ = 60 * 60 * 24 * 365.242


--https://en.wikipedia.org/wiki/Irradiance
type IrradianceDim = Power :/ Area
type TintIrradianceDim = Energy :/ Area

--type instance DefaultUnitOfDim TintIrradianceDim = Joule :/ (Meter :^ Two)

type Irradiance = MkQu_DLN IrradianceDim DefaultLCSU Double

--instance Show Irradiance where
--    show _ = "W/m2"

--type TintIrradiance = MkQu_DLN TintIrradianceDim DefaultLCSU Double
type TintIrradiance = MkQu_ULN (Joule :/ (Meter :^ Two)) DefaultLCSU Double
type PVSize = MkQu_ULN (Meter :^ Two) DefaultLCSU Double 
type EnergyYield = MkQu_ULN Joule DefaultLCSU Double

panelArea :: Double -> PVSize
panelArea x = x % (Meter :^ sTwo) --

tintirr :: Double -> TintIrradiance
tintirr x = x % (Joule :/ (Meter :^ sTwo))

calculateEnergyYield :: TintIrradiance -> PVSize -> EnergyYield
calculateEnergyYield x y = redim $ x |*| y

multiplyByPR :: Double -> TintIrradiance -> TintIrradiance
multiplyByPR x y  = x *| y

extend :: Length -> Length            -- a function over lengths
extend x = redim $ x |+| (1 % Meter)

