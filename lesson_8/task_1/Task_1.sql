ALTER TABLE media
  ADD CONSTRAINT media_types_id_fk
	FOREIGN KEY (media_type_id) REFERENCES media_types(id)
	ON DELETE CASCADE,

ALTER TABLE communities_users 
 ADD CONSTRAINT communities_id_fk
	FOREIGN KEY (community_id) REFERENCES communities(id)
	ON DELETE CASCADE,
 ADD CONSTRAINT user_in_communities_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE friendship 
 ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
    ON DELETE NO ACTION,
ALTER TABLE likes 
 ADD CONSTRAINT target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id)
    ON DELETE NO ACTION

ALTER TABLE posts
  ADD CONSTRAINT post_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT post_communitie_id_fk 
    FOREIGN KEY (communitie_id) REFERENCES communities(id)