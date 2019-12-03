-- CREATE TRIGGER `increment_likes_count` BEFORE UPDATE ON `USER`
--  FOR EACH ROW BEGIN
-- 	IF NEW.liked_posts != OLD.liked_posts THEN
--         SET NEW.likes_count = OLD.likes_count + 1;
--     END IF;
-- END


