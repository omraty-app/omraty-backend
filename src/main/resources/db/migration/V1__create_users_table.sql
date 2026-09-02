CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
    id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    phone              VARCHAR(20) NOT NULL UNIQUE,
    password_hash      VARCHAR(255) NOT NULL,
    gender             VARCHAR(10) NOT NULL,
    nni                VARCHAR(50),
    id_photo_url       VARCHAR(255),
    identity_verified  BOOLEAN NOT NULL DEFAULT FALSE,
    created_at         TIMESTAMP NOT NULL DEFAULT now()
);
