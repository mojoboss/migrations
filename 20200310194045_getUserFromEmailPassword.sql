-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied


-- +goose StatementBegin
CREATE OR REPLACE FUNCTION users_db.getUserFromEmailAndPassword(userEmail VARCHAR(64), userPassword VARCHAR(64))
    RETURNS SETOF users_db.user_search_response AS $$
BEGIN
    RETURN QUERY
        SELECT id, first_name, last_name, email, user_status, date_created FROM users_db.users WHERE users.email = userEmail AND users.user_password = userPassword;
END;
$$
    LANGUAGE plpgsql;
-- +goose StatementEnd

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP FUNCTION users_db.getUserFromEmailAndPassword(userStatus VARCHAR(64));