INSERT INTO `projects` VALUES (1,'BI'),(2,'CRM'),(3,'Inventory'),(4,'Fulfillment'),(5,'Billing'),(6,'ERP');

INSERT INTO `skills` VALUES (1,'Java'),(2,'CSS'),(3,'HTML'),(4,'JavaScript'),(5,'Python'),(6,'Linux'),(7,'MySQL');

INSERT INTO `teams` VALUES (1,'one'),(2,'two'),(3,'three');

INSERT INTO `customers` VALUES (1,'NEC'),(2,'Vodafone'),(3,'Telefonica');

INSERT INTO `employees` VALUES (1,'Ivan','Ivanov',3,0),(2,'Anton','Antonov',2,0),(3,'Victor','Victorov',1,0),(4,'Semen','Semenov',3,0),(5,'Petr','Petrov',1,0);

INSERT INTO `customer_projects` VALUES (2,1),(2,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(1,5),(2,5),(2,6),(3,6);

INSERT INTO `employee_skills` VALUES (2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(5,3),(4,4),(5,4),(1,5),(3,5),(5,5),(3,6),(4,6),(2,7),(4,7);

INSERT INTO `project_teams` VALUES (1,1),(2,1),(5,1),(6,1),(3,2),(4,2),(1,3),(2,3),(4,3);
