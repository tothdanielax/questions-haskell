import Data.Char
import Data.Maybe

upLow :: String -> Bool
upLow [] = True
upLow [x] = isUpper x
upLow (x:y:xs)
    | isUpper x && isLower y = upLow xs 
    | otherwise = False

replaceGivens :: {- mit -} Char -> {- mire -} Char -> {- miben -} String -> String
replaceGivens what to [] = []
replaceGivens what to (x:xs)
    | x == what = to : replaceGivens what to xs 
    | otherwise = x : replaceGivens what to xs

replaceGivensInf = replaceGivens

packMaybeTuple :: [(Maybe a, Maybe b)] -> [Maybe (a,b)]
packMaybeTuple [] = []
packMaybeTuple ((x,y) : xs)
    | isJust x && isJust y = [Just (fromJust x, fromJust y)] ++ packMaybeTuple xs
    | otherwise = [Nothing] ++ packMaybeTuple xs

packMaybeTupleInf = packMaybeTuple

uszSpeech :: String -> String
uszSpeech [] = []
uszSpeech xs = wordsUsz (words xs)

wordsusz [] = []
wordsUsz [x] = x ++ "usz"
wordsUsz (x:xs) = x ++ "usz " ++ wordsUsz xs

alternatingSum :: Num a => [a] -> a
alternatingSum xs = alternatingSumN xs 0 

alternatingSumN :: Num a => [a] -> Int -> a
alternatingSumN [] n = 0
alternatingSumN [x] n | mod n 2 == 0 = x
alternatingSumN (x:xs) n 
    | mod n 2 == 0 = x + alternatingSumN xs (n+1)
    | otherwise = -x + alternatingSumN xs (n+1)

composeMaybe :: (b -> Maybe c) -> (a -> Maybe b) -> (a -> Maybe c)
composeMaybe f1 f2 x 
    | isJust (f2 x) = f1 (fromJust(f2 x))
    | otherwise = Nothing

data Reference t = Null | Ref Int t deriving (Eq, Show, Ord)

refEq :: Reference t -> Reference t -> Bool
refEq Null Null = True 
refEq (Ref n xs) (Ref n2 ys) = n == n2
refEq _ _ = False

applyWhen :: (a -> b -> c) -> (a -> b -> Bool) -> [a] -> [b] -> [c]
applyWhen f1 f2 [] ys = []
applyWhen f1 f2 xs [] = []
applyWhen f1 f2 (x:xs) (y:ys)
    | f2 x y = f1 x y : applyWhen f1 f2 xs ys
    | otherwise = applyWhen f1 f2 xs ys

deleteInfixes :: Eq a => [a] -> [a] -> [a]
deleteInfixes [] [] = []
deleteInfixes [] ys = ys
deleteInfixes _ [] = []
deleteInfixes xs ys = deleteHelp xs ys xs ys 

deleteHelp _ [] _ ret = ret
deleteHelp [] ys base ret = deleteHelp base ys base ret


deleteHelp (x:xs) (y:ys) base ret 
    | x == y = deleteHelp xs ys base (y:ys)
    | x /= y = deleteHelp base ys base (y:ys)



camelToKebab :: String -> String
camelToKebab [] = []
camelToKebab (x:xs)
    | isUpper x = "-" ++ [toLower x] ++ camelToKebab xs
    | otherwise = x : camelToKebab xs