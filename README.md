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

<img width="456" height="584" alt="1" src="https://github.com/user-attachments/assets/9bdac398-5ca8-4c64-a318-d0cd4da4d7e8" />

### Задание 2: Создание схемы и таблиц
- Создана схема `pm`
- Созданы таблицы:
  - `employees` — сотрудники
  - `projects` — проекты
  - `tasks` — задачи
  - `assignments` — назначения
- Добавлены внешние ключи и ограничения

<img width="427" height="571" alt="2" src="https://github.com/user-attachments/assets/91e7b22e-ca83-43a6-9915-3a0a247caaac" />


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

<img width="401" height="575" alt="3" src="https://github.com/user-attachments/assets/875ce8ff-24ce-42f4-9436-ee56d676f666" />


### Задание 4: Простые SELECT запросы
Выполнены запросы ко всем таблицам:

**Все сотрудники:**
```sql
SELECT * FROM pm.employees ORDER BY employee_id;
```
**Все проекты:**

```sql
SELECT * FROM pm.projects ORDER BY project_id;
```
**Все задачи:**

```sql
SELECT * FROM pm.tasks ORDER BY task_id;
```
**Все назначения:**

```sql
SELECT * FROM pm.assignments ORDER BY assignment_id;
```

<img width="421" height="566" alt="4" src="https://github.com/user-attachments/assets/4997438a-0f3a-487e-bb6b-8491c54b2f95" />
<img width="362" height="405" alt="5" src="https://github.com/user-attachments/assets/4906668d-b10c-47a5-99b2-3af574a24f98" />


### Задание 5: JOIN запросы
Задачи с названиями проектов:

```sql
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
<img width="442" height="415" alt="6" src="https://github.com/user-attachments/assets/aeae02fc-c94f-48b3-ad24-da5d7e182ac5" />

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

<img width="391" height="558" alt="7" src="https://github.com/user-attachments/assets/96feb803-9b4c-4460-8993-fc281a88a382" />

📁 Экспорт CSV для DataLens
Из Jupyter Notebook были созданы 5 CSV файлов для загрузки в Yandex DataLens:

Файл	Описание	Количество записей
datalens_employees.csv	Список сотрудников	5
datalens_projects.csv	Список проектов	3
datalens_tasks.csv	Задачи с приоритетами	8
datalens_assignments.csv	Назначения сотрудников	8
datalens_dashboard.csv	Сводная статистика	3

<img width="484" height="588" alt="8" src="https://github.com/user-attachments/assets/92f36914-b519-4397-a947-86735db162db" />

ЧАСТЬ 2: ПРОВЕРКА SQL ДАМПА В ЛОКАЛЬНОЙ БАЗЕ ДАННЫХ
Для проверки работоспособности SQL дампа был выполнен импорт и тестирование всех запросов в локально развернутой PostgreSQL (mylocaldb).

📋 Процесс проверки
1. Перенос дампа в текстовый документ
SQL дамп был скопирован в текстовый файл imp.txt для удобного переноса.

<img width="320" height="406" alt="10" src="https://github.com/user-attachments/assets/4181d17a-091a-4ea3-80ad-14989beea9d0" />

2. Перенос файла в виртуальную машину
Файл imp.txt был помещен в общую папку SQL_dumb для доступа из виртуальной машины.

<img width="667" height="699" alt="11" src="https://github.com/user-attachments/assets/7b773661-0321-498e-921b-62a55ae12fe5" />

3. Локальная база данных
Для проверки используется локальная база данных mylocaldb на порту 5433.

<img width="556" height="434" alt="12" src="https://github.com/user-attachments/assets/90136157-9220-404f-8597-5c58c04bbf64" />

4. Монтирование и проверка файлов
В терминале выполнено монтирование общей папки и проверка наличия файла imp.txt:

bash
sudo mount -t vboxfs SQL_dumb /mnt/sql_dumb
ls /mnt/sql_dumb/
cat /mnt/sql_dumb/imp.txt
<img width="566" height="639" alt="13" src="https://github.com/user-attachments/assets/a51f53dc-21a6-4f82-94e0-9abec60ad37a" />

5. Выполнение SQL запросов
Создание схемы:

sql
CREATE SCHEMA IF NOT EXISTS pm;

<img width="528" height="546" alt="14" src="https://github.com/user-attachments/assets/1488dd13-6573-4e99-b30b-7cdd2254415d" />

Создание таблиц:

sql
CREATE TABLE IF NOT EXISTS employees (...);
CREATE TABLE IF NOT EXISTS projects (...);
CREATE TABLE IF NOT EXISTS tasks (...);
CREATE TABLE IF NOT EXISTS assignments (...);

<img width="507" height="376" alt="15" src="https://github.com/user-attachments/assets/17c3d53b-e134-45ca-9468-78ffa4b4a9e6" />

Вставка данных:

sql
INSERT INTO pm.employees VALUES (...);
INSERT INTO pm.projects VALUES (...);
INSERT INTO pm.tasks VALUES (...);
INSERT INTO pm.assignments VALUES (...);

<img width="714" height="575" alt="16" src="https://github.com/user-attachments/assets/7a729c4f-0fe4-4451-8188-61295fcda4d8" />

6. Проверочные запросы
Статистика по таблицам:

sql
SELECT 'employees' AS table_name, COUNT(*) FROM pm.employees
UNION ALL SELECT 'projects', COUNT(*) FROM pm.projects
UNION ALL SELECT 'tasks', COUNT(*) FROM pm.tasks
UNION ALL SELECT 'assignments', COUNT(*) FROM pm.assignments;

<img width="770" height="469" alt="17" src="https://github.com/user-attachments/assets/ee1d80a1-4571-4602-8043-62f3c97e1a9f" />

Все сотрудники:

sql
SELECT * FROM pm.employees ORDER BY employee_id;

<img width="803" height="427" alt="18" src="https://github.com/user-attachments/assets/5db3390a-8417-4484-a3d4-77248e37105c" />

Все проекты:

sql
SELECT * FROM pm.projects ORDER BY project_id;

<img width="756" height="492" alt="19" src="https://github.com/user-attachments/assets/67c670c7-e3cf-4f40-b2d2-f378413294ac" />

Задачи с проектами:

sql
SELECT t.task_id, t.title, p.project_name, t.due_date, t.priority
FROM pm.tasks t
JOIN pm.projects p ON t.project_id = p.project_id
ORDER BY p.project_name, t.priority;

<img width="730" height="487" alt="20" src="https://github.com/user-attachments/assets/16dea53d-7c02-4372-9486-92ab02b5a476" />

Сотрудники с их задачами:

sql
SELECT e.first_name || ' ' || e.last_name AS employee_name, 
       e.role, t.title AS task_name
FROM pm.employees e
JOIN pm.assignments a ON e.employee_id = a.employee_id
JOIN pm.tasks t ON a.task_id = t.task_id
ORDER BY e.last_name;

<img width="689" height="400" alt="21" src="https://github.com/user-attachments/assets/41c6a29d-2f1e-405f-9c7a-08d8ac42aafb" />

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
https://screenshots/13_project_statistics.png

✅ Результаты проверки
Проверка	Результат
Создание схемы	✅ Успешно
Создание таблиц	✅ Успешно (4 таблицы)
Вставка данных	✅ Успешно (24 записи)
SELECT запросы	✅ Успешно
JOIN запросы	✅ Успешно
Статистика	✅ Соответствует ожидаемой
Итог: Все SQL запросы из дампа успешно выполнены в локальной базе данных, структура и данные соответствуют ожидаемым.

ЧАСТЬ 3: ВИЗУАЛИЗАЦИЯ В YANDEX DATALENS
📊 Дашборд в Yandex DataLens
🔗 Ссылка на дашборд
https://datalens.ru/x1sorpl406pyh-project-management-dashboard

📸 Скриншот дашборда
<img width="1220" height="460" alt="9" src="https://github.com/user-attachments/assets/635a1272-86c5-4817-915f-1dfdc82d2526" />

Содержание дашборда
Дашборд включает 4 интерактивные диаграммы:

№	Название	Тип	Что показывает
1	Проекты и задачи	Таблица	Сводная информация по проектам
2	Задачи по приоритетам	Круговая	Распределение задач по важности
3	Задачи по проектам	Столбчатая	Сравнение загрузки проектов
4	Загрузка сотрудников	Горизонтальная	Нагрузка на сотрудников
📈 Данные в дашборде
Проекты и задачи (Таблица)

Проект	Статус	Задач	Высокий приоритет	Сотрудников
Разработка CRM	В работе	3	2	3
Мобильное приложение	В работе	3	2	3
Внедрение BI	Планируется	2	1	1
Задачи по приоритетам (Круговая)

Высокий приоритет: 5 задач (62.5%) - 🔴 критичные

Средний приоритет: 3 задачи (37.5%) - 🟡 важные

Низкий приоритет: 0 задач - 🟢 не срочные

Загрузка сотрудников (Горизонтальная)

Сотрудник	Роль	Количество задач
Иван Петров	Менеджер проекта	3
Рената Михайлова	Аналитик	2
Дмитрий Соколов	Разработчик	2
Алексей Федоров	Тестировщик	2
Анна Сидорова	Разработчик	1
АНАЛИЗ ДАННЫХ
Ключевые выводы
Приоритеты задач: 62.5% задач имеют высокий приоритет (5 из 8 задач)

Загрузка команды: Иван Петров (менеджер проекта) - самый загруженный сотрудник (3 задачи)

Распределение проектов: все проекты имеют равномерную нагрузку (2-3 задачи)

Статус проектов: 2 проекта в работе, 1 планируется

Статус проектов: 2 проекта в работе, 1 планируется

Роли сотрудников: в команде представлены менеджер, разработчики (2), аналитик, тестировщик

