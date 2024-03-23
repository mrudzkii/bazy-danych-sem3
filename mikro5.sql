WITH
POM1 AS (SELECT h.src p1, count(h.tgt) p2 FROM e h, e i WHERE h.tgt = i.src GROUP BY h.src)
SELECT sum(p2) odp
FROM e e, e f, e g, POM1
WHERE e.src = 0 AND e.tgt = f.src AND f.tgt = g.src AND g.tgt = pom1.p1;
