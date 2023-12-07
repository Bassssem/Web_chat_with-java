
CREATE TABLE `message` (
  `idmessage` int NOT NULL AUTO_INCREMENT,
  `iduser` int DEFAULT NULL,
  `date` datetime(3) DEFAULT NULL,
  `msg` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idmessage`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
