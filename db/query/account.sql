-- name: CreateAccounts :one
INSERT INTO accounts (
  owner,
  balance,
  currency
) VALUES (
--- three column, so need three variables
  $1, $2, $3     
) RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts 
WHERE id = $1 LIMIT 1;

-- NAME: ListAccounts: many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- Name: updateAccount: exec
UPDATE accounts SET balance = $2 WHERE id = $1;
