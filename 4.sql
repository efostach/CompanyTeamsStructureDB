/* 
Looking up for skills that are used in more than 5 projects
*/

SELECT s.id AS skill_id, 
       s.name AS skill_name
FROM 
    (SELECT project_skills.skill, 
            COUNT(project_skills.project) AS count
    FROM 
        (SELECT DISTINCT es.skill_id AS skill,
                pt.project_id AS project
        FROM project_teams pt
				LEFT JOIN employees e
                       ON pt.team_id = e.team_id
				LEFT JOIN employee_skills es
                       ON e.id = es.employee_id
        ) project_skills
        GROUP BY project_skills.skill
    ) counted_projects_for_skill
    LEFT JOIN skills s
        ON  counted_projects_for_skill.skill = s.id
WHERE 
    counted_projects_for_skill.count > 4;