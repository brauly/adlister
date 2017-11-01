USE brauly_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE categories;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO categories (classification)

VALUES
('events'),
('for sale'),
('housing'),
('jobs'),
('services')