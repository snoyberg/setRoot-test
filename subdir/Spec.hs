{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
import qualified Data.ByteString as S
import           Data.FileEmbed  (embedFile)
import           Test.Hspec      (hspec, it, shouldBe)

expected :: S.ByteString
expected = "In subdirectory"

main :: IO ()
main = hspec $ do
    it "Template Haskell" $
        $(embedFile "foo.txt") `shouldBe` expected
    it "runtime" $ do
        actual <- S.readFile "foo.txt"
        actual `shouldBe` expected
