-- FUNCTION: CarParkingSchema.exit_vehicle(character varying)

-- DROP FUNCTION IF EXISTS "CarParkingSchema".exit_vehicle(character varying);

CREATE OR REPLACE FUNCTION "CarParkingSchema".exit_vehicle(
	license_no character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    
    var_status character varying(100);
	var_slot_id int;
	
BEGIN

SELECT slot_number INTO var_slot_id
    FROM "CarParkingSchema"."Vehicles"
    WHERE license_plate = license_no
	order by id desc
	limit 1;

select status into var_status 
from "CarParkingSchema".parking_slots
where status = 'Occupied' and slot_id = var_slot_id;
	
IF var_slot_id IS NULL THEN
        RETURN 'Vehicle not present';
    
 ELSif var_status = 'Occupied' THEN
        UPDATE "CarParkingSchema".parking_slots
        SET status = 'Available'
        WHERE slot_id = var_slot_id;
        RETURN 'See you soon!';
		else 
		 RETURN 'Vehicle not present';
		 end if;

		 END;
	
$BODY$;

ALTER FUNCTION "CarParkingSchema".exit_vehicle(character varying)
    OWNER TO postgres;
