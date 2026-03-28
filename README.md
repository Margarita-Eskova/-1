# Самостоятельная работа 1
# Project Management Dashboard 📊

## 📌 Описание проекта

Данный проект представляет собой комплексное решение для управления проектами, выполненное в рамках учебного задания. Работа включает:

1. **Работу в Jupyter Notebook (Python + PostgreSQL)** — выполнение 5 заданий по созданию базы данных, наполнению данными и выполнению SQL-запросов
2. **Проверку SQL дампа в локальной базе данных** — импорт и тестирование всех запросов в виртуальной машине
3. **Визуализацию в Yandex DataLens** — создание дашборда с 4 интерактивными диаграммами

**Студент:** mgpu_ico_st_09  
**Дата выполнения:** 2026-03-28

---

## 🗂️ Структура проекта

```
project-management-dashboard/
├── 📄 README.md                          # Описание проекта (данный файл)
├── 📓 Задания_1_5.ipynb                  # Jupyter Notebook с заданиями 1-5
├── 🗄️ pm_dump_final.sql                  # SQL дамп базы данных
├── 📊 datalens_dashboard_link.txt        # Ссылка на дашборд в DataLens
├── 📁 csv_files/                         # CSV файлы для DataLens
│   ├── datalens_employees.csv            # Данные о сотрудниках
│   ├── datalens_projects.csv             # Данные о проектах
│   ├── datalens_tasks.csv                # Данные о задачах
│   ├── datalens_assignments.csv          # Данные о назначениях
│   └── datalens_dashboard.csv            # Сводные данные для дашборда
└── 📁 screenshots/                       # Скриншоты для отчета
    ├── 1_sql_dump_to_txt.png
    ├── 2_transfer_to_vm.png
    ├── 3_local_db.png
    ├── 4_mount_and_check.png
    ├── 5_create_schema.png
    ├── 6_create_tables.png
    ├── 7_insert_data.png
    ├── 8_table_statistics.png
    ├── 9_all_employees.png
    ├── 10_all_projects.png
    ├── 11_tasks_with_projects.png
    ├── 12_employees_with_tasks.png
    ├── 13_project_statistics.png
    ├── 14_jupyter_clean_start.png
    ├── 15_jupyter_create_tables.png
    ├── 16_jupyter_insert_data.png
    ├── 17_jupyter_select.png
    ├── 18_jupyter_join.png
    ├── 19_jupyter_sql_dump.png
    ├── 20_jupyter_csv_export.png
    └── 21_datalens_dashboard.png
```

# ЧАСТЬ 1: РАБОТА В JUPYTER NOTEBOOK (Python + PostgreSQL)

## 📋 Выполненные задания

### Задание 1: Подключение к базе данных
- Установлено соединение с PostgreSQL (хост: 95.131.149.21, порт: 5432)
- Проверена версия сервера
- Реализована обработка ошибок через try-except-finally

![Задание 1](screenshots/14_jupyter_clean_start.png)
<img width="456" height="584" alt="1" src="https://github.com/user-attachments/assets/9bdac398-5ca8-4c64-a318-d0cd4da4d7e8" />

### Задание 2: Создание схемы и таблиц
- Создана схема `pm`
- Созданы таблицы:
  - `employees` — сотрудники
  - `projects` — проекты
  - `tasks` — задачи
  - `assignments` — назначения
- Добавлены внешние ключи и ограничения

![Задание 2](screenshots/15_jupyter_create_tables.png)

### Задание 3: Наполнение данными
В базу данных добавлены:

| Тип данных | Количество |
|------------|------------|
| Сотрудники | 5 |
| Проекты | 3 |
| Задачи | 8 |
| Назначения | 8 |

**Сотрудники:**
| ID | Имя | Фамилия | Email | Роль |
|----|-----|---------|-------|------|
| 1 | Иван | Петров | i.petrov@company.com | Менеджер проекта |
| 2 | Анна | Сидорова | a.sidorova@company.com | Разработчик |
| 3 | Дмитрий | Соколов | d.sokolov@company.com | Разработчик |
| 4 | Рената | Михайлова | r.mikhailova@company.com | Аналитик |
| 5 | Алексей | Федоров | a.fedorov@company.com | Тестировщик |

**Проекты:**
| ID | Название | Дата начала | Дата окончания | Статус |
|----|----------|-------------|----------------|--------|
| 1 | Разработка CRM | 2023-09-01 | 2024-03-01 | В работе |
| 2 | Внедрение BI | 2024-01-15 | NULL | Планируется |
| 3 | Мобильное приложение | 2023-11-01 | 2024-04-01 | В работе |

**Задачи (8 задач):**
| ID | Название | Проект | Срок | Приоритет |
|----|----------|--------|------|-----------|
| 1 | Проектирование БД | Разработка CRM | 2023-10-15 | 1 (Высокий) |
| 2 | Разработка UI | Разработка CRM | 2023-11-30 | 1 (Высокий) |
| 3 | Тестирование CRM | Разработка CRM | 2023-12-15 | 2 (Средний) |
| 4 | Сбор требований | Внедрение BI | 2024-02-10 | 2 (Средний) |
| 5 | Настройка серверов | Внедрение BI | 2024-03-01 | 1 (Высокий) |
| 6 | Дизайн интерфейса | Мобильное приложение | 2023-12-15 | 1 (Высокий) |
| 7 | Разработка iOS | Мобильное приложение | 2024-02-01 | 1 (Высокий) |
| 8 | Тестирование приложения | Мобильное приложение | 2024-03-15 | 2 (Средний) |

**Назначения (8 назначений):**
| ID | Задача | Сотрудник |
|----|--------|-----------|
| 1 | Проектирование БД | Иван Петров |
| 2 | Разработка UI | Анна Сидорова |
| 3 | Тестирование CRM | Алексей Федоров |
| 4 | Сбор требований | Иван Петров |
| 5 | Настройка серверов | Иван Петров |
| 6 | Дизайн интерфейса | Рената Михайлова |
| 7 | Разработка iOS | Дмитрий Соколов |
| 8 | Тестирование приложения | Алексей Федоров |

![Задание 3](screenshots/16_jupyter_insert_data.png)

### Задание 4: Простые SELECT запросы
Выполнены запросы ко всем таблицам:

**Все сотрудники:**
```sql
SELECT * FROM pm.employees ORDER BY employee_id;
```
**Все проекты:**
```
sql
SELECT * FROM pm.projects ORDER BY project_id;
```
**Все задачи:**
```
sql
SELECT * FROM pm.tasks ORDER BY task_id;
```
**Все назначения:**
```
sql
SELECT * FROM pm.assignments ORDER BY assignment_id;
```
screenshots/17_jupyter_select.png

### Задание 5: JOIN запросы
Задачи с названиями проектов:
```
sql
SELECT t.title AS task_name, p.project_name, t.due_date, t.priority
FROM pm.tasks t
JOIN pm.projects p ON t.project_id = p.project_id
ORDER BY p.project_name, t.priority;
task_name	project_name	due_date	priority
Сбор требований	Внедрение BI	2024-02-10	2
Настройка серверов	Внедрение BI	2024-03-01	1
Дизайн интерфейса	Мобильное приложение	2023-12-15	1
Разработка iOS	Мобильное приложение	2024-02-01	1
Тестирование приложения	Мобильное приложение	2024-03-15	2
Проектирование БД	Разработка CRM	2023-10-15	1
Разработка UI	Разработка CRM	2023-11-30	1
Тестирование CRM	Разработка CRM	2023-12-15	2
Сотрудники с их задачами:

sql
SELECT e.first_name || ' ' || e.last_name AS employee, e.role, t.title AS task, p.project_name
FROM pm.employees e
JOIN pm.assignments a ON e.employee_id = a.employee_id
JOIN pm.tasks t ON a.task_id = t.task_id
JOIN pm.projects p ON t.project_id = p.project_id
ORDER BY e.last_name, p.project_name;
employee	role	task	project_name
Рената Михайлова	Аналитик	Дизайн интерфейса	Мобильное приложение
Иван Петров	Менеджер проекта	Проектирование БД	Разработка CRM
Иван Петров	Менеджер проекта	Сбор требований	Внедрение BI
Иван Петров	Менеджер проекта	Настройка серверов	Внедрение BI
Анна Сидорова	Разработчик	Разработка UI	Разработка CRM
Дмитрий Соколов	Разработчик	Разработка iOS	Мобильное приложение
Алексей Федоров	Тестировщик	Тестирование приложения	Мобильное приложение
Алексей Федоров	Тестировщик	Тестирование CRM	Разработка CRM
Статистика по проектам:

sql
SELECT p.project_name, p.status,
       COUNT(DISTINCT t.task_id) AS total_tasks,
       COUNT(DISTINCT a.employee_id) AS assigned_employees
FROM pm.projects p
LEFT JOIN pm.tasks t ON p.project_id = t.project_id
LEFT JOIN pm.assignments a ON t.task_id = a.task_id
GROUP BY p.project_id, p.project_name, p.status
ORDER BY total_tasks DESC;
project_name	status	total_tasks	assigned_employees
Разработка CRM	В работе	3	3
Мобильное приложение	В работе	3	3
Внедрение BI	Планируется	2	1
```
https://screenshots/18_jupyter_join.png

🗄️ Создание SQL дампа
Из Jupyter Notebook был сгенерирован файл pm_dump_final.sql, содержащий:

✅ CREATE SCHEMA pm

✅ CREATE TABLE (4 таблицы)

✅ INSERT данных (24 записи)

✅ Проверочные SELECT запросы

✅ JOIN запросы

Статистика дампа:

Сотрудников: 5

Проектов: 3

Задач: 8

Назначений: 8

screenshots/19_jupyter_sql_dump.png

📁 Экспорт CSV для DataLens
Из Jupyter Notebook были созданы 5 CSV файлов для загрузки в Yandex DataLens:

Файл	Описание	Количество записей
datalens_employees.csv	Список сотрудников	5
datalens_projects.csv	Список проектов	3
datalens_tasks.csv	Задачи с приоритетами	8
datalens_assignments.csv	Назначения сотрудников	8
datalens_dashboard.csv	Сводная статистика	3
screenshots/20_jupyter_csv_export.png



Статус проектов: 2 проекта в работе, 1 планируется

Роли сотрудников: в команде представлены менеджер, разработчики (2), аналитик, тестировщик

