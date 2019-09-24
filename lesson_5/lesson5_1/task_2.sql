
UPDATE  users SET created_at = STR_TO_DATE(created_at_varchar,'%d/%m/%Y %h') 
UPDATE  users SET updated_at = STR_TO_DATE(created_at_varchar,'%d/%m/%Y %h')