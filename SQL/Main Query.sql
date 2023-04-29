

SELECT
g.game_name,
pl.platform_name,
gp.release_year,
pub.publisher_name,
r.region_name,
SUM(rs.num_sales) AS global_sales
FROM region_sales rs
INNER JOIN region r ON rs.region_id = r.id
INNER JOIN game_platform gp ON rs.game_platform_id = gp.id
INNER JOIN game_publisher gpub ON gp.game_publisher_id = gpub.id
INNER JOIN game g ON gpub.game_id = g.id
INNER JOIN platform pl ON gp.platform_id = pl.id
INNER JOIN publisher pub ON gpub.publisher_id = pub.id
GROUP BY g.game_name, pl.platform_name, gp.release_year, pub.publisher_name, r.region_name
ORDER BY SUM(rs.num_sales) DESC;



SELECT

gp.release_year,
r.region_name,
SUM(rs.num_sales) AS global_sales
FROM region_sales rs
INNER JOIN region r ON rs.region_id = r.id
INNER JOIN game_platform gp ON rs.game_platform_id = gp.id
INNER JOIN game_publisher gpub ON gp.game_publisher_id = gpub.id
INNER JOIN game g ON gpub.game_id = g.id
INNER JOIN platform pl ON gp.platform_id = pl.id
INNER JOIN publisher pub ON gpub.publisher_id = pub.id
GROUP BY gp.release_year, r.region_name
ORDER BY SUM(rs.num_sales) DESC;