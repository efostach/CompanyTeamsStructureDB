/*
Looking up for customers that give minimal profit to each team.
*/

SELECT min_cost_for_teams.team_id, 
       t.name AS team_name, 
       grouped_teams_by_customer.customer_id, 
       c.name AS customer_name, 
       min_cost_for_teams.min_profit
FROM 
    (SELECT MIN(grouped_teams_by_customer.projects_cost) AS min_profit,
            grouped_teams_by_customer.team_id
    FROM
        (SELECT pt.team_id AS team_id,
                SUM(p.cost) AS projects_cost,
                cp.customer_id AS customer_id
        FROM  project_teams pt
            LEFT JOIN projects p
                ON pt.project_id = p.id
            LEFT JOIN customer_projects cp
                ON pt.project_id = cp.project_id
            GROUP BY pt.team_id, cp.customer_id
        ) grouped_teams_by_customer
        GROUP BY grouped_teams_by_customer.team_id
    ) min_cost_for_teams
    INNER JOIN
        (SELECT pt.team_id AS team_id,
                SUM(p.cost) AS projects_cost,
                cp.customer_id AS customer_id
        FROM  project_teams pt
            LEFT JOIN projects p
                ON pt.project_id = p.id
            LEFT JOIN customer_projects cp
                ON pt.project_id = cp.project_id
            GROUP BY pt.team_id, cp.customer_id
        ) grouped_teams_by_customer
        ON min_cost_for_teams.team_id = grouped_teams_by_customer.team_id AND min_cost_for_teams.min_profit = grouped_teams_by_customer.projects_cost
    LEFT JOIN customers c
        ON grouped_teams_by_customer.customer_id = c.id
    LEFT JOIN teams t
        ON grouped_teams_by_customer.team_id = t.id
    ORDER BY min_cost_for_teams.team_id, grouped_teams_by_customer.customer_id;