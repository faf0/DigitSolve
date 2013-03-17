module DigitSolve (firstPrime, isPrime, eulerApprox, toDecimalString,
  findDigitSum, digitSum) where

import Data.Ratio
import Data.Char

{-
 Returns the first prime number in the given string which has
 the given number of digits.
 
 @param input the string to parse for prime numbers
 @param digits the number of digits of the prime to find
 -}
firstPrime :: String -> Int -> String
firstPrime input digits
  | (digits < 0) || ((length input) < digits) = ""
  | otherwise = if isPrime num
                then numStr
                else firstPrime nextInput digits
  where
    numStr    = take digits input
    num       = read numStr :: Integer
    nextInput = drop 1 input

{-
 Returns True if the given integer is a prime number.
 Otherwise, returns False.
 
 @param n the integer to check for primality
 -}
isPrime :: (Integral a) => a -> Bool
isPrime n
  | (n < 2)   = False
  | (n == 2)  = True
  | otherwise = isOdd n && isOddPrime n 3 limit
  where
    isOdd x = (mod n 2) == 1
    limit   = floor (sqrt (fromIntegral n))

{-
 Returns True if the given odd integer is a prime number.
 Otherwise, returns false.
 
 @param n the odd integer to test for primality
 @param d the current divisor
 @param l the divisor limit, i.e. the highest divisor to check
 -}
isOddPrime :: (Integral a) => a -> a -> a -> Bool
isOddPrime n d l
  | n < 3     = False
  | n ==3     = True
  | d >= l    = not divides
  | otherwise = not divides && isOddPrime n (d + 2) l
  where
    divides = mod n d == 0

{-
 Approximates the Euler number e using the series:
 e = sum_{n=0}^{\infty} \frac{1}{n!} = 1 + 1/1 + 1/2! + 1/3! + ...
 -}
eulerApprox :: Integer -> Rational
eulerApprox terms
  | terms <= 2 = 2 :: Rational
  | otherwise  = eulerApprox' terms 1 2 (2 :: Rational)

{-
 Approximates the Euler number e using the series described in the
 comment of 'eulerApprox'.
 
 @param terms the number of partial sum summands to consider
 @param denom the current denominator value
 @param n     the resulting approximation
 -}
eulerApprox' :: Integer -> Integer -> Integer -> Rational -> Rational
eulerApprox' terms denom iter n
  | iter >= terms = n
  | otherwise     = eulerApprox' terms denomNext iterNext nNext
  where
    denomNext = denom * iter
    iterNext  = iter + 1
    nNext     = n + (1 % denomNext)

{-
 Converts a rational number into a decimal (base 10) string, thereby
 omitting the decimal point.
 
 @param r the rational number to convert
 @param d if d is positive or 0, d represents the number of fractional part
          digits to include in the result string.
          Otherwise, d denotes the number of least significant whole part
          digits to omit in the result string.
 -}
toDecimalString :: (Integral a) => Rational -> a -> String
toDecimalString r d = toDecimalString' r d ""

{-
 Converts a rational number into a decimal (base 10) string, thereby
 omitting the decimal point.
 
 @param r the rational number to convert
 @param d the number of digits in the resulting string.
          Must be positive.
 @param s the resulting string
 -}
toDecimalString' :: (Integral a) => Rational -> a -> String -> String
toDecimalString' r d s
  | d < 1     = s
  | otherwise = toDecimalString' rNext dNext sNext
  where
    rNext = (r - (toRational truncReal)) * 10
    dNext = d - 1
    sNext = s ++ (show truncReal)
    truncReal = truncate (fromRational r)

{-
 Finds the n'th string in 'input' with length 'digits' whose digit sum is
 equal to 'sumFind'.
 The string 'input' must consist of digits only.
 
 @param input   the string to search-through
 @param digits  the length of the string to find
 @param sumFind the digit sum of the string to find
 @param n       specifies that the n'th string that satisfies the search
                criteria is returned.
                Must be at least one.
 -}
findDigitSum :: String -> Int -> Integer -> Int -> String
findDigitSum input digits sumFind n
  | (digits < 0) || ((length input) < digits) || (sumFind < 0) || (n < 1) = ""
  | otherwise = if sumCurr == sumFind
                then if n == 1
                     then numStr
                     else findDigitSum inputNext digits sumFind (n - 1)
                else findDigitSum inputNext digits sumFind n
  where
    numStr     = take digits input
    sumCurr    = digitSum numStr
    inputNext  = drop 1 input

{-
  Returns the sum of the digits of the given number string.
  
  @param s the string whose digit sum to compute
  -}
digitSum :: String -> Integer
digitSum []     = 0
digitSum (x:xs) = (toInteger (digitToInt x)) + (digitSum xs)

