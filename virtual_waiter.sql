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

insert  into `auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values ('/*',2,NULL,NULL,NULL,1779897043,1779897043),('/admin/*',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/assignment/*',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/assignment/assign',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/assignment/index',2,NULL,NULL,NULL,1779897039,1779897039),('/admin/assignment/revoke',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/assignment/view',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/default/*',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/default/index',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/*',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/create',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/delete',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/index',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/update',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/menu/view',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/permission/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/assign',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/create',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/permission/delete',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/get-users',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/index',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/permission/remove',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/update',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/permission/view',2,NULL,NULL,NULL,1779897040,1779897040),('/admin/role/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/assign',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/create',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/delete',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/get-users',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/remove',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/update',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/role/view',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/assign',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/create',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/refresh',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/route/remove',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/*',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/create',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/delete',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/update',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/rule/view',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/user/*',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/activate',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/change-password',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/delete',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/index',2,NULL,NULL,NULL,1779897041,1779897041),('/admin/user/login',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/logout',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/request-password-reset',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/reset-password',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/signup',2,NULL,NULL,NULL,1779897042,1779897042),('/admin/user/view',2,NULL,NULL,NULL,1779897042,1779897042),('/categories/*',2,NULL,NULL,NULL,1779909057,1779909057),('/categories/create',2,NULL,NULL,NULL,1779909055,1779909055),('/categories/delete',2,NULL,NULL,NULL,1779909056,1779909056),('/categories/index',2,NULL,NULL,NULL,1779909054,1779909054),('/categories/update',2,NULL,NULL,NULL,1779909056,1779909056),('/categories/view',2,NULL,NULL,NULL,1779909054,1779909054),('/debug/*',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/*',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/db-explain',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/download-mail',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/index',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/toolbar',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/default/view',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/user/*',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/user/reset-identity',2,NULL,NULL,NULL,1779897042,1779897042),('/debug/user/set-identity',2,NULL,NULL,NULL,1779897042,1779897042),('/executive-menus/*',2,NULL,NULL,NULL,1779910823,1779910823),('/executive-menus/create',2,NULL,NULL,NULL,1779910822,1779910822),('/executive-menus/delete',2,NULL,NULL,NULL,1779910823,1779910823),('/executive-menus/index',2,NULL,NULL,NULL,1779910822,1779910822),('/executive-menus/update',2,NULL,NULL,NULL,1779910823,1779910823),('/executive-menus/view',2,NULL,NULL,NULL,1779910822,1779910822),('/gii/*',2,NULL,NULL,NULL,1779897043,1779897043),('/gii/default/*',2,NULL,NULL,NULL,1779897043,1779897043),('/gii/default/action',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/diff',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/index',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/preview',2,NULL,NULL,NULL,1779897042,1779897042),('/gii/default/view',2,NULL,NULL,NULL,1779897042,1779897042),('/products/*',2,NULL,NULL,NULL,1779909059,1779909059),('/products/create',2,NULL,NULL,NULL,1779909058,1779909058),('/products/delete',2,NULL,NULL,NULL,1779909058,1779909058),('/products/index',2,NULL,NULL,NULL,1779909057,1779909057),('/products/update',2,NULL,NULL,NULL,1779909058,1779909058),('/products/view',2,NULL,NULL,NULL,1779909058,1779909058),('/site/*',2,NULL,NULL,NULL,1779897043,1779897043),('/site/about',2,NULL,NULL,NULL,1779897043,1779897043),('/site/captcha',2,NULL,NULL,NULL,1779897043,1779897043),('/site/contact',2,NULL,NULL,NULL,1779897043,1779897043),('/site/error',2,NULL,NULL,NULL,1779897043,1779897043),('/site/index',2,NULL,NULL,NULL,1779897043,1779897043),('/site/login',2,NULL,NULL,NULL,1779897043,1779897043),('/site/logout',2,NULL,NULL,NULL,1779897043,1779897043),('/users/*',2,NULL,NULL,NULL,1779907222,1779907222),('/users/create',2,NULL,NULL,NULL,1779907221,1779907221),('/users/delete',2,NULL,NULL,NULL,1779907222,1779907222),('/users/index',2,NULL,NULL,NULL,1779907220,1779907220),('/users/update',2,NULL,NULL,NULL,1779907221,1779907221),('/users/view',2,NULL,NULL,NULL,1779907220,1779907220),('fullAccess',2,'este es el acceso para los administradores',NULL,NULL,1779906493,1779906493),('SuperAdministrator',1,'Este es el máximo ROL que puede acceder a cualquier página',NULL,NULL,1779906530,1779906530);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`description`,`active`,`created`,`created_by`,`modified`,`modified_by`) values (1,'Sin categoría','Acá irán los platos que no pertenecen a un categoría',1,'2026-05-27 14:17:46','pipe.echeverri','2026-05-27 14:17:46','pipe.echeverri'),(2,'Pescados','Acá van todos los platos que sean de mar',0,'2026-05-27 14:19:06','pipe.echeverri','2026-05-27 14:19:12','pipe.echeverri'),(3,'Carnes','Acá van todas los productos que sean carnes',1,'2026-05-27 14:19:46','pipe.echeverri','2026-05-27 14:19:46','pipe.echeverri');

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

insert  into `executive_menus`(`id`,`day_of_week`,`special_name`,`special_description`,`soup_options_json`,`protein_options_json`,`carb_options_json`,`drink_options_json`,`salad_options_json`,`additional_notes`,`price`,`active`,`created`,`created_by`,`modified`,`modified_by`) values (1,'lunes','Ajiaco','Delicioso ajiaco con alcaparras y crema de leche. Acompañado de arroz y aguacate','\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"lentejas\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 16:09:25','pipe.echeverri','2026-05-27 17:37:45','pipe.echeverri'),(2,'martes','Mondongo',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de pi\\\\u00f1a\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:28:27','pipe.echeverri'),(3,'miércoles','Sudado de posta',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri'),(4,'jueves','Cazuela de frijoles',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri'),(5,'viernes','Arroz con pollo',NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri'),(6,'sábado',NULL,NULL,'\"[{\\\"name\\\":\\\"frijol\\\",\\\"description\\\":\\\"frijol\\\",\\\"extra_price\\\":\\\"\\\"},{\\\"name\\\":\\\"sopa pescado\\\",\\\"description\\\":\\\"sopa pescado desc\\\",\\\"extra_price\\\":\\\"1000\\\"},{\\\"name\\\":\\\"Crema Zanahoria\\\",\\\"description\\\":\\\"Crema Zanahoria 3\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Cerdo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Res\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Pollo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Chicharr\\\\u00f3n\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Salm\\\\u00f3n\\\",\\\"description\\\":\\\"Salm\\\\u00f3n ahumado\\\",\\\"extra_price\\\":\\\"3000\\\"}]\"','\"[{\\\"name\\\":\\\"Arroz blanco\\\",\\\"description\\\":\\\"Arroz blanco\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Arroz de coco\\\",\\\"description\\\":\\\"Arroz de coco\\\",\\\"extra_price\\\":\\\"500\\\"}]\"','\"[{\\\"name\\\":\\\"Guandolo\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Jugo de guayaba\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"}]\"','\"[{\\\"name\\\":\\\"Aguacate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Lechuga\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Tomate\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Zanahoria\\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Ensalada de la casa \\\",\\\"description\\\":\\\"\\\",\\\"extra_price\\\":\\\"0\\\"},{\\\"name\\\":\\\"Puerros\\\",\\\"description\\\":\\\"Puerros frescos\\\",\\\"extra_price\\\":\\\"300\\\"}]\"',NULL,'22000.00',1,'2026-05-27 17:27:37','pipe.echeverri','2026-05-27 17:27:37','pipe.echeverri');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`parent`,`route`,`order`,`data`) values (1,'Configuración',NULL,NULL,2,'fas fa-tools'),(2,'Roles y accesos',1,'/admin/assignment/index',1,'fas fa-user-check'),(3,'Usuarios',1,'/users/index',2,'fas fa-users'),(4,'Administración',NULL,NULL,1,'fas fa-toggle-on'),(5,'Categorías',4,'/categories/index',3,'fas fa-list'),(6,'Productos',4,'/products/index',2,'fas fa-mug-hot'),(7,'Menú ejecutivo',4,'/executive-menus/index',1,'fas fa-utensils\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`category_id`,`name`,`description`,`price`,`image`,`active`,`sku`,`preparation_time_minutes`,`created`,`created_by`,`modified`,`modified_by`) values (1,2,'Salmón al ajillo','Delicioso plato de salmón al ajillo acompañado de puré de papa y ensalada de casa','35000',NULL,1,'sal-ajillo','15','2026-05-27 14:24:23','pipe.echeverri','2026-05-27 14:24:23','pipe.echeverri');

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
