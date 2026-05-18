-- public."Transcribation" definition

-- Drop table

-- DROP TABLE public."Transcribation";

CREATE TABLE public."Transcribation" (
	id text NOT NULL,
	"fileName" text NULL,
	code text NULL,
	"createdAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"order" int4 DEFAULT 0 NULL,
	tags _text NULL,
	"content" jsonb NULL,
	"section" text NULL,
	"transcriptionText" text NULL,
	CONSTRAINT "Transcribation_pkey" PRIMARY KEY (id)
);