WITH pom as (
    SELECT nazwisko, wartosc, 
    ROW_NUMBER() OVER(PARTITION BY nazwisko ORDER BY nazwisko, wartosc DESC) AS row_number
    FROM(
        SELECT Autorstwo.Autor nazwisko, (Prace.Punkty / Prace.Autorzy) wartosc FROM Prace 
        LEFT JOIN Autorstwo ON Autorstwo.Praca = Prace.ID
    )
)
SELECT  nazwisko, sum(wartosc) wynik
FROM pom
WHERE row_number < 5
GROUP BY nazwisko
ORDER BY nazwisko;