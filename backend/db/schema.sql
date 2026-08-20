CREATE TABLE users (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    full_name     VARCHAR(150) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    phone         VARCHAR(30),
    photo_url     VARCHAR(MAX),
    login_count   INT NOT NULL DEFAULT 0,
    created_at    DATETIME2 NOT NULL DEFAULT GETDATE()
);