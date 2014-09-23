> import qualified Data.Heap as H

> data Tree a = Leaf a | Node (a,a) (Tree a) (Tree a)

> type Point = (Double, Double)
> type Sites = [Point]
> type BeachLine = (Tree Point, Double)
> type EventQueue = H.Heap Point

> searchTree :: Point -> Tree Point -> (Point,Point)
> searchTree _ (Leaf x) = (x,x)
> searchTree pt (Node (a,b) l r)
>   | fst pt > fst a && fst pt <= fst b  = (a,b)
>   | fst pt <= fst a                    = searchTree pt l
>   | otherwise                          = searchTree pt r

> search :: Point -> BeachLine -> Point
> search pt (beach, y)
>   | p == q                    = p
>   | fst pt < breakPoint p q y = p
>   | otherwise                 = q
>   where (p,q) = searchTree pt beach

> insertAndSplit :: BeachLine -> Point -> Point -> (BeachLine, Point)
> insertAndSplit (beach,y) p1 p2 = ((newbeach,y),newpoint)
>   where (newbeach,newpoint) = insertAndSplit' beach p1 p2

> insertAndSplit' :: Tree Point -> Point -> Point -> (Tree Point, Point)
> insertAndSplit' (Leaf x) new old   = (Node (old,new) (Leaf old) (Node (new,old) (Leaf new) (Leaf old)),new)
> insertAndSplit' (Node (a,b) l r) new old
>   | fst old <= fst a = (Node (a,b) subbeachL r,new)
>   | otherwise        = insertAndSplit' r new old
>   where (subbeachL,new) = insertAndSplit' l new old

> delete :: BeachLine -> Point -> BeachLine
> delete (Node (p1,p2) (Leaf p1) (Leaf p2) p1 =
> delete (beach,y) pt
>   | fst pt < fst a = Node (a,b) (delete l) r
>   where Node (a,b) l r = beach

> siteEvent :: Point -> BeachLine -> EventQueue -> (BeachLine, EventQueue)
> siteEvent pt beach queue = (beach,queue)

> vertexEvent :: Point -> BeachLine -> EventQueue -> (BeachLine, EventQueue)
> vertexEvent pt beach queue = (beach,queue)

> breakPoint :: Point -> Point -> Double -> Double
> breakPoint (px,py) (qx,qy) y = (qx**2 - px**2 + 2*y*(qy-py) + qy**2 - py**2)/(2*(qx-px))

> circumcentre :: Point -> Point -> Point -> Point
> circumcentre (ax,ay) (bx,by) (cx,cy) = (x,y)
>   where d = 2*(ax*(by-cy) + bx*(cy-ay) + cx*(ay-by))
>         x = ((ax**2+ay**2)*(by-cy) + (bx**2+by**2)*(cy-ay) + (cx**2+cy**2)*(ay-by))/d
>         y = ((ax**2+ay**2)*(cx-bx) + (bx**2+by**2)*(ax-cx) + (cx**2+cy**2)*(bx-ax))/d
