with pom as (
    SELECT B.Autor autor, C.Autor wspolautor FROM Autorstwo B
    LEFT JOIN Autorstwo C ON B.Praca = C.Praca WHERE B.Autor != C.Autor
    ORDER BY B.Autor
), sub (autor, liczba) as(
        select autor, 0 from pom where autor = 'Pilipczuk Mi'
        UNION ALL
        select pom.autor, liczba+1 from pom, sub where sub.autor = pom.wspolautor and liczba < 125
) select autor, min(liczba) from sub group by autor;

