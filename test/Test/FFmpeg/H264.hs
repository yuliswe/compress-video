module Test.FFmpeg.H264 where

import Test.Hspec (hspec, specify, describe, shouldBe)

import Lib


test :: IO ()
test = hspec $
   describe "save/load" $ do
      let c = setIOFile (defaultCfg :: H264) "测试/test.in" "test/test.mp4"
      specify "save" $
         save "test/tmp/测试.h264" c
      specify "load" $ do
         obj <- load "test/tmp/测试.h264"
         obj `shouldBe` c

