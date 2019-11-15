/* 
Looking up for the most profit team.
*/

SELECT *
FROM
    (SELECT t.id AS team_id,
            t.name AS team_name,
            SUM(p.cost) AS total_cost
    FROM teams t
        LEFT JOIN project_teams pt
            ON t.id = pt.team_id
        LEFT JOIN projects p
			ON pt.project_id = p.id
        GROUP BY t.id, t.name
        ORDER BY total_cost DESC
    ) result
LIMIT 1;