
solve a = x*y
    where
        (x,y) = f 0 0 0 a
        f aim x y [] = (x,y) 
        f aim x y (Forward a:xs) = f aim (x+a) (y+a*aim) xs
        f aim x y (Up a:xs) = f (aim-a) x y xs
        f aim x y (Down a:xs) = f (aim+a) x y xs


data Input = Up Int | Down Int | Forward Int deriving Show

parse :: String -> [Input]
parse = fmap f . lines
  where
      f ('d':xs) = Down . read . drop 4 $ xs
      f ('u':xs) = Up . read . drop 2 $ xs
      f ('f':xs) = Forward . read . drop 7 $ xs

main = do
    content <- getContents
    print . solve . parse $ content
