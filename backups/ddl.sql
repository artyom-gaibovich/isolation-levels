-- public."transcription" definition

-- Drop table

-- DROP TABLE public."transcription";

CREATE TABLE public."transcription" (
	id text NOT NULL,
	name text NULL,
	code text NULL,
	"created_at" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"order" int4 DEFAULT 0 NULL,
	tags _text NULL,
	"content" jsonb NULL,
	"section" text NULL,
	"transcription_text" text NULL,
	CONSTRAINT "transcription_pkey" PRIMARY KEY (id)
);