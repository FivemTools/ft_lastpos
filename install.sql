ALTER TABLE `players` ADD `posX` FLOAT NOT NULL DEFAULT '0' AFTER `createdAt`, ADD `posY` FLOAT NOT NULL DEFAULT '0' AFTER `posX`, ADD `posZ` FLOAT NOT NULL DEFAULT '0' AFTER `posY`, ADD `heading` FLOAT NOT NULL DEFAULT '0' AFTER `posZ`;
