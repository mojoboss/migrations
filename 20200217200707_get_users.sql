
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

-- +goose StatementBegin
CREATE TYPE users_db.user_response AS (
    first_name VARCHAR(64),
    last_name VARCHAR (64),
    email VARCHAR(256),
    date_created TIMESTAMP
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE OR REPLACE FUNCTION users_db.get_user(userid INTEGER)
RETURNS users_db.user_response AS $$
DECLARE
    response users_db.user_response;
BEGIN
    SELECT first_name, last_name, email, date_created INTO
    response.first_name, response.last_name, response.email, response.date_created
    FROM users_db.users WHERE id = userid;
    RETURN response;
END;
$$
LANGUAGE plpgsql;
-- +goose StatementEnd


-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP FUNCTION users_db.get_user(userid INTEGER);
DROP TYPE users_db.user_response;