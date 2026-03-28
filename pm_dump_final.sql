-- ==========================================
-- ДАМП БАЗЫ ДАННЫХ PROJECT MANAGEMENT
-- Схема: pm
-- Дата создания: 2026-03-27 12:28:59
-- Студент: mgpu_ico_st_09
-- ==========================================

-- ==========================================
-- 1. УДАЛЕНИЕ СТАРОЙ СХЕМЫ (опционально)
-- ==========================================
-- DROP SCHEMA IF EXISTS pm CASCADE;

-- ==========================================
-- 2. СОЗДАНИЕ СХЕМЫ
-- ==========================================
CREATE SCHEMA IF NOT EXISTS pm;

-- ==========================================
-- 3. СОЗДАНИЕ ТАБЛИЦ
-- ==========================================
SET search_path TO pm;

-- Таблица сотрудников
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role VARCHAR(50)
);

-- Таблица проектов
CREATE TABLE IF NOT EXISTS projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20)
);

-- Таблица задач
CREATE TABLE IF NOT EXISTS tasks (
    task_id SERIAL PRIMARY KEY,
    project_id INTEGER REFERENCES projects(project_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    due_date DATE,
    priority INTEGER CHECK (priority >= 1 AND priority <= 3)
);

-- Таблица назначений
CREATE TABLE IF NOT EXISTS assignments (
    assignment_id SERIAL PRIMARY KEY,
    task_id INTEGER REFERENCES tasks(task_id) ON DELETE CASCADE,
    employee_id INTEGER REFERENCES employees(employee_id) ON DELETE CASCADE,
    assigned_date DATE DEFAULT CURRENT_DATE
);

-- ==========================================
-- 4. ВСТАВКА ДАННЫХ
-- ==========================================

-- Очистка таблиц перед вставкой
DELETE FROM assignments;
DELETE FROM tasks;
DELETE FROM projects;
DELETE FROM employees;

-- Сотрудники (5 записей)
INSERT INTO employees (first_name, last_name, email, role) VALUES
('Иван', 'Петров', 'i.petrov@company.com', 'Менеджер проекта'),
('Анна', 'Сидорова', 'a.sidorova@company.com', 'Разработчик'),
('Дмитрий', 'Соколов', 'd.sokolov@company.com', 'Разработчик'),
('Рената', 'Михайлова', 'r.mikhailova@company.com', 'Аналитик'),
('Алексей', 'Федоров', 'a.fedorov@company.com', 'Тестировщик');

-- Проекты (3 записи)
INSERT INTO projects (project_name, start_date, end_date, status) VALUES
('Разработка CRM', '2023-09-01', '2024-03-01', 'В работе'),
('Внедрение BI', '2024-01-15', NULL, 'Планируется'),
('Мобильное приложение', '2023-11-01', '2024-04-01', 'В работе');

-- Задачи (8 записей)
INSERT INTO tasks (project_id, title, due_date, priority) VALUES
(1, 'Проектирование БД', '2023-10-15', 1),
(1, 'Разработка UI', '2023-11-30', 1),
(1, 'Тестирование CRM', '2023-12-15', 2),
(2, 'Сбор требований', '2024-02-10', 2),
(2, 'Настройка серверов', '2024-03-01', 1),
(3, 'Дизайн интерфейса', '2023-12-15', 1),
(3, 'Разработка iOS', '2024-02-01', 1),
(3, 'Тестирование приложения', '2024-03-15', 2);

-- Назначения (8 записей)
INSERT INTO assignments (task_id, employee_id, assigned_date) VALUES
(1, 1, CURRENT_DATE),
(2, 2, CURRENT_DATE),
(3, 5, CURRENT_DATE),
(4, 1, CURRENT_DATE),
(5, 1, CURRENT_DATE),
(6, 4, CURRENT_DATE),
(7, 3, CURRENT_DATE),
(8, 5, CURRENT_DATE);

-- ==========================================
-- 5. ПРОВЕРОЧНЫЕ ЗАПРОСЫ
-- ==========================================

-- Статистика по таблицам
SELECT 'employees' AS table_name, COUNT(*) AS row_count FROM employees
UNION ALL
SELECT 'projects', COUNT(*) FROM projects
UNION ALL
SELECT 'tasks', COUNT(*) FROM tasks
UNION ALL
SELECT 'assignments', COUNT(*) FROM assignments;

-- Все сотрудники
SELECT employee_id, first_name, last_name, email, role FROM employees ORDER BY employee_id;

-- Все проекты
SELECT project_id, project_name, start_date, end_date, status FROM projects ORDER BY project_id;

-- Все задачи с проектами
SELECT t.task_id, t.title, p.project_name, t.due_date, t.priority 
FROM tasks t 
JOIN projects p ON t.project_id = p.project_id 
ORDER BY p.project_name, t.priority;

-- Сотрудники с их задачами
SELECT e.first_name || ' ' || e.last_name AS employee_name, e.role, t.title AS task_name, p.project_name
FROM employees e
JOIN assignments a ON e.employee_id = a.employee_id
JOIN tasks t ON a.task_id = t.task_id
JOIN projects p ON t.project_id = p.project_id
ORDER BY e.last_name, p.project_name;

-- Статистика по проектам
SELECT 
    p.project_name,
    p.status,
    COUNT(DISTINCT t.task_id) AS total_tasks,
    COUNT(DISTINCT a.employee_id) AS assigned_employees
FROM projects p
LEFT JOIN tasks t ON p.project_id = t.project_id
LEFT JOIN assignments a ON t.task_id = a.task_id
GROUP BY p.project_id, p.project_name, p.status
ORDER BY total_tasks DESC;

-- ==========================================
-- КОНЕЦ ДАМПА
-- ==========================================
