# questions-haskell

Haskell questions solved with pure Haskell.

<h1>Feladatok</h1>
<h2>Nagy-kicsi (2 pont)</h2>
<p>Definiáljunk egy függvényt, amely eldönti egy szövegről, hogy abban rendre nagy-, és kisbetűk váltakozva szerepelnek-e!</p>
<p>A szövegnek nagybetűvel kell kezdődnie!</p>
<p><em>Megjegzés:</em> Használhatjuk a <code>Data.Char</code> függvényeit.</p>
<pre><code class="language-hs">upLow :: String -&gt; Bool
</code></pre>
<pre><code class="language-hs">upLow ""
upLow "A"
upLow "AlMa"
upLow "HaSkElL"
not $ upLow "a"
not $ upLow "aLmA"
not $ upLow "fagylalt"
not $ upLow "KIABALAS"
not $ upLow (repeat 'A')
</code></pre>
<h2>Szöveg manipulálás</h2>
<p>Cseréljük ki egy szövegben a paraméterként megadott karaktereket egy másik paraméterként megadott karakterre!</p>
<h3>Véges listával (1 pont)</h3>
<pre><code class="language-hs">replaceGivens :: {- mit -} Char -&gt; {- mire -} Char -&gt; {- miben -} String -&gt; String
</code></pre>
<pre><code class="language-hs">replaceGivens 'a' 'e' "" == ""
replaceGivens 'a' 'e' "alma" == "elme"
replaceGivens 'a' 'a' "alma" == "alma"
replaceGivens 'a' 'e' "nincsbenne" == "nincsbenne"
replaceGivens '?' '!' "???!!!???!!!" == "!!!!!!!!!!!!"
</code></pre>
<h3>Végtelen listával (+1 pont)</h3>
<p><em>Megjegzés:</em> Amennyiben az eredeti függvényünk is megoldja ezt a feladatot, használhatjuk a következő függvénytörzset:</p>
<pre><code class="language-hs">replaceGivensInf = replaceGivens
</code></pre>
<pre><code class="language-hs">replaceGivensInf :: {- mit -} Char -&gt; {- mire -} Char -&gt; {- miben -} String -&gt; String
</code></pre>
<pre><code class="language-hs">take 20 (replaceGivensInf 't' 'b' (cycle "ette")) == "ebbeebbeebbeebbeebbe"
take 20 (replaceGivensInf 'r' 't' (cycle "haskell")) == "haskellhaskellhaskel"
</code></pre>
<h2><code>Maybe</code> csomagolás</h2>
<p>Definiáljuk a <code>packMaybeTuple</code> függvényt, amely egy listányi <code>(Maybe a, Maybe b)</code> rendezett párból egy listányi <code>Maybe (a,b)</code> típusú értékre képez!</p>
<p>Ha a két <code>Maybe</code> értékből az egyik <code>Nothing</code> akkor az eredmény <code>Nothing</code> legyen, egyébként meg <code>Just</code>-ba csomagolva adjuk vissza a rendezett pár elemeit.</p>
<h3>Véges listával (1 pont)</h3>
<pre><code class="language-hs">packMaybeTuple :: [(Maybe a, Maybe b)] -&gt; [Maybe (a,b)]
</code></pre>
<pre><code class="language-hs">packMaybeTuple [] == []
packMaybeTuple [(Just 1, Just "almafa"), (Just 2, Just "banán")] == [Just (1, "almafa"), Just (2, "banán")]
packMaybeTuple [(Nothing, Just 0), (Just 1, Nothing), (Just 0, Just 1)] == [Nothing, Nothing, Just (0,1)]
packMaybeTuple [(Nothing, Just (6 `div` 0)), (Just [1..], Nothing), (Just [], Just 1)] == [Nothing, Nothing, Just ([], 1)]
reverse (packMaybeTuple ([(Just x, Just (x + 1)) | x &lt;- [1..10]] ++ [(Nothing, Nothing)])) ==  Nothing : [Just (x,x+1) | x &lt;- [10,9..1]]
</code></pre>
<h3>Végtelen listával (+1 pont)</h3>
<p><em>Megjegzés:</em> Amennyiben az eredeti függvényünk is megoldja ezt a feladatot, használhatjuk a következő függvénytörzset:</p>
<pre><code class="language-hs">packMaybeTupleInf = packMaybeTuple
</code></pre>
<pre><code class="language-hs">packMaybeTupleInf :: [(Maybe a, Maybe b)] -&gt; [Maybe (a,b)]
</code></pre>
<pre><code class="language-hs">take 5 (packMaybeTupleInf [(Just i, Just 'a') | i &lt;- [0..]]) == [Just (0,'a'), Just (1,'a'), Just (2,'a'), Just (3,'a'), Just (4,'a')]
take 8 (packMaybeTupleInf ([(Just 'a', Just 5), (Just 'b', Nothing)] ++ repeat (Just 't', Just 1))) == [Just ('a',5), Nothing, Just ('t',1), Just ('t',1), Just ('t',1), Just ('t',1), Just ('t',1), Just ('t',1)]
take 6 (packMaybeTupleInf (cycle [(Just 'a',Nothing), (Nothing, Just "alma")])) == [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing]
take 10 (packMaybeTupleInf ([(Just x, Nothing) | x &lt;- [1..]])) == replicate 10 Nothing
</code></pre>
<h2>Usz beszéd (2 pont)</h2>
<p>Definiáljuk azt a függvényt, amely egy paraméterül kapott szöveget <em>usz</em> beszédben ad vissza!
Az <em>usz</em> beszédet úgy kell képezni, hogy a szöveg minden szavát <em>usz</em>-szal egészítjük ki.
A szövegről feltehető, hogy véges!</p>
<pre><code class="language-hs">uszSpeech :: String -&gt; String
</code></pre>
<pre><code class="language-hs">uszSpeech "" == ""
uszSpeech "a" == "ausz"
uszSpeech "Szia hogy vagy" == "Sziausz hogyusz vagyusz"
uszSpeech "Avada Kedvara" == "Avadausz Kedvarausz"
uszSpeech "Expecto Patronum" == "Expectousz Patronumusz"
uszSpeech "Haskell" == "Haskellusz"
</code></pre>
<h2>Páros-páratlan összeadás-kivonás (2 pont)</h2>
<p>Adjuk össze egy számokat tartalmazó lista elemeit úgy, hogy a páratlan indexű elemeket kivonjuk, a páros indexűeket hozzáadjuk az összeghez!</p>
<p>Az indexelést kezdjük <code>0</code>-tól!</p>
<p>A listáról feltehető, hogy véges!</p>
<pre><code class="language-hs">alternatingSum :: Num a =&gt; [a] -&gt; a
</code></pre>
<pre><code class="language-hs">alternatingSum [] == 0
alternatingSum [1] == 1
alternatingSum [1,1] == 0
alternatingSum [1,2,3] == 2
alternatingSum [1..10] == -5
alternatingSum [-10..10] == 0
</code></pre>
<h2>Maybe kompozíció (2 pont)</h2>
<p>Definiáljuk a <code>composeMaybe</code> függvényt amely <code>Maybe</code> eredményű függvényeket komponál össze!</p>
<pre><code class="language-hs">composeMaybe :: (b -&gt; Maybe c) -&gt; (a -&gt; Maybe b) -&gt; (a -&gt; Maybe c)
</code></pre>
<pre><code class="language-hs">composeMaybe (\x -&gt; if x == 0 then Nothing else Just $ div 3 x) (\y -&gt; Just $ y + 1) (-1) == Nothing
composeMaybe (\x -&gt; if x == 0 then Nothing else Just $ div 3 x) (\y -&gt; Just $ y + 1) 0    == Just 3
composeMaybe (\x -&gt; Just $ x + 1) (\y -&gt; if y == 0 then Nothing else Just $ div 4 y) 0    == Nothing
composeMaybe (\x -&gt; Just $ x + 1) (\y -&gt; if y == 0 then Nothing else Just $ div 4 y) 4    == Just 2
</code></pre>
<h2>Címzés (2 pont)</h2>
<p>Haskellben nincs beépített lehetőség arra, hogy az adatokra a memóriabeli tárolási címük alapján hivatkozzunk.</p>
<p>Definiáljuk a típusparaméterrel rendelkező <code>Reference t</code> típust, mely a hivatkozási címmel rendelkező értékeket reprezentálja. A típus rendelkezzen egy <code>Null</code> adatkonstruktorral az üres hivatkozás reprezentálására, valamint rendelkezzen egy <code>Ref</code> adatkonstruktorral is, melynek paraméterei egy az érték hivatkozási címét tároló <code>Int</code> szám, valamint egy <code>t</code> típusú érték.</p>
<p>Gondoskodjunk róla, hogy a <code>Reference t</code> típusú értékek kiírathatóak legyenek, valamint hogy össze lehessen hasonlítani két értéket az <code>==</code> művelet segítségével.</p>
<p>Definiáljuk azt a függvényt, mely két érték hivatkozási cím szerinti egyezőségét vizsgálja. Két érték akkor egyezik meg hivatkozási cím szerint, ha hivatkozási címük megegyezik. Továbbá az üres hivatkozás kizárólag az üres hivatkozással egyezik meg.</p>
<pre><code class="language-hs">refEq :: Reference t -&gt; Reference t -&gt; Bool
</code></pre>
<pre><code class="language-hs">refEq (Ref 0 "alma") (Ref 0 "alma") 
refEq (Ref 0 999) (Ref 0 999) 
refEq (Ref 0 "alma") (Ref 0 "narancs") 
refEq (Ref 110 [1..]) (Ref 110 [0]) 
refEq Null Null 
not $ refEq (Ref 0 "alma") (Ref 1 "alma")
not $ refEq (Ref 0 "alma") (Ref 1 "narancs")
not $ refEq Null (Ref 0 "alma")
not $ refEq (Ref 0 "alma")  Null
</code></pre>
<h2>Feltételes összefűzés (2 pont)</h2>
<p>Definiáljuk az <code>applyWhen</code> függvényt, amely egy függvényt, vagyis "transzformációt", egy predikátumot és két listát kap paraméterül. A két lista elemein párhuzamosan halad és amennyiben a két elemre teljesül a megadott feltétel, úgy ezekre alkalmazza a "transzformációt". Amennyiben nem teljesül a feltétel, úgy ezeket az elemeket hagyja figyelemen kívül.</p>
<p>Az eredménylista hossza maximum, a paraméterül kapott listák hosszainak minimuma.</p>
<pre><code class="language-hs">applyWhen :: (a -&gt; b -&gt; c) -&gt; (a -&gt; b -&gt; Bool) -&gt; [a] -&gt; [b] -&gt; [c]
</code></pre>
<pre><code class="language-hs">applyWhen (,) (&gt;) [1..10] [10,9..1] == [(6,5),(7,4),(8,3),(9,2),(10,1)]
applyWhen (,) (&gt;) [] [1..] == []
applyWhen (,) (&gt;) [1..] [] == []
applyWhen (+) (\a b -&gt; a + b == 5) [0,1,2,3,4,5] [5,4,3,2,1,0] == replicate 6 5
applyWhen (++) (\a b -&gt; null a || null b) [[], "alma", "retek", []] ["mogyoro", [], "afonya", []] == ["mogyoro", "alma", []]
applyWhen (\_ b -&gt; (b, not b)) (flip const) (repeat undefined) (take 100 $ iterate not True) == replicate 50 (True, False)
</code></pre>
<h2>Törlés szövegből (3 pont)</h2>
<p>Definiáljuk azt a függvényt, amely vár két listát paraméterül, és a második listából törli az első listával teljesen megegyező szakaszokat! Ha két egyező szakasz egymásba lóg, akkor az elsőt kell teljes egészében törölni a listából.</p>
<pre><code class="language-hs">deleteInfixes :: Eq a =&gt; [a] -&gt; [a] -&gt; [a]
</code></pre>
<pre><code class="language-hs">deleteInfixes [] [] == []
deleteInfixes "valami" "" == ""
deleteInfixes "" "dandelion" == "dandelion"
deleteInfixes [2] [1,2,2,1,3,2,1] == [1,1,3,1]
deleteInfixes [1,2,3] [1..10] == [4..10]
deleteInfixes "alma" "almalmasajtalma" == "lmasajt"
deleteInfixes "alma" "almaalmasajtalma" == "sajt"
deleteInfixes [True,False] [True,True,False,True,False,False,True] == [True,False,True]
take 10 (deleteInfixes [4,5] [1..]) == [1,2,3,6,7,8,9,10,11,12] 
</code></pre>
<h2>Tevék és kebabok (3 pont)</h2>
<p>Definiáljuk azt a függvényt, ami egy <em>Camel case</em> konvencióban írott szöveget átír <em>Kebab case</em> konvencióra!</p>
<p>Példa <em>Camel case</em> konvencióra: camelCase, bufferedReader, gameOverDialogPanel<br>
Példa <em>Kebab case</em> konvencióra: camel-case, buffered-reader, game-over-dialog-panel</p>
<p>A bemenetről feltehető, hogy véges és <em>Camel case</em> stílusban adott!</p>
<pre><code class="language-hs">camelToKebab :: String -&gt; String
</code></pre>
<pre><code class="language-hs">camelToKebab "camelCase" == "camel-case"
camelToKebab "bufferedReader" == "buffered-reader"
camelToKebab "scoobyDoo" == "scooby-doo"
camelToKebab "bigRedChicken" == "big-red-chicken"
camelToKebab "algebraicDataStructure" == "algebraic-data-structure"
camelToKebab "gameOverDialogPanel" == "game-over-dialog-panel"
</code></pre>
