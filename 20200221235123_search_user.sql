
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TYPE users_db.user_search_response AS (
  id INTEGER,
  first_name VARCHAR(64),
  last_name VARCHAR (64),
  email VARCHAR(256),
  user_status VARCHAR(64),
  date_created TIMESTAMP
);

-- +goose StatementBegin
CREATE OR REPLACE FUNCTION users_db.search_user(userStatus VARCHAR(64))
    RETURNS SETOF users_db.user_search_response AS $$
BEGIN
    RETURN QUERY
    SELECT id, first_name, last_name, email, user_status, date_created FROM users_db.users WHERE user_status = userStatus;
END;
$$
    LANGUAGE plpgsql;
-- +goose StatementEnd

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP FUNCTION users_db.search_user(userStatus VARCHAR(64));
DROP TYPE users_db.user_search_response;