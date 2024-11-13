-- Table: CarParkingSchema.Vehicles

-- DROP TABLE IF EXISTS "CarParkingSchema"."Vehicles";

CREATE TABLE IF NOT EXISTS "CarParkingSchema"."Vehicles"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    license_plate character varying(50) COLLATE pg_catalog."default" NOT NULL,
    owner_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    model character varying(100) COLLATE pg_catalog."default",
    color character varying(50) COLLATE pg_catalog."default",
    slot_number integer,
    contact bigint,
    CONSTRAINT "Vehicles_pkey" PRIMARY KEY (id),
    CONSTRAINT "fk_slotID" FOREIGN KEY (slot_number)
        REFERENCES "CarParkingSchema".parking_slots (slot_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "CarParkingSchema"."Vehicles"
    OWNER to postgres;