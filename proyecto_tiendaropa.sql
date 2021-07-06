/*
 Navicat Premium Data Transfer

 Source Server         : cnMySQL
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : proyecto_tiendaropa

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 06/07/2021 16:31:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idCategoria`) USING BTREE,
  UNIQUE INDEX `key_categoria_nombre`(`nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (9, 'Accesorios');
INSERT INTO `categoria` VALUES (3, 'Blusas');
INSERT INTO `categoria` VALUES (15, 'Calcetines');
INSERT INTO `categoria` VALUES (11, 'Chalecos');
INSERT INTO `categoria` VALUES (5, 'Chaquetas y Abrigos');
INSERT INTO `categoria` VALUES (7, 'Faldas');
INSERT INTO `categoria` VALUES (6, 'Jens');
INSERT INTO `categoria` VALUES (2, 'Pantalones');
INSERT INTO `categoria` VALUES (13, 'Ropa Interior');
INSERT INTO `categoria` VALUES (10, 'Sacos');
INSERT INTO `categoria` VALUES (12, 'Sueteres');
INSERT INTO `categoria` VALUES (4, 'Trajes de Baño');
INSERT INTO `categoria` VALUES (1, 'Vestidos');
INSERT INTO `categoria` VALUES (8, 'Zapatos');

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado`  (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idEmpleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES (1, 'Jilotepec', 'Perez Almaraz', 'Alfredo', '5510042043');
INSERT INTO `empleado` VALUES (2, 'Canalejas', 'Sanchez Hernandez', 'Alejandra', '7789653810');
INSERT INTO `empleado` VALUES (3, 'Tepeji del Rio ', 'Alvarez Suarez', 'Andrea', '5561697295');
INSERT INTO `empleado` VALUES (4, 'Jilotepec', 'Valentin Montiel', 'Rosario', '5540043659');
INSERT INTO `empleado` VALUES (5, 'Jilotepec', 'Gomez Hernandez', 'Maria', '5568947231');
INSERT INTO `empleado` VALUES (6, 'Huertas', 'Gonzalez Arce', 'Carmen', '5588966321');
INSERT INTO `empleado` VALUES (7, 'Jilotepec', 'Montiel Suarez', 'Jose', '5563976321');
INSERT INTO `empleado` VALUES (8, 'Jilotepec', 'Perez', 'Maria', '7789653210');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `idProducto` int NOT NULL,
  `precio` float(8, 2) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stockMax` int NOT NULL,
  `stockMin` int NOT NULL,
  `idcategoria` int NOT NULL,
  `Talla` int NOT NULL,
  `marca` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idProducto`) USING BTREE,
  INDEX `FKproducto_Categoria`(`idcategoria`) USING BTREE,
  CONSTRAINT `FK_idcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (78444369, 360.00, 'Pantalon ', 100, 15, 2, 30, 'Pineda Covalin');
INSERT INTO `producto` VALUES (78953152, 260.00, 'Abrigo', 50, 10, 5, 34, 'Cuadra');
INSERT INTO `producto` VALUES (87956428, 450.00, 'saco color azul', 60, 10, 10, 32, 'Covalino');
INSERT INTO `producto` VALUES (89547852, 450.00, 'saco floreado', 50, 20, 10, 32, 'Covalino');
INSERT INTO `producto` VALUES (89754632, 460.00, 'Pantalon tiro alto', 40, 20, 2, 30, 'Andrea');
INSERT INTO `producto` VALUES (96874539, 530.00, 'zapatillas color negro', 65, 10, 8, 30, 'Andrea');

-- ----------------------------
-- Table structure for productoproveedor
-- ----------------------------
DROP TABLE IF EXISTS `productoproveedor`;
CREATE TABLE `productoproveedor`  (
  `idProductoProv` int NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `idProveedor` int NOT NULL,
  PRIMARY KEY (`idProductoProv`) USING BTREE,
  INDEX `FK_idProducto`(`idProducto`) USING BTREE,
  INDEX `FK_idProveedor`(`idProveedor`) USING BTREE,
  CONSTRAINT `FK_idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productoproveedor
-- ----------------------------
INSERT INTO `productoproveedor` VALUES (1, 78365486, 3);
INSERT INTO `productoproveedor` VALUES (2, 78444369, 2);
INSERT INTO `productoproveedor` VALUES (3, 78953152, 1);
INSERT INTO `productoproveedor` VALUES (4, 78444369, 3);
INSERT INTO `productoproveedor` VALUES (5, 78953152, 2);

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor`  (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idProveedor`) USING BTREE,
  UNIQUE INDEX `Key_unique_nombProv`(`nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES (1, 'Fashion Mexico', 'fashionmexico@gmail.com', '7789652310');
INSERT INTO `proveedor` VALUES (2, 'Duplan', 'duplan15@gmail.com', '5589746820');
INSERT INTO `proveedor` VALUES (3, 'Zoara', 'zoara@gmail.com', '7759684230');
INSERT INTO `proveedor` VALUES (4, 'Shein', 'sheinmexico@gmail.com', '7789679521');
INSERT INTO `proveedor` VALUES (5, 'Covalin', 'covalin@gmail.com', '7786452310');
INSERT INTO `proveedor` VALUES (6, 'Cuidado con el Perro', 'cuidadoconelperro@gmail.com', '5455789220');
INSERT INTO `proveedor` VALUES (7, 'Fashion ', 'fashion@gmail.com', '7796820460');
INSERT INTO `proveedor` VALUES (8, 'Mex', 'mex@gmail.com', '7796841023');

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta`  (
  `noTicket` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(0) NOT NULL,
  `idEmpleado` int NOT NULL,
  PRIMARY KEY (`noTicket`) USING BTREE,
  INDEX `FK_idEmpleado`(`idEmpleado`) USING BTREE,
  CONSTRAINT `FK_idEmpleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 78695329 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of venta
-- ----------------------------
INSERT INTO `venta` VALUES (2874, '2021-06-29 06:50:00', 1);
INSERT INTO `venta` VALUES (3897, '2021-06-29 10:40:00', 2);
INSERT INTO `venta` VALUES (8974, '2021-06-29 21:08:18', 3);
INSERT INTO `venta` VALUES (9856, '2021-07-05 06:08:00', 1);
INSERT INTO `venta` VALUES (78695328, '2021-07-06 06:42:15', 4);

-- ----------------------------
-- Table structure for ventaproducto
-- ----------------------------
DROP TABLE IF EXISTS `ventaproducto`;
CREATE TABLE `ventaproducto`  (
  `idVentaProducto` bigint NOT NULL AUTO_INCREMENT,
  `noTicket` bigint NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idVentaProducto`) USING BTREE,
  INDEX `FK_noTicket`(`noTicket`) USING BTREE,
  INDEX `FK_idProductoVenta`(`idProducto`) USING BTREE,
  CONSTRAINT `FK_idProductoVenta` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_noTicket` FOREIGN KEY (`noTicket`) REFERENCES `venta` (`noTicket`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ventaproducto
-- ----------------------------
INSERT INTO `ventaproducto` VALUES (1, 2874, 78444369, 2);
INSERT INTO `ventaproducto` VALUES (2, 2874, 78953152, 3);
INSERT INTO `ventaproducto` VALUES (3, 3897, 78365486, 5);
INSERT INTO `ventaproducto` VALUES (4, 8974, 78953152, 4);
INSERT INTO `ventaproducto` VALUES (5, 8974, 78365486, 10);
INSERT INTO `ventaproducto` VALUES (6, 8974, 78444369, 1);

SET FOREIGN_KEY_CHECKS = 1;
