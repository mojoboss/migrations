
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

-- +goose StatementBegin
CREATE OR REPLACE FUNCTION users_db.delete_user(userid INTEGER)
    RETURNS VOID AS $$
BEGIN
    DELETE FROM users_db.users WHERE id = userid;
END;
$$
    LANGUAGE plpgsql;
-- +goose StatementEnd

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP FUNCTION users_db.delete_user(userid INTEGER);