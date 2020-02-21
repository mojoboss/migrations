
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

-- +goose StatementBegin
CREATE OR REPLACE FUNCTION
users_db.update_user(userid INTEGER, firstName VARCHAR(64), lastName VARCHAR(64), emailId VARCHAR(256),
                    userStatus VARCHAR(64), userPassword VARCHAR(64))
    RETURNS VOID AS $$
BEGIN
    UPDATE users_db.users SET first_name = firstName, last_name = lastName, email = emailId, user_status = userStatus, user_password = userPassword
    WHERE id = userid;
END;
$$
    LANGUAGE plpgsql;
-- +goose StatementEnd

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP FUNCTION users_db.update_user(userid INTEGER, firstName VARCHAR(64), lastName VARCHAR(64), emailId VARCHAR(256),
                    userStatus VARCHAR(64), userPassword VARCHAR(64));