DigitSolve
==========

DigitSolve is a Haskell program that aims to solve the two problems
described on:

	http://mkaz.com/math/google-billboard

Problem 1
---------

Employees at Google came up with both problems.
The first problem appeared as a hint to a URL on several
billboards in the U.S.
The billboards read:

	{ the first 10-digit prime in consecutive digits of e }.com

Problem 2
---------

The solution URL enabled the finder to access a web site which
displayed another problem.
This second problem gave evaluations of an undefined function f
at four points and asked for the output of f for another input:

	f(1) =  7182818284
	f(2) =  8182845904
	f(3) =  8747135266
	f(4) =  7427466391
	f(5) =  ???

Note that all given values of f above consist of ten digits.
Moreover, the sum of the digits of all given values of f equal 49.
Furthermore, the given values appear in the Euler number e in the
sequence specified by the input.
Hence f(5) is the 5th 10-digit number in e whose digits sum up to
49.

How To Run
----------

Compile the code with your favorite Haskell compiler or
run the code in your Haskell interpreter of choice.
I prefer using GHCi to run the code.

Use the following calls to get the answers to problem 1 and 2,
respectively:

	firstPrime (toDecimalString (eulerApprox 300) 500) 10
	findDigitSum (toDecimalString (eulerApprox 200) 300) 10 49 5

Purpose
-------

This project provides a simple Haskell solution for both
aforementioned problems.
It demonstrates Haskell's aptitude as a programming language to
tackle such problems.
Since Haskell supports arbitrary precision rational numbers out
of the box and includes other handy features, the code is concise
and self-contained.
I tested the code using GHCi version 7.4.1.
Note that I wrote the code just for fun and did not optimize
it with regard to performance, leaving lots of space for
improvements.
However, on my old desktop computer the code already yields the
answers in a few seconds.

Copyright
---------

Copyright 2013 Fabian Foerg

Licensed under the GPLv3: http://www.gnu.org/licenses/gpl-3.0.html

