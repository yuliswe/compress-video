{-# LANGUAGE DeriveGeneric #-}

module FFmpeg.Data.H264 where

import FFmpeg.Config
import Data.SL

data H264 = H264 {
        h264In  :: FilePath
      , h264Out :: FilePath
      , h264RV  :: String
      , h264CRF :: String
   } deriving (Generic, Eq, Show)


instance Config H264 where
   config input output = H264 {
           h264In  = input
         , h264Out = output
         , h264RV  = "25"
         , h264CRF = "18"
      }
   makeArgs conf = ["-i", h264In conf, "-codec:v", "libx264", "-crf", h264CRF conf, h264Out conf]


instance SL H264
instance ToJSON H264
instance FromJSON H264
