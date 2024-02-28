CREATE TABLE public.publisher (
    id UUID NULL,
    name character varying(128) NULL,
    created_at timestamp NULL,
    updated_at timestamp NULL
);

COMMENT ON SCHEMA public IS 'standard public schema';
