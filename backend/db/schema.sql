CREATE TABLE users (
    id            SERIAL PRIMARY KEY,
    full_name     VARCHAR(150) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    phone         VARCHAR(30),
    photo_url     TEXT,
    login_count   INTEGER NOT NULL DEFAULT 0,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE devices(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ,
    public_key TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    revoked BOOLEAN NOT NULL DEFAULT false

);
CREATE TYPE subscription_status AS ENUM ('active', 'expired', 'cancelled');

CREATE TABLE subscriptions (
    id            SERIAL PRIMARY KEY,
    user_id       INTEGER NOT NULL REFERENCES users(id),
    status        subscription_status NOT NULL DEFAULT 'active',
    start_date    DATE NOT NULL DEFAULT now(),
    end_date      DATE NOT NULL
);
CREATE TABLE checkins (
    id            SERIAL PRIMARY KEY,
    user_id       INTEGER NOT NULL REFERENCES users(id),
    checked_in_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE access_logs (
    id            SERIAL PRIMARY KEY,
    user_id       INTEGER REFERENCES users(id),
    device_id     INTEGER REFERENCES devices(id),
    granted       BOOLEAN NOT NULL,
    reason        TEXT,
    attempted_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);