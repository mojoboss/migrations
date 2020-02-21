
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

-- +goose StatementBegin
CREATE TABLE users_db.users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR (64),
    email VARCHAR(256) UNIQUE NOT NULL,
    user_status VARCHAR(64),
    user_password VARCHAR(64),
    date_created TIMESTAMP
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE OR REPLACE FUNCTION users_db.insert_user(
    firstName VARCHAR(64),
    lastName VARCHAR(64),
    userEmail VARCHAR(256),
    userStatus VARCHAR(64),
    userPassword VARCHAR(64)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO users_db.users(first_name, last_name, email, user_status, user_password, date_created)
    VALUES (firstName, lastName, userEmail, userStatus, userPassword, NOW()::timestamp);
END;
$$
LANGUAGE plpgsql;
-- +goose StatementEnd

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP FUNCTION users_db.insert_user(
    firstName VARCHAR(64),
    lastName VARCHAR(64),
    userEmail VARCHAR(256),
    userStatus VARCHAR(64),
    userPassword VARCHAR(64)
);

DROP TABLE users_db.users;