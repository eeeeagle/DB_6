## Задание

#### Триггеры
1. Создать триггер, заполняющий одно из полей таблицы на основе вводимых
данных (например, поле «Возраст» по вводимым данным поля «Дата
рождения»).
2. Создать два триггера на одно событие: первый осуществляет проверку
целостности добавляемых данных в таблицу, второй запрещает добавление
данных при заданных условиях.
3. Создать триггеры, осуществляющие протоколирование операций INSERT,
UPDATE, DELETE для заданной таблицы. Для этого создать новую таблицу,
содержащую следующие поля: пользователь, операция, время, данные до
выполнения операции, новые данные.

#### Транзакции
4. Написать процедуру, которая добавляет связанные данные в несколько
таблиц. В том случае, если вставка данных в одну из таблиц по какой-либо
причине невозможна, выполняется откат внесенных процедурой изменений.
5. Написать процедуру, которая добавляет в таблицу несколько строк данных.
При каждом добавлении строки выполняется проверка выполнимости
некоторого условия на агрегированных данных одного из столбцов данной
таблицы (например, сумма всех значений по заданному столбцу не
превышает заданного значения). При невыполнении данного условия
выполняется откат добавления такой строки (используя оператор ROLLBACK
TO SAVEPOINT).
6. Продемонстрировать возможность чтения незафиксированных изменений
при использовании уровня изоляции READ UNCOMMITTED и отсутствие
такой возможности при уровне изоляции READ COMMITTED.
7. Продемонстрировать возможность записи в уже прочитанные данные при
использовании уровня изоляции READ COMMITTED и отсутствие такой
возможности при уровне изоляции REPEATABLE READ
