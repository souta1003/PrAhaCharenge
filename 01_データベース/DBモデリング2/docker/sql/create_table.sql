-- create database
create database if not exists slack_test;
use slack_test;

-- create table
drop database if exists user;
CREATE TABLE IF NOT EXISTS user(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	mail_address         VARCHAR(64) NOT NULL,
	display_name         VARCHAR(40) NOT NULL,
	first_name           VARCHAR(20) NOT NULL,
	last_name            VARCHAR(20) NOT NULL,
	created_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key(id)
);

drop database if exists workspace;
CREATE TABLE IF NOT EXISTS workspace(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	workspace_name       VARCHAR(64) NOT NULL,
	created_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key(id)
);

drop database if exists channel;
CREATE TABLE IF NOT EXISTS channel(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	workspace_id         INT UNSIGNED NOT NULL,
	channel_name         VARCHAR(64) NOT NULL,
	created_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key(id),
	CONSTRAINT `fk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

drop database if exists messages;
CREATE TABLE IF NOT EXISTS messages(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	channel_id           INT UNSIGNED NOT NULL,
	user_id              INT UNSIGNED NOT NULL,
	`message`            VARCHAR(64) NOT NULL,
	created_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key(id),
	CONSTRAINT `fk_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

drop database if exists thread;
CREATE TABLE IF NOT EXISTS thread(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	messages_id          INT UNSIGNED NOT NULL,
	user_id              INT UNSIGNED,
	`message`            VARCHAR(64) NOT NULL,
	created_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key(id),
	CONSTRAINT `fk_1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

drop database if exists user_workspace;
CREATE TABLE IF NOT EXISTS user_workspace(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id              INT UNSIGNED NOT NULL,
	workspace_id         INT UNSIGNED NOT NULL,
	primary key(id),
	CONSTRAINT `fk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_2` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

drop database if exists user_channel;
CREATE TABLE IF NOT EXISTS user_workspace(
	id                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id              INT UNSIGNED NOT NULL,
	channel_id           INT UNSIGNED NOT NULL,
	primary key(id),
	CONSTRAINT `fk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_2` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
