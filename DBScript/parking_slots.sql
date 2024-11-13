-- Table: CarParkingSchema.parking_slots

-- DROP TABLE IF EXISTS "CarParkingSchema".parking_slots;

CREATE TABLE IF NOT EXISTS "CarParkingSchema".parking_slots
(
    slot_id integer NOT NULL,
    slot_number character varying(50) COLLATE pg_catalog."default",
    status character varying(50) COLLATE pg_catalog."default",
    floor_level character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT parking_slots_pkey PRIMARY KEY (slot_id),
    CONSTRAINT parking_slots_slot_number_key UNIQUE (slot_number),
    CONSTRAINT parking_slots_status_check CHECK (status::text = ANY (ARRAY['Available'::character varying::text, 'Occupied'::character varying::text]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "CarParkingSchema".parking_slots
    OWNER to postgres;