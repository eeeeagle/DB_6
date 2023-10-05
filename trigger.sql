/* TASK 1 */
delimiter //
CREATE TRIGGER triger1 BEFORE INSERT ON employee_application
FOR EACH ROW
BEGIN
SET new.application_days = datediff(new.employee_application.date, getdate());
END;//
delimiter ;

INSERT INTO employee_application (application_id, employee_id, vacancy_id, date) 
value (11, 1, 6, "2023-10-05");

DROP TRIGGER triger1;

/* TASK 2 */
delimiter //
CREATE TRIGGER triger2_1 BEFORE INSERT ON employee_application
FOR EACH ROW
BEGIN
IF new.date > curdate() THEN
	SET new.date = curdate();
END IF;
END;//
delimiter ;

delimiter //
CREATE TRIGGER triger2_2 BEFORE INSERT ON employee_application
FOR EACH ROW
BEGIN
IF new.vacancy_id > count(vacancy.vacancy_id) THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "Error: unregistrated vacancy_id";
END IF;
END;//
delimiter ;

DROP TRIGGER triger2_1;
DROP TRIGGER triger2_2;

/* TASK 3 */
delimiter //
CREATE TRIGGER triger3_1 AFTER INSERT ON employee_application
FOR EACH ROW
BEGIN
INSERT INTO employee_application_protocol (user_id, operation_type, operation_time, 
                                           new_application_id, new_employee_id, new_vacancy_id, new_date) 
value(0, 1, current_time(), new.application_id, new.employee_id, new.vacancy_id, new.date);
END;//
delimiter ;

delimiter //
CREATE TRIGGER triger3_2 BEFORE UPDATE ON employee_application
FOR EACH ROW
BEGIN
INSERT INTO employee_application_protocol (user_id, operation_type, operation_time, 
										   old_application_id, old_employee_id, old_vacancy_id, old_date, 
                                           new_application_id, new_employee_id, new_vacancy_id, new_date) 
value(0, 2, current_time(), old.application_id, old.employee_id, old.vacancy_id, old.date, 
							new.application_id, new.employee_id, new.vacancy_id, new.date);
END;//
delimiter ;

delimiter //
CREATE TRIGGER triger3_3 BEFORE DELETE ON employee_application
FOR EACH ROW
BEGIN
INSERT INTO employee_application_protocol (user_id, operation_type, operation_time, 
										   old_application_id, old_employee_id, old_vacancy_id, old_date) 
value(0, 3, current_time(), old.application_id, old.employee_id, old.vacancy_id, old.date);
END;//
delimiter ;


CREATE TABLE employee_application_protocol 
(
	user_id INT,
    operation_type ENUM("INSERT", "UPDATE", "DELETE"),
    operation_time TIME, 
    old_application_id INT,
    old_employee_id INT,
    old_vacancy_id INT,
    old_date DATE,
    new_application_id INT,
    new_employee_id INT,
    new_vacancy_id INT,
    new_date DATE
);

UPDATE employee_application
SET vacancy_id = 6
WHERE application_id = 3;

DROP TRIGGER triger3_1;
DROP TRIGGER triger3_2;
DROP TRIGGER triger3_3;
