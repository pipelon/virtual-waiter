/*
SQLyog Community v8.71 
MySQL - 8.0.31 : Database - virtual_waiter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `auth_assignment` */

DROP TABLE IF EXISTS `auth_assignment`;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `auth_assignment` */

insert  into `auth_assignment`(`item_name`,`user_id`,`created_at`) values ('SuperAdministrator','4',1779906539);

/*Table structure for table `auth_item` */

DROP TABLE IF EXISTS `auth_item`;

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `auth_item` */

insert  into `auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values ('/*',2,NULL,NULL,NULL,1779897043,1779897043),('/admin/*',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/assignment/*',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/assignment/assign',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/assignment/index',2,NULL,NULL,NULL,1779897039,1779897039),('/admin/assignment/revoke',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/assignment/view',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/default/*',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/default/index',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/*',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/create',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/delete',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/index',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/update',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/view',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/permission/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/assign',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/create',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/permission/delete',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/get-users',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/index',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/permission/remove',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/update',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/view',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/role/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/assign',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/create',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/delete',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/get-users',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/remove',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/update',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/view',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/assign',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/create',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/refresh',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/remove',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/create',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/delete',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/update',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/view',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/user/*',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/activate',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/change-password',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/delete',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/user/login',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/logout',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/request-password-reset',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/reset-password',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/signup',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/view',2,NULL,NULL,NULL,1779897042,1779897042),('/categories/*',2,NULL,NULL,NULL,1779909057,1779909057),('/categories/create',2,NULL,NULL,NULL,1779909055,1779909055),('/categories/delete',2,NULL,NULL,NULL,1779909056,1779909056),('/categories/index',2,NULL,NULL,NULL,1779909054,1779909054),('/categories/update',2,NULL,NULL,NULL,1779909056,1779909056),('/categories/view',2,NULL,NULL,NULL,1779909054,1779909054),('/debug/*',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/*',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/db-explain',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/download-mail',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/index',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/toolbar',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/view',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/user/*',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/user/reset-identity',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/user/set-identity',2,NULL,NULL,NULL,1779897042,1779897042),('/executive-menus/*',2,NULL,NULL,NULL,1779910823,1779910823),('/executive-menus/create',2,NULL,NULL,NULL,1779910822,1779910822),('/executive-menus/delete',2,NULL,NULL,NULL,1779910823,1779910823),('/executive-menus/index',2,NULL,NULL,NULL,1779910822,1779910822),('/executive-menus/update',2,NULL,NULL,NULL,1779910823,1779910823),('/executive-menus/view',2,NULL,NULL,NULL,1779910822,1779910822),('/gii/*',2,NULL,NULL,NULL,1779897043,1779897043),('/gii/default/*',2,NULL,NULL,NULL,1779897043,1779897043),('/gii/default/action',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/diff',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/index',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/preview',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/view',2,NULL,NULL,NULL,1779897042,1779897042),('/products/*',2,NULL,NULL,NULL,1779909059,1779909059),('/products/create',2,NULL,NULL,NULL,1779909058,1779909058),('/products/delete',2,NULL,NULL,NULL,1779909058,1779909058),('/products/index',2,NULL,NULL,NULL,1779909057,1779909057),('/products/update',2,NULL,NULL,NULL,1779909058,1779909058),('/products/view',2,NULL,NULL,NULL,1779909058,1779909058),('/schedules/*',2,NULL,NULL,NULL,1780159224,1780159224),('/schedules/create',2,NULL,NULL,NULL,1780159224,1780159224),('/schedules/delete',2,NULL,NULL,NULL,1780159224,1780159224),('/schedules/index',2,NULL,NULL,NULL,1780159224,1780159224),('/schedules/update',2,NULL,NULL,NULL,1780159224,1780159224),('/schedules/view',2,NULL,NULL,NULL,1780159224,1780159224),('/site/*',2,NULL,NULL,NULL,1779897043,1779897043),('/site/about',2,NULL,NULL,NULL,1779897043,1779897043),('/site/captcha',2,NULL,NULL,NULL,1779897043,1779897043),('/site/contact',2,NULL,NULL,NULL,1779897043,1779897043),('/site/error',2,NULL,NULL,NULL,1779897043,1779897043),('/site/index',2,NULL,NULL,NULL,1779897043,1779897043),('/site/login',2,NULL,NULL,NULL,1779897043,1779897043),('/site/logout',2,NULL,NULL,NULL,1779897043,1779897043),('/users/*',2,NULL,NULL,NULL,1779907222,1779907222),('/users/create',2,NULL,NULL,NULL,1779907221,1779907221),('/users/delete',2,NULL,NULL,NULL,1779907222,1779907222),('/users/index',2,NULL,NULL,NULL,1779907220,1779907220),('/users/update',2,NULL,NULL,NULL,1779907221,1779907221),('/users/view',2,NULL,NULL,NULL,1779907220,1779907220),('fullAccess',2,'este es el acceso para los administradores',NULL,NULL,1779906493,1779906493),('SuperAdministrator',1,'Este es el máximo ROL que puede acceder a cualquier página',NULL,NULL,1779906530,1779906530);

/*Table structure for table `auth_item_child` */

DROP TABLE IF EXISTS `auth_item_child`;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `auth_item_child` */

insert  into `auth_item_child`(`parent`,`child`) values ('fullAccess','/*'),('SuperAdministrator','fullAccess');

/*Table structure for table `auth_rule` */

DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `auth_rule` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Descripción',
  `active` tinyint NOT NULL COMMENT 'Activo',
  `created` datetime NOT NULL COMMENT 'Creado',
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Creado por',
  `modified` datetime NOT NULL COMMENT 'Modificado',
  `modified_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`description`,`active`,`created`,`created_by`,`modified`,`modified_by`) values (1,'Entradas','Entradas y aperitivos antes del plato principal',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(2,'Sopas','Sopas tradicionales, cremas y caldos',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(3,'Carnes','Platos fuertes a base de carne de res',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(4,'Pollo','Platos preparados con pollo',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(5,'Cerdo','Platos preparados con carne de cerdo',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(6,'Pescados y Mariscos','Platos preparados con pescado y mariscos',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(7,'Pastas','Pastas, lasañas y platos italianos',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(8,'Hamburguesas','Hamburguesas artesanales y combos',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(9,'Perros Calientes','Hot dogs y perros especiales',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(10,'Sandwiches','Sandwiches y wraps',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(11,'Comida Rápida','Platos rápidos y snacks',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(12,'Arroces','Arroces especiales y tradicionales',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(13,'Parrilla','Carnes y platos preparados a la parrilla',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(14,'Ensaladas','Ensaladas frescas y saludables',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(15,'Vegetariano','Opciones vegetarianas',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(16,'Vegano','Opciones veganas',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(17,'Desayunos','Desayunos y comidas matutinas',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(18,'Bebidas','Bebidas frías, calientes y gaseosas',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(19,'Jugos Naturales','Jugos naturales y batidos',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(20,'Postres','Postres y dulces',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(21,'Adiciones','Ingredientes y extras adicionales',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(22,'Promociones','Promociones y combos especiales',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(23,'Infantil','Menú infantil para niños',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin'),(24,'Especialidades de la Casa','Platos insignia y especiales del restaurante',1,'2026-05-27 17:55:58','admin','2026-05-27 17:55:58','admin');

/*Table structure for table `executive_menus` */

DROP TABLE IF EXISTS `executive_menus`;

CREATE TABLE `executive_menus` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `day_of_week` enum('lunes','martes','miércoles','jueves','viernes','sábado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Día de la semana en que aplica el menú',
  `special_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre de la especialidad del día, ejemplo: (Ajiaco, frijoles, mondongo)',
  `special_description` text COLLATE utf8mb4_unicode_ci COMMENT 'Descripción detallada de la especialidad del día para IA y clientes',
  `soup_options_json` json DEFAULT NULL COMMENT 'Opciones de sopa disponibles en formato JSON',
  `protein_options_json` json DEFAULT NULL COMMENT 'Opciones de proteína disponibles en formato JSON',
  `carb_options_json` json DEFAULT NULL COMMENT 'Opciones de carbohidrato disponibles en formato JSON',
  `drink_options_json` json DEFAULT NULL COMMENT 'Opciones de bebidas disponibles en formato JSON',
  `salad_options_json` json DEFAULT NULL COMMENT 'Opciones de ensalada disponibles en formato JSON',
  `additional_notes` text COLLATE utf8mb4_unicode_ci COMMENT 'Notas adicionales visibles para clientes o IA',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Precio base del menú ejecutivo',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica si el menú está activo',
  `created` datetime NOT NULL COMMENT 'Creado',
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Fecha de última actualización',
  `modified` datetime NOT NULL COMMENT 'Modificado',
  `modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Fecha de última actualización',
  PRIMARY KEY (`id`),
  KEY `idx_day_of_week` (`day_of_week`),
  KEY `idx_is_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `executive_menus` */

insert  into `executive_menus`(`id`,`day_of_week`,`special_name`,`special_description`,`soup_options_json`,`protein_options_json`,`carb_options_json`,`drink_options_json`,`salad_options_json`,`additional_notes`,`price`,`active`,`created`,`created_by`,`modified`,`modified_by`) values (1,'lunes','Ajiaco','Delicioso ajiaco con alcaparras y crema de leche. Acompañado de arroz y aguacate','\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"lentejas\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 16:09:25','pipe.echeverri','2026-05-27 17:37:45','pipe.echeverri'),(2,'martes','Mondongo',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de pi\\\\u00f1a\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:28:27','pipe.echeverri'),(3,'miércoles','Sudado de posta',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 18:00:58','pipe.echeverri'),(4,'jueves','Cazuela de frijoles',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri'),(5,'viernes','Arroz con pollo',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri'),(6,'sábado',NULL,NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`parent`,`route`,`order`,`data`) values (1,'Configuración',NULL,NULL,2,'fas fa-tools'),(2,'Roles y accesos',1,'/admin/assignment/index',1,'fas fa-user-check'),(3,'Usuarios',1,'/users/index',2,'fas fa-users'),(4,'Administración',NULL,NULL,1,'fas fa-toggle-on'),(5,'Categorías',4,'/categories/index',3,'fas fa-list'),(6,'Productos',4,'/products/index',2,'fas fa-mug-hot'),(7,'Menú ejecutivo',4,'/executive-menus/index',1,'fas fa-utensils\r\n'),(8,'Horarios',4,'/schedules/index',4,'fas fa-clock');

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values ('m000000_000000_base',1779892973),('m140602_111327_create_menu_table',1779893520),('m160312_050000_create_user',1779893520),('m140506_102106_rbac_init',1779893606),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1779893607),('m180523_151638_rbac_updates_indexes_without_prefix',1779893608),('m200409_110543_rbac_update_mssql_trigger',1779893608);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int NOT NULL COMMENT 'Categoría',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Descripción',
  `price` decimal(10,0) NOT NULL COMMENT 'Precio',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen',
  `active` tinyint(1) NOT NULL COMMENT 'Activo',
  `sku` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SKU',
  `preparation_time_minutes` decimal(10,0) NOT NULL COMMENT 'Tiempo en minutos',
  `created` datetime NOT NULL COMMENT 'Creado',
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Creado por',
  `modified` datetime NOT NULL COMMENT 'Modificado',
  `modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `FK_products` (`category_id`),
  CONSTRAINT `FK_products` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`category_id`,`name`,`description`,`price`,`image`,`active`,`sku`,`preparation_time_minutes`,`created`,`created_by`,`modified`,`modified_by`) values (1,1,'Empanadas de Carne','Empanadas artesanales rellenas de carne desmechada acompañadas de ají casero','8000',NULL,1,'ENT-001','10','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(2,1,'Patacones con Hogao','Patacones crocantes acompañados de hogao tradicional y queso rallado','12000',NULL,1,'ENT-002','15','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(3,2,'Ajiaco Santafereño','Ajiaco tradicional con pollo desmechado, papa criolla, mazorca y crema de leche','22000',NULL,1,'SOP-001','20','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(4,2,'Frijoles Antioqueños','Frijoles tradicionales con chicharrón, arroz blanco y aguacate','20000',NULL,1,'SOP-002','18','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(5,2,'Crema de Zanahoria','Suave crema de zanahoria preparada con especias naturales','15000',NULL,1,'SOP-003','12','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(6,3,'Churrasco','Churrasco de res acompañado de papa francesa y ensalada','35000',NULL,1,'CAR-001','25','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(7,3,'Bandeja Paisa','Bandeja paisa tradicional con frijoles, arroz, carne molida, huevo y chicharrón','32000',NULL,1,'CAR-002','30','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(8,4,'Pollo a la Plancha','Pechuga de pollo a la plancha acompañada de arroz y ensalada','24000',NULL,1,'POL-001','18','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(9,4,'Pollo Apanado','Filete de pollo apanado con papas francesas y salsa tártara','26000',NULL,1,'POL-002','20','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(10,5,'Costillas BBQ','Costillas de cerdo bañadas en salsa BBQ acompañadas de papa casco','36000',NULL,1,'CER-001','30','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(11,5,'Lomo de Cerdo','Lomo de cerdo en salsa de champiñones con puré de papa','31000',NULL,1,'CER-002','25','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(12,6,'Salmón al Risotto','Filete de salmón acompañado de risotto cremoso de parmesano','42000',NULL,1,'PES-001','35','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(13,6,'Cazuela de Mariscos','Cazuela cremosa con camarones, calamares y pescado fresco','45000',NULL,1,'PES-002','35','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(14,7,'Pasta Carbonara','Pasta en salsa carbonara con tocineta crocante y queso parmesano','28000',NULL,1,'PAS-001','20','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(15,7,'Lasaña Mixta','Lasaña de pollo y carne gratinada','30000',NULL,1,'PAS-002','25','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(16,8,'Hamburguesa Clásica','Hamburguesa artesanal con queso cheddar y papas francesas','24000',NULL,1,'HAM-001','15','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(17,8,'Hamburguesa Doble Carne','Hamburguesa doble carne con tocineta y queso americano','32000',NULL,1,'HAM-002','18','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(18,18,'Coca Cola 400ml','Bebida gaseosa Coca Cola personal','5000',NULL,1,'BEB-001','2','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(19,18,'Agua Manantial','Botella de agua natural 600ml','4000',NULL,1,'BEB-002','1','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(20,19,'Jugo de Maracuyá','Jugo natural de maracuyá en agua o leche','7000',NULL,1,'JUG-001','5','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(21,19,'Limonada de Coco','Refrescante limonada cremosa de coco','10000',NULL,1,'JUG-002','7','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(22,20,'Tres Leches','Postre tradicional tres leches con crema chantilly','12000',NULL,1,'POS-001','5','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(23,20,'Cheesecake de Frutos Rojos','Cheesecake cremoso acompañado de salsa de frutos rojos','14000',NULL,1,'POS-002','5','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(24,21,'Adición de Aguacate','Porción adicional de aguacate fresco','3000',NULL,1,'ADI-001','1','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin'),(25,21,'Adición de Huevo','Huevo frito adicional','2000',NULL,1,'ADI-002','3','2026-05-27 17:59:21','admin','2026-05-27 17:59:21','admin');

/*Table structure for table `schedules` */

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `day_of_week` enum('lunes','martes','miércoles','jueves','viernes','sábado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Día de la semana',
  `is_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica si abre ese día',
  `open_time` time DEFAULT NULL COMMENT 'Hora de apertura',
  `close_time` time DEFAULT NULL COMMENT 'Hora de cierre',
  `created` datetime NOT NULL COMMENT 'Creado',
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Creado por',
  `modified` datetime NOT NULL COMMENT 'Modificado',
  `modified_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `idx_day` (`day_of_week`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `schedules` */

insert  into `schedules`(`id`,`day_of_week`,`is_open`,`open_time`,`close_time`,`created`,`created_by`,`modified`,`modified_by`) values (1,'lunes',1,'08:00:00','17:00:00','2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin'),(2,'martes',1,'08:00:00','17:00:00','2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin'),(3,'miércoles',1,'08:00:00','17:00:00','2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin'),(4,'jueves',1,'08:00:00','17:00:00','2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin'),(5,'viernes',1,'08:00:00','17:00:00','2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin'),(6,'sábado',1,'09:00:00','15:00:00','2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin'),(7,'domingo',0,NULL,NULL,'2026-05-30 11:38:37','admin','2026-05-30 11:38:37','admin');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `user` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nombre',
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Usuario',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Clave',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Correo electrónico',
  `active` tinyint(1) NOT NULL COMMENT 'Activo',
  `created` datetime NOT NULL COMMENT 'Creado',
  `created_by` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Creado por',
  `modified` datetime NOT NULL COMMENT 'Modificado',
  `modified_by` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`password`,`email`,`active`,`created`,`created_by`,`modified`,`modified_by`) values (4,'Felipe Echeverri','pipe.echeverri','118d2b3c46e89edfd7d28c4f865ef9ae','pipe.echeverri.1@gmail.com',1,'2026-05-27 10:27:00','admin','2026-05-27 13:42:39','pipe.echeverri');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
