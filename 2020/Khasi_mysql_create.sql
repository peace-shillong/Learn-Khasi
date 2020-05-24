CREATE TABLE `khasi_word` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`word` varchar(100) NOT NULL,
	`added_by` INT NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `english_word` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`word` varchar(100) NOT NULL AUTO_INCREMENT,
	`added_by` INT NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `user` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`google_id` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`picture` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`points` INT NOT NULL DEFAULT '0',
	`badge_id` INT NOT NULL DEFAULT '1',
	`level_id` INT NOT NULL DEFAULT '1',
	PRIMARY KEY (`id`)
);

CREATE TABLE `khasi_meaning` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`meaning` varchar(1100) NOT NULL,
	`added_by` INT NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `english_meaning` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`meaning` varchar(1100) NOT NULL,
	`added_by` varchar NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `khasi_sentence` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`sentence` varchar(1100) NOT NULL,
	`added_by` INT NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `english_sentence` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`sentence` varchar(1100) NOT NULL,
	`added_by` INT NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `khasi_english_word` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`khasi_word_id` INT NOT NULL,
	`english_word_id` INT NOT NULL,
	`hindi_word_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `meaning` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`khasi_meaning_id` INT NOT NULL,
	`english_meaning_id` INT NOT NULL,
	`khasi_english_word_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `khasi_wordtype` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`word_id` INT NOT NULL,
	`wordtype_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `word_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `english_wordtype` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`word_id` INT NOT NULL,
	`wordtype_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `word_picture` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`picture` varchar(255) NOT NULL,
	`khasi_english_word_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `khasi_word_gender` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`gender` varchar(255) NOT NULL DEFAULT 'Masculine',
	`khasi_word_id` INT NOT NULL DEFAULT 'Masculine',
	`word` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sentence` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`khasi_sentence_id` INT NOT NULL,
	`english_sentence_id` INT NOT NULL,
	`khasi_english_word_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `pronunciation` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`audio` varchar(255) NOT NULL,
	`khasi_word_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `badge` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(20) NOT NULL DEFAULT 'Speaker',
	PRIMARY KEY (`id`)
);

CREATE TABLE `level` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`point` INT(100) NOT NULL,
	`icon` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_points_log` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`points_gained` INT NOT NULL,
	`gained_on` varchar(100) NOT NULL,
	`user_id` INT NOT NULL,
	`from_table` varchar(255) NOT NULL,
	`from_table_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `hindi_word` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`word` varchar(100) NOT NULL AUTO_INCREMENT,
	`added_by` INT NOT NULL,
	`vote` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `antonyms` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`khasi_word_id` INT NOT NULL,
	`opposite_khasi_word_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `synonyms` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`khasi_word_id` INT NOT NULL,
	`another_khasi_word_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `similar_words` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`khasi_word_id` INT NOT NULL,
	`similar_khasi_word_id` INT NOT NULL,
	`added_by` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `khasi_word` ADD CONSTRAINT `khasi_word_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `english_word` ADD CONSTRAINT `english_word_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `user` ADD CONSTRAINT `user_fk0` FOREIGN KEY (`badge_id`) REFERENCES `badge`(`id`);

ALTER TABLE `user` ADD CONSTRAINT `user_fk1` FOREIGN KEY (`level_id`) REFERENCES `level`(`id`);

ALTER TABLE `khasi_meaning` ADD CONSTRAINT `khasi_meaning_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `english_meaning` ADD CONSTRAINT `english_meaning_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `khasi_sentence` ADD CONSTRAINT `khasi_sentence_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `english_sentence` ADD CONSTRAINT `english_sentence_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `khasi_english_word` ADD CONSTRAINT `khasi_english_word_fk0` FOREIGN KEY (`khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `khasi_english_word` ADD CONSTRAINT `khasi_english_word_fk1` FOREIGN KEY (`english_word_id`) REFERENCES `english_word`(`id`);

ALTER TABLE `khasi_english_word` ADD CONSTRAINT `khasi_english_word_fk2` FOREIGN KEY (`hindi_word_id`) REFERENCES `hindi_word`(`id`);

ALTER TABLE `meaning` ADD CONSTRAINT `meaning_fk0` FOREIGN KEY (`khasi_meaning_id`) REFERENCES `khasi_meaning`(`id`);

ALTER TABLE `meaning` ADD CONSTRAINT `meaning_fk1` FOREIGN KEY (`english_meaning_id`) REFERENCES `english_meaning`(`id`);

ALTER TABLE `meaning` ADD CONSTRAINT `meaning_fk2` FOREIGN KEY (`khasi_english_word_id`) REFERENCES `khasi_english_word`(`id`);

ALTER TABLE `khasi_wordtype` ADD CONSTRAINT `khasi_wordtype_fk0` FOREIGN KEY (`word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `khasi_wordtype` ADD CONSTRAINT `khasi_wordtype_fk1` FOREIGN KEY (`wordtype_id`) REFERENCES `word_type`(`id`);

ALTER TABLE `khasi_wordtype` ADD CONSTRAINT `khasi_wordtype_fk2` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `english_wordtype` ADD CONSTRAINT `english_wordtype_fk0` FOREIGN KEY (`word_id`) REFERENCES `english_word`(`id`);

ALTER TABLE `english_wordtype` ADD CONSTRAINT `english_wordtype_fk1` FOREIGN KEY (`wordtype_id`) REFERENCES `word_type`(`id`);

ALTER TABLE `english_wordtype` ADD CONSTRAINT `english_wordtype_fk2` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `word_picture` ADD CONSTRAINT `word_picture_fk0` FOREIGN KEY (`khasi_english_word_id`) REFERENCES `khasi_english_word`(`id`);

ALTER TABLE `word_picture` ADD CONSTRAINT `word_picture_fk1` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `khasi_word_gender` ADD CONSTRAINT `khasi_word_gender_fk0` FOREIGN KEY (`khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `sentence` ADD CONSTRAINT `sentence_fk0` FOREIGN KEY (`khasi_sentence_id`) REFERENCES `khasi_sentence`(`id`);

ALTER TABLE `sentence` ADD CONSTRAINT `sentence_fk1` FOREIGN KEY (`english_sentence_id`) REFERENCES `english_sentence`(`id`);

ALTER TABLE `sentence` ADD CONSTRAINT `sentence_fk2` FOREIGN KEY (`khasi_english_word_id`) REFERENCES `khasi_english_word`(`id`);

ALTER TABLE `pronunciation` ADD CONSTRAINT `pronunciation_fk0` FOREIGN KEY (`khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `pronunciation` ADD CONSTRAINT `pronunciation_fk1` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `user_points_log` ADD CONSTRAINT `user_points_log_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `hindi_word` ADD CONSTRAINT `hindi_word_fk0` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `antonyms` ADD CONSTRAINT `antonyms_fk0` FOREIGN KEY (`khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `antonyms` ADD CONSTRAINT `antonyms_fk1` FOREIGN KEY (`opposite_khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `antonyms` ADD CONSTRAINT `antonyms_fk2` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `synonyms` ADD CONSTRAINT `synonyms_fk0` FOREIGN KEY (`khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `synonyms` ADD CONSTRAINT `synonyms_fk1` FOREIGN KEY (`another_khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `synonyms` ADD CONSTRAINT `synonyms_fk2` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

ALTER TABLE `similar_words` ADD CONSTRAINT `similar_words_fk0` FOREIGN KEY (`khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `similar_words` ADD CONSTRAINT `similar_words_fk1` FOREIGN KEY (`similar_khasi_word_id`) REFERENCES `khasi_word`(`id`);

ALTER TABLE `similar_words` ADD CONSTRAINT `similar_words_fk2` FOREIGN KEY (`added_by`) REFERENCES `user`(`id`);

