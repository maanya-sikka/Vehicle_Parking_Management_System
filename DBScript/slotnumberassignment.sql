-- FUNCTION: CarParkingSchema.slotnumberassignment(character varying, character varying, character varying, character varying, bigint)

-- DROP FUNCTION IF EXISTS "CarParkingSchema".slotnumberassignment(character varying, character varying, character varying, character varying, bigint);

CREATE OR REPLACE FUNCTION "CarParkingSchema".slotnumberassignment(
	license_plate character varying,
	owner_name character varying,
	model character varying,
	color character varying,
	contact bigint)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Declare assigned_slot_number character varying;
Declare assinged_slot_id int;
BEGIN

Select slot_number into assigned_slot_number  from "CarParkingSchema".parking_slots where status = 'Available' order by slot_id limit 1;
Select slot_id into assinged_slot_id  from "CarParkingSchema".parking_slots where status = 'Available' order by slot_id limit 1;

IF assigned_slot_number IS NULL THEN
        RETURN 'NO SLOTS AVAILABLE';
ELSE
INSERT INTO "CarParkingSchema"."Vehicles" (license_plate, owner_name, model, color, contact, slot_number)
VALUES(license_plate, owner_name, model, color, contact, assinged_slot_id );

-- Update the slot status to 'Occupied'
        UPDATE "CarParkingSchema".parking_slots
        SET status = 'Occupied'
        WHERE slot_number = assigned_slot_number ;

		
    RETURN 'SLOT ASSIGNED AT:' || assigned_slot_number  ;
	END IF;
END;
$BODY$;

ALTER FUNCTION "CarParkingSchema".slotnumberassignment(character varying, character varying, character varying, character varying, bigint)
    OWNER TO postgres;
