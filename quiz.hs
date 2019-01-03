import Data.Array
import Control.Monad  
import Data.Char 

total = 0
count = 4

arr :: [Int] -> Int

arr xs = length xs

sqr :: Int -> Int

sqr x = (x * x)

score :: Int -> Int -> Int

score y c = (y + c) --y = total, c = score to add to total

levelOne :: String -> IO Int
levelOne name =  do 
	putStrLn ("Hey " ++ name ++ ", welcome")  
	putStrLn "What is 9 Squared?"
	num <- getLine
	let b = total
	let n = (read num :: Int)
	if  n == (sqr 9)
		then do 
			let total = b + 1 
			putStrLn "Correct, well done!"
			putStrLn "Score is now: " 
			print (total)
			return (total)
		else do 
			let total = b - 1
			print (sqr 9)
			return (total)

levelTwo :: Int -> IO Int			
levelTwo n = do 
	putStrLn "What is the capital city of Latvia?"  
	putStrLn "a) Riga"
	putStrLn "b) Vilnius"
	putStrLn "c) Jelgava"
	ans <- getLine
	if ans == "a" 
		then do 
			let c = n + 3
			putStrLn "Correct, well done! Your score is now:"
			print c
			return c
		else do
			let c = n - 1
			putStrLn "Incorrect! It's Riga"
			print c
			return c
	-- putStrLn "What is the capital city of Greece?"  
	-- ans <- getLine
	-- if ans == "Athens" 
		-- then do 
			-- putStrLn "Correct, well done!"
			-- let d = c + 1
			-- print total
			-- return d
		-- else do 
			
			-- let d = c - 3
			-- putStrLn "Incorrect! It's Athens"
			-- return d
	
guessing :: Int -> Int -> IO Int
guessing number s = do 
	let c = s
	putStrLn "I'm thinking of a number between 0 and 10"
	putStrLn "Enter your guess:"
	guess <- getLine --get input -> save it as "guess"
	if (read guess) < number 
	then do putStrLn "Too low!" 
		guessing number c --go again
	else if (read guess) > number
		then do putStrLn "Too high!"
			guessing number c
		else do
			let c = s + 5
			putStrLn "You Win!"
			return c
			
main = do
	let score = 0
	putStrLn "Hello, what's your name?"  
	name <- getLine  
	levelOneTotal <- levelOne name
	
	levelTwoTotal <- levelTwo levelOneTotal
	--print (arr [0..5])
	--putStrLn "Give me some input: "
	--l <- getLine
	--putStrLn $ map toUpper l 
	finalScore <- guessing 10 levelTwoTotal --guessing game, where correct number is 10!	
	putStrLn "Your final score is: " 
	print finalScore