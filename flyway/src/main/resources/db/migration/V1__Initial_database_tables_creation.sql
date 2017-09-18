DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `pools`;
CREATE TABLE `users` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    pub_key VARCHAR(150) NOT NULL UNIQUE,
    permissions BIGINT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX (pub_key)
);

CREATE TABLE `pools` (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    user_id BIGINT,
    configuration VARCHAR(32) DEFAULT NULL,
    db_backend VARCHAR(32) DEFAULT NULL,
    db_connect VARCHAR(32) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX (user_id, name)
);