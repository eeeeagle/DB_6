SET AUTOCOMMIT=0;

/* TASK 4 */
delimiter //
CREATE PROCEDURE transaction1(IN _vacancy_id INT, IN _vacancy_name VARCHAR(45), IN _sector_id INT, IN _sector_name VARCHAR(45))
BEGIN
	DECLARE EXIT HANDLER FOR sqlexception
    BEGIN
		ROLLBACK;
	END;
	START TRANSACTION;
	INSERT INTO sector (sector_id, name) 
    VALUES (_sector_id, _sector_name);
    INSERT INTO routes (vacancy_id, name, sector_id) 
	VALUES (_vacancy_id, _vacancy_name, _sector_id);
	COMMIT;
END;
//
delimiter ;

CALL transaction1(10, "Коксакер", 11, "Другие работы"); /* incorrect */
CALL transaction1(11, "Коксакер", 11, "Другие работы");

DROP PROCEDURE transaction1;
 
/* TASK 5 */
