
-- Exploração/ Desenvolvimento -- 

SELECT * FROM hr_employee;

-- Dados gerais sobre pessoas funcionárias -- 
--Realiza a contagem de funcionários por área

SELECT 
  Department as Departamento,
  COUNT(1) as Total_Funcionarios
FROM hr_employee
GROUP BY Departamento
ORDER BY Total_Funcionarios DESC

-- Dados de Atrito (saída de funcionários sem reposição) -- 
-- Taxa de atrito por departamento -- 

SELECT
  Department AS Departamento,
  COUNT(*) AS Total_Funcionarios,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Funcionarios_Atrito,
  CONCAT(ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2), '%') AS Taxa_Atrito
FROM hr_employee  -- Substitua pelo nome real da tabela
GROUP BY Department
ORDER BY Taxa_Atrito DESC;


-- Taxa de atrito de pessoas funcionárias com base em idade

erifica a Taxa de Atrito com base nas Idades

SELECT
  Age as Idade,
  COUNT(*) AS Total_Funcionarios,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Funcionarios_Atrito,
  ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS Taxa_Atrito
FROM hr_employee
GROUP BY Age
ORDER BY Taxa_Atrito DESC;

-- Taxa de atrito de de pessoas funcionárias com base em gênero

--Verifica a Taxa de Atrito com base em Gênero

SELECT
  Gender as Genero,
  COUNT(*) AS Total_Funcionarios,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Funcionarios_Atrito,
  ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS Taxa_Atrito
FROM hr_employee
GROUP BY Genero
ORDER BY Taxa_Atrito DESC;

-- Dados sobre o bem-estar de pessoas colaboradoras
-- Dados sobre a relação entre a Formação a Média de Satisfação

SELECT 
  EducationField as Formacao,
  COUNT(*) AS Total_Funcionarios,
  ROUND(AVG(EnvironmentSatisfaction),2) as Media_Satisfacao_Ambiente
FROM hr_employee
GROUP BY EducationField
ORDER BY Media_Satisfacao_Ambiente DESC;

 -- Relação entre o Departamento e o Equilíbrio Vida-Trabalho de pessoas funcionárias

 SELECT 
  Department as Departamento,
  COUNT(*) AS Total_Funcionarios,
  ROUND(AVG(WorkLifeBalance),2) as Equilibrio_Vida_Trabalho
FROM hr_employee
GROUP BY Department
ORDER BY Equilibrio_Vida_Trabalho DESC;

-- Relação entre Gênero e o Equilíbrio Vida-Trabalho
SELECT 
  Gender as Genero,
  COUNT(*) AS Total_Funcionarios,
  ROUND(AVG(WorkLifeBalance),2) as Equilibrio_Vida_Trabalho
FROM hr_employee
GROUP BY Gender
ORDER BY Equilibrio_Vida_Trabalho DESC;

-- Relação entre a Idade e o Equilíbrio Vida-Trabalho

SELECT 
  Age as Idade,
  COUNT(*) AS Total_Funcionarios,
  ROUND(AVG(WorkLifeBalance),2) as Equilibrio_Vida_Trabalho
FROM hr_employee
GROUP BY Age
ORDER BY Equilibrio_Vida_Trabalho DESC;

-- Horas Extras e Estresse
-- Relação entre o Departamento, Horas Extras e Equilíbrio Vida-Trabalho

SELECT 
  Department as Departamento,
  SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) AS Horas_Extras,
  ROUND(AVG(WorkLifeBalance), 2) as Equilibrio_Vida_Trabalho
FROM hr_employee
GROUP BY Department
ORDER BY Horas_Extras DESC;

-- Dados sobre Satisfação de funcionários
-- Relação entre o Departamento, Horas Extras e Satisfação no Trabalho

SELECT 
  Department AS Departamento,
  SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) AS Horas_Extras,
  ROUND(AVG(JobSatisfaction), 2) AS Satisfacao_Trabalho
FROM hr_employee
GROUP BY Department
ORDER BY Satisfacao_Trabalho DESC;

-- Relação entre a Idade e Satisfação no Trabalho

SELECT 
  Age as Idade,
  COUNT(*) AS Total_Funcionarios,
  ROUND(AVG(JobSatisfaction), 2) AS Satisfacao_Trabalho
FROM hr_employee
GROUP BY Age
ORDER BY Satisfacao_Trabalho DESC;