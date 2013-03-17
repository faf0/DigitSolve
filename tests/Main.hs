module Tests (runTests) where

import DigitSolve

tests = [
         [(x, isPrime x) | x <- [-1..100]] == [(-1,False),(0,False),(1,False),(2,True),(3,True),(4,False),(5,True),(6,False),(7,True),(8,False),(9,False),(10,False),(11,True),(12,False),(13,True),(14,False),(15,False),(16,False),(17,True),(18,False),(19,True),(20,False),(21,False),(22,False),(23,True),(24,False),(25,False),(26,False),(27,False),(28,False),(29,True),(30,False),(31,True),(32,False),(33,False),(34,False),(35,False),(36,False),(37,True),(38,False),(39,False),(40,False),(41,True),(42,False),(43,True),(44,False),(45,False),(46,False),(47,True),(48,False),(49,False),(50,False),(51,False),(52,False),(53,True),(54,False),(55,False),(56,False),(57,False),(58,False),(59,True),(60,False),(61,True),(62,False),(63,False),(64,False),(65,False),(66,False),(67,True),(68,False),(69,False),(70,False),(71,True),(72,False),(73,True),(74,False),(75,False),(76,False),(77,False),(78,False),(79,True),(80,False),(81,False),(82,False),(83,True),(84,False),(85,False),(86,False),(87,False),(88,False),(89,True),(90,False),(91,False),(92,False),(93,False),(94,False),(95,False),(96,False),(97,True),(98,False),(99,False),(100,False)],
         toDecimalString (eulerApprox 150) 251 == "27182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680",
         firstPrime (toDecimalString (eulerApprox 300) 500) 10 == "7427466391",
         findDigitSum (toDecimalString (eulerApprox 200) 300) 10 49 1 == "7182818284",
         findDigitSum (toDecimalString (eulerApprox 200) 300) 10 49 2 == "8182845904",
         findDigitSum (toDecimalString (eulerApprox 200) 300) 10 49 3 == "8747135266",
         findDigitSum (toDecimalString (eulerApprox 200) 300) 10 49 4 == "7427466391",
         findDigitSum (toDecimalString (eulerApprox 200) 300) 10 49 5 == "5966290435",
         digitSum "12345678901234567890" == 90
        ]

runTests = if (length result) == 0
           then putStr "All tests completed successfully!\n"
           else putStr result
  where result = runTests' tests "" 1

runTests' [] string number     = string
runTests' (x:xs) string number = if x
                                 then runTests' xs string nextNumber
                                 else runTests' xs errorString nextNumber
  where nextNumber  = number + 1
        errorString = string ++ "Test " ++ (show number) ++ " failed!\n"

