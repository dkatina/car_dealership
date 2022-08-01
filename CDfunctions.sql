
CREATE OR REPLACE PROCEDURE car_sale1 (
    customer_ INTEGER,
    car_ INTEGER,
    salesman_ INTEGER
)
AS
$MAIN$

DECLARE vSold varchar := (
    SELECT sold
    FROM car
    WHERE id = car_);

BEGIN
    IF vSold IS NULL THEN
        UPDATE car
        SET sold = 'SOLD'
        WHERE id = car_;

        INSERT INTO invoice(customer_id, salesman_id, car_id)
        VALUES (customer_,salesman_,car_);

        COMMIT;
    ELSE
        RAISE NOTICE 'CAR PREVIOUSLY SOLD!';
    END IF;
END;$MAIN$
LANGUAGE plpgsql;

-- CALL car_sale1(1,1,1);
-- CALL car_sale1(2,2,1);
-- CALL car_sale1(5,4,2);
-- CALL car_sale1(1,8,4);



CREATE OR REPLACE PROCEDURE add_inventory(
    _part_id INT,
    _quantity INT
)
AS
$MAIN$
DECLARE run int := 0;

BEGIN
    WHILE run < _quantity LOOP
        INSERT INTO inventory(part_id)
        VALUES (_part_id);
        run := run+1;
    END LOOP;
COMMIT;
END;$MAIN$
LANGUAGE plpgsql;

-- CALL add_inventory(1,5);
-- CALL add_inventory(2,5);
-- CALL add_inventory(3,5);
-- CALL add_inventory(4,5);
-- CALL add_inventory(5,5);
-- CALL add_inventory(6,5);
-- CALL add_inventory(7,5);
-- CALL add_inventory(8,5);



CREATE OR REPLACE PROCEDURE car_service( 
    _ticket_id int,
    _part_id int,
    _part_count int,
    _mechanic_id int
)
AS
$MAIN$

DECLARE 
    have_part int := ( 
    SELECT COUNT(part_id) 
    FROM inventory
    WHERE part_id = _part_id);
    
    run int := 0;
BEGIN
    IF _part_id IS NULL THEN
        INSERT INTO ticket_mechanic (ticket_id, mechanic_id)
        VALUES (_ticket_id, _mechanic_id);
    ELSIF have_part < _part_count THEN
        RAISE NOTICE 'WE DONT HAVE THE PARTS';
    ELSE
        INSERT INTO ticket_mechanic (ticket_id, mechanic_id)
            VALUES (_ticket_id, _mechanic_id);

        WHILE run < _part_count LOOP
            INSERT INTO ticket_part (ticket_id, part_id, mechanic_id)
            VALUES (_ticket_id, _part_id,_mechanic_id);

            DELETE FROM inventory
            WHERE part_id = _part_id AND inventory_id = (
                SELECT MIN(y.inv)
                FROM(
                    SELECT inventory_id as inv 
                    FROM inventory
                    WHERE part_id = _part_id)y);
     
            run := run+1;
        END LOOP;
    END IF;
COMMIT;
END;$MAIN$
LANGUAGE plpgsql;



CREATE OR REPLACE PROCEDURE create_ticket (
    _customer_id int,
    _descrip text,
    _VIN varchar
    )

AS
$MAIN$
BEGIN
    INSERT INTO ticket(customer_id,descrip,VIN) 
    VALUES (_customer_id, _descrip, _VIN);
END;$MAIN$
LANGUAGE plpgsql;

-- CALL create_ticket(3,'Brakes and Rotor replacement','KM8SNDHF9EU064012')

-- SELECT * FROM ticket;

-- SELECT * FROM inventory;

-- CALL car_service(1,7,2,3);

-- SELECT * FROM inventory;

-- CALL create_ticket(4,'Rotors ground','5FNYF28518B024768');

-- CALL car_service(2,NULL,NULL,1);
-- CALL car_service(1,8,2,5);

