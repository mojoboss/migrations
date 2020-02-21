
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE users_db.users
    ADD COLUMN status VARCHAR(64) NOT NULL,
    ADD COLUMN password VARCHAR(32) NOT NULL
;

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE users_db.users
    DROP COLUMN status,
    DROP COLUMN password
;