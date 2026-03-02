/*
 Navicat Premium Dump SQL

 Source Server         : kls.moph.go.th
 Source Server Type    : MySQL
 Source Server Version : 100623 (10.6.23-MariaDB)
 Source Host           : 164.115.43.161:3306
 Source Schema         : oat_cpkls

 Target Server Type    : MySQL
 Target Server Version : 100623 (10.6.23-MariaDB)
 File Encoding         : 65001

 Date: 03/03/2026 00:22:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bexcellence
-- ----------------------------
DROP TABLE IF EXISTS `bexcellence`;
CREATE TABLE `bexcellence`  (
  `byear` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ปีงบประมาณ',
  `eval_round` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รอบการประเมิน (เช่น รอบที่ 1)',
  `ex_id` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัส Excellence',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่แก้ไขข้อมูล',
  PRIMARY KEY (`byear`, `eval_round`, `ex_id`) USING BTREE,
  INDEX `idx_bexcellence_ex`(`ex_id` ASC) USING BTREE,
  CONSTRAINT `fk_bexcellence_cexcellence` FOREIGN KEY (`ex_id`) REFERENCES `cexcellence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bexcellence_fiscal_years` FOREIGN KEY (`byear`) REFERENCES `fiscal_years` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Config Excellence รายปี' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bexcellence
-- ----------------------------
INSERT INTO `bexcellence` VALUES ('2569', '1', '01', '2025-12-22 10:30:08');
INSERT INTO `bexcellence` VALUES ('2569', '1', '02', '2025-12-22 10:30:10');
INSERT INTO `bexcellence` VALUES ('2569', '1', '03', '2025-12-22 10:30:11');
INSERT INTO `bexcellence` VALUES ('2569', '1', '04', '2025-12-22 10:30:12');
INSERT INTO `bexcellence` VALUES ('2569', '1', '05', '2025-12-22 10:30:13');

-- ----------------------------
-- Table structure for campur
-- ----------------------------
DROP TABLE IF EXISTS `campur`;
CREATE TABLE `campur`  (
  `ampurcodefull` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสอำเภอ 4 หลัก (PK)',
  `ampurname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่ออำเภอ',
  `changwatcode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสจังหวัด (FK)',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT 'ละติจูด (Latitude)',
  `lon` decimal(10, 6) NULL DEFAULT NULL COMMENT 'ลองจิจูด (Longitude)',
  `zoom_lv` int NULL DEFAULT NULL COMMENT 'ระดับการซูมแผนที่เริ่มต้น',
  `flag_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'สถานะการใช้งาน (1=ใช้งาน, 0=ยกเลิก)',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูล',
  PRIMARY KEY (`ampurcodefull`) USING BTREE,
  INDEX `idx_campur_changwat`(`changwatcode` ASC) USING BTREE,
  CONSTRAINT `fk_campur_cchangwat` FOREIGN KEY (`changwatcode`) REFERENCES `cchangwat` (`changwatcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลอำเภอ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of campur
-- ----------------------------
INSERT INTO `campur` VALUES ('4601', 'เมืองกาฬสินธุ์', '46', 16.521217, 103.546467, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4602', 'นามน', '46', 16.591965, 103.780690, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4603', 'กมลาไสย', '46', 16.285380, 103.604291, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4604', 'ร่องคำ', '46', 16.287250, 103.717349, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4605', 'กุฉินารายณ์', '46', 16.528679, 104.044389, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4606', 'เขาวง', '46', 16.696378, 104.098369, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4607', 'ยางตลาด', '46', 16.453640, 103.340833, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4608', 'ห้วยเม็ก', '46', 16.610264, 103.242985, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4609', 'สหัสขันธ์', '46', 16.727381, 103.577528, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4610', 'คำม่วง', '46', 16.948261, 103.656962, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4611', 'ท่าคันโท', '46', 16.891337, 103.228716, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4612', 'หนองกุงศรี', '46', 16.734079, 103.320309, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4613', 'สมเด็จ', '46', 16.799593, 103.753724, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4614', 'ห้วยผึ้ง', '46', 16.674860, 103.881672, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4615', 'สามชัย', '46', 16.891746, 103.528821, 10, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4616', 'นาคู', '46', 16.754141, 104.003550, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4617', 'ดอนจาน', '46', 16.479274, 103.714785, 11, '1', '2025-08-14 09:48:37');
INSERT INTO `campur` VALUES ('4618', 'ฆ้องชัย', '46', 16.264206, 103.477974, 11, '1', '2025-08-14 09:48:37');

-- ----------------------------
-- Table structure for cchangwat
-- ----------------------------
DROP TABLE IF EXISTS `cchangwat`;
CREATE TABLE `cchangwat`  (
  `changwatcode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสจังหวัด (PK)',
  `changwatname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อจังหวัด',
  `changwatname_en` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อจังหวัด (ENG)',
  `zonecode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสเขตสุขภาพ',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT 'ละติจูด (Latitude)',
  `lon` decimal(10, 6) NULL DEFAULT NULL COMMENT 'ลองจิจูด (Longitude)',
  `zoom_lv` int NULL DEFAULT NULL COMMENT 'ระดับการซูมแผนที่เริ่มต้น',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูล',
  PRIMARY KEY (`changwatcode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลจังหวัด' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cchangwat
-- ----------------------------
INSERT INTO `cchangwat` VALUES ('10', 'กรุงเทพมหานคร', 'Bangkok', '13', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('11', 'สมุทรปราการ', 'Samut Prakan', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('12', 'นนทบุรี', 'Nonthaburi', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('13', 'ปทุมธานี', 'Pathum Thani', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('14', 'พระนครศรีอยุธยา', 'Phra Nakhon Si Ayutthaya', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('15', 'อ่างทอง', 'Ang Thong', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('16', 'ลพบุรี', 'Lopburi', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('17', 'สิงห์บุรี', 'Sing Buri', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('18', 'ชัยนาท', 'Chai Nat', '03', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('19', 'สระบุรี', 'Saraburi', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('20', 'ชลบุรี', 'Chonburi', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('21', 'ระยอง', 'Rayong', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('22', 'จันทบุรี', 'Chanthaburi', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('23', 'ตราด', 'Trat', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('24', 'ฉะเชิงเทรา', 'Chachoengsao', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('25', 'ปราจีนบุรี', 'Prachinburi', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('26', 'นครนายก', 'Nakhon Nayok', '04', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('27', 'สระแก้ว', 'Sa Kaeo', '06', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('30', 'นครราชสีมา', 'Nakhon Ratchasima', '09', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('31', 'บุรีรัมย์', 'Buriram', '09', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('32', 'สุรินทร์', 'Surin', '09', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('33', 'ศรีสะเกษ', 'Sisaket', '10', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('34', 'อุบลราชธานี', 'Ubon Ratchathani', '10', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('35', 'ยโสธร', 'Yasothon', '10', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('36', 'ชัยภูมิ', 'Chaiyaphum', '09', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('37', 'อำนาจเจริญ', 'Amnat Charoen', '10', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('38', 'บึงกาฬ', 'Bueng Kan', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('39', 'หนองบัวลำภู', 'Nong Bua Lam Phu', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('40', 'ขอนแก่น', 'Khon Kaen', '07', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('41', 'อุดรธานี', 'Udon Thani', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('42', 'เลย', 'Loei', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('43', 'หนองคาย', 'Nong Khai', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('44', 'มหาสารคาม', 'Maha Sarakham', '07', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('45', 'ร้อยเอ็ด', 'Roi Et', '07', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('46', 'กาฬสินธุ์', 'Kalasin', '07', 16.628243, 103.591743, 9, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('47', 'สกลนคร', 'Sakon Nakhon', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('48', 'นครพนม', 'Nakhon Phanom', '08', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('49', 'มุกดาหาร', 'Mukdahan', '10', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('50', 'เชียงใหม่', 'Chiang Mai', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('51', 'ลำพูน', 'Lamphun', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('52', 'ลำปาง', 'Lampang', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('53', 'อุตรดิตถ์', 'Uttaradit', '02', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('54', 'แพร่', 'Phrae', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('55', 'น่าน', 'Nan', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('56', 'พะเยา', 'Phayao', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('57', 'เชียงราย', 'Chiang Rai', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('58', 'แม่ฮ่องสอน', 'Mae Hong Son', '01', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('60', 'นครสวรรค์', 'Nakhon Sawan', '03', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('61', 'อุทัยธานี', 'Uthai Thani', '03', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('62', 'กำแพงเพชร', 'Kamphaeng Phet', '03', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('63', 'ตาก', 'Tak', '02', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('64', 'สุโขทัย', 'Sukhothai', '02', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('65', 'พิษณุโลก', 'Phitsanulok', '02', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('66', 'พิจิตร', 'Phichit', '03', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('67', 'เพชรบูรณ์', 'Phetchabun', '02', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('70', 'ราชบุรี', 'Ratchaburi', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('71', 'กาญจนบุรี', 'Kanchanaburi', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('72', 'สุพรรณบุรี', 'Suphan Buri', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('73', 'นครปฐม', 'Nakhon Pathom', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('74', 'สมุทรสาคร', 'Samut Sakhon', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('75', 'สมุทรสงคราม', 'Samut Songkhram', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('76', 'เพชรบุรี', 'Phetchaburi', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('77', 'ประจวบคีรีขันธ์', 'Prachuap Khiri Khan', '05', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('80', 'นครศรีธรรมราช', 'Nakhon Si Thammarat', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('81', 'กระบี่', 'Krabi', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('82', 'พังงา', 'Phang Nga', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('83', 'ภูเก็ต', 'Phuket', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('84', 'สุราษฎร์ธานี', 'Surat Thani', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('85', 'ระนอง', 'Ranong', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('86', 'ชุมพร', 'Chumphon', '11', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('90', 'สงขลา', 'Songkhla', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('91', 'สตูล', 'Satun', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('92', 'ตรัง', 'Trang', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('93', 'พัทลุง', 'Phatthalung', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('94', 'ปัตตานี', 'Pattani', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('95', 'ยะลา', 'Yala', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('96', 'นราธิวาส', 'Narathiwat', '12', NULL, NULL, NULL, '2025-12-12 10:06:50');
INSERT INTO `cchangwat` VALUES ('99', 'ไม่ทราบ', 'Unknown', '99', NULL, NULL, NULL, '2025-12-12 10:06:50');

-- ----------------------------
-- Table structure for cexcellence
-- ----------------------------
DROP TABLE IF EXISTS `cexcellence`;
CREATE TABLE `cexcellence`  (
  `id` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัส Excellence (PK)',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อสาขา Excellence',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูล',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Master Data สาขา Excellence' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cexcellence
-- ----------------------------
INSERT INTO `cexcellence` VALUES ('01', 'PP&P Excellence ', '2025-12-12 11:12:48');
INSERT INTO `cexcellence` VALUES ('02', 'Service Excellence', '2025-12-12 11:12:48');
INSERT INTO `cexcellence` VALUES ('03', 'People Excellence', '2025-12-12 11:12:48');
INSERT INTO `cexcellence` VALUES ('04', 'Governance Excellence', '2025-12-12 11:12:48');
INSERT INTO `cexcellence` VALUES ('05', 'Health-Related Economics Excellence', '2025-12-12 11:12:48');
INSERT INTO `cexcellence` VALUES ('99', 'พันธกิจ', '2025-12-12 11:12:48');

-- ----------------------------
-- Table structure for chospital
-- ----------------------------
DROP TABLE IF EXISTS `chospital`;
CREATE TABLE `chospital`  (
  `hoscode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสหน่วยบริการ 5 หลัก (PK)',
  `hosname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อหน่วยบริการ',
  `hostype` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ประเภทหน่วยบริการ (รพศ/รพท/รพช/รพ.สต.)',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ที่อยู่',
  `road` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ถนน',
  `mu` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT 'หมู่',
  `subdistcode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT 'รหัสตำบล (2 หลัก)',
  `distcode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT 'รหัสอำเภอ (2 หลัก)',
  `provcode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT 'รหัสจังหวัด (2 หลัก)',
  `postcode` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสไปรษณีย์',
  `hoscodenew` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสหน่วยบริการใหม่',
  `bed` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT 'จำนวนเตียง',
  `level_service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ระดับการบริการ',
  `bedhos` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'จำนวนเตียงโรงพยาบาล',
  `hdc_regist` int NULL DEFAULT 0 COMMENT 'จำนวนการลงทะเบียน HDC',
  `dep` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสหน่วยงานต้นสังกัด',
  `hmain_sent` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสหน่วยงานหลัก',
  `register_date` date NULL DEFAULT NULL COMMENT 'วันที่ลงทะเบียน',
  `mcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสสังกัด (เช่น รหัส CUP หรือ สสอ.) สำหรับจัดกลุ่มรายงาน',
  `status` decimal(1, 0) NULL DEFAULT 1 COMMENT 'สถานะ (1=เปิด, 0=ปิด)',
  `m_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อ M',
  `dep_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อหน่วยงานต้นสังกัด',
  `zone_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสโซน',
  `zone_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อโซน',
  `chw_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสจังหวัด (FK)',
  `chw_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อจังหวัด',
  `amp_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสอำเภอ (FK)',
  `amp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่ออำเภอ',
  `tmb_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสตำบล (FK)',
  `tmb_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อตำบล',
  `bed_cmi` int NULL DEFAULT NULL COMMENT 'จำนวนเตียง CMI',
  `note` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'หมายเหตุ',
  `hostype_new` int NULL DEFAULT NULL COMMENT 'ประเภทหน่วยบริการใหม่',
  `close_date` date NULL DEFAULT NULL COMMENT 'วันที่ปิดหน่วยบริการ',
  PRIMARY KEY (`hoscode`) USING BTREE,
  INDEX `idx_chospital_amp`(`amp_code` ASC) USING BTREE,
  INDEX `idx_chospital_mcode`(`mcode` ASC) USING BTREE,
  INDEX `fk_chospital_cchangwat`(`chw_code` ASC) USING BTREE,
  INDEX `fk_chospital_tambon`(`tmb_code` ASC) USING BTREE,
  CONSTRAINT `fk_chospital_campur` FOREIGN KEY (`amp_code`) REFERENCES `campur` (`ampurcodefull`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_chospital_cchangwat` FOREIGN KEY (`chw_code`) REFERENCES `cchangwat` (`changwatcode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_chospital_tambon` FOREIGN KEY (`tmb_code`) REFERENCES `ctambon` (`tamboncodefull`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลหน่วยบริการ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chospital
-- ----------------------------
INSERT INTO `chospital` VALUES ('00033', 'สำนักงานสาธารณสุขจังหวัดกาฬสินธุ์', '01', '3/38   ถนนเลี่ยงเมือง  ', NULL, '00', '01', '01', '46', NULL, 'AA0000033', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460101', 'กาฬสินธุ์', NULL, '', 1, NULL);
INSERT INTO `chospital` VALUES ('00476', 'สำนักงานสาธารณสุขอำเภอเมืองกาฬสินธุ์', '02', '121  ถ.ภิรมย์ ', NULL, '00', '01', '01', '46', NULL, 'BA0000476', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460101', 'กาฬสินธุ์', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00477', 'สำนักงานสาธารณสุขอำเภอนามน', '02', '', NULL, '03', '01', '02', '46', NULL, 'BA0000477', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460201', 'นามน', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00478', 'สำนักงานสาธารณสุขอำเภอกมลาไสย', '02', '', NULL, '01', '01', '03', '46', NULL, 'BA0000478', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460301', 'กมลาไสย', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00479', 'สำนักงานสาธารณสุขอำเภอร่องคำ', '02', '', NULL, '13', '01', '04', '46', NULL, 'BA0000479', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4604', 'ร่องคำ', '460401', 'ร่องคำ', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00480', 'สำนักงานสาธารณสุขอำเภอกุฉินารายณ์', '02', '390 ', NULL, '02', '01', '05', '46', NULL, 'BA0000480', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460501', 'บัวขาว', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00481', 'สำนักงานสาธารณสุขอำเภอเขาวง', '02', '', NULL, '03', '01', '06', '46', NULL, 'BA0000481', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460601', 'คุ้มเก่า', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00482', 'สำนักงานสาธารณสุขอำเภอยางตลาด', '02', '116', NULL, '01', '01', '07', '46', NULL, 'BA0000482', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460701', 'ยางตลาด', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00483', 'สำนักงานสาธารณสุขอำเภอห้วยเม็ก', '02', '', NULL, '03', '01', '08', '46', NULL, 'BA0000483', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460801', 'ห้วยเม็ก', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00484', 'สำนักงานสาธารณสุขอำเภอสหัสขันธ์', '02', '62 ', NULL, '10', '07', '09', '46', NULL, 'BA0000484', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460907', 'โนนบุรี', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00485', 'สำนักงานสาธารณสุขอำเภอคำม่วง', '02', '', NULL, '04', '01', '10', '46', NULL, 'BA0000485', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461001', 'ทุ่งคลอง', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00486', 'สำนักงานสาธารณสุขอำเภอท่าคันโท', '02', '', NULL, '01', '05', '11', '46', NULL, 'BA0000486', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461105', 'นาตาล', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00487', 'สำนักงานสาธารณสุขอำเภอหนองกุงศรี', '02', '', NULL, '12', '01', '12', '46', NULL, 'BA0000487', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461201', 'หนองกุงศรี', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00488', 'สำนักงานสาธารณสุขอำเภอสมเด็จ', '02', '', NULL, '02', '01', '13', '46', NULL, 'BA0000488', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461301', 'สมเด็จ', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00489', 'สำนักงานสาธารณสุขอำเภอห้วยผึ้ง', '02', '', NULL, '04', '03', '14', '46', NULL, 'BA0000489', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461403', 'นิคมห้วยผึ้ง', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00490', 'สำนักงานสาธารณสุขอำเภอสามชัย', '02', '', NULL, '03', '01', '15', '46', NULL, 'BA0000490', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461501', 'สำราญ', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00491', 'สำนักงานสาธารณสุขอำเภอนาคู', '02', '', NULL, '10', '01', '16', '46', NULL, 'BA0000491', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461601', 'นาคู', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('00492', 'สำนักงานสาธารณสุขอำเภอดอนจาน', '02', '', NULL, '03', '01', '17', '46', NULL, 'BA0000492', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461701', 'ดอนจาน', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('05291', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านต้อน', '18', ' ', NULL, '07', '02', '01', '46', NULL, 'GA0005291', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460102', 'เหนือ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05292', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนสว่าง', '18', ' ', NULL, '12', '03', '01', '46', NULL, 'GA0005292', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460103', 'หลุบ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05293', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองโพน', '18', NULL, NULL, '06', '04', '01', '46', NULL, 'GA0005293', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460104', 'ไผ่', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05294', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองสอ', '18', ' ', NULL, '01', '05', '01', '46', NULL, 'GA0005294', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460105', 'ลำปาว', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05295', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสะอาดนาทม', '18', ' ', NULL, '01', '21', '01', '46', NULL, 'GA0005295', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460121', 'ลำคลอง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05296', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านฝายแตก', '18', '', NULL, '03', '06', '01', '46', NULL, 'GA0005296', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460106', 'ลำพาน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05297', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนแพง', '18', ' ', NULL, '06', '06', '01', '46', NULL, 'GA0005297', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460106', 'ลำพาน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05298', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเชียงเครือ', '18', ' ', NULL, '02', '07', '01', '46', NULL, 'GA0005298', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460107', 'เชียงเครือ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05299', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านแกเปะ', '18', ' ', NULL, '07', '07', '01', '46', NULL, 'GA0005299', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460107', 'เชียงเครือ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05300', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านท่าไคร้', '18', ' ', NULL, '07', '08', '01', '46', NULL, 'GA0005300', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460108', 'บึงวิชัย', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05301', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดงสว่าง', '18', NULL, NULL, '05', '09', '01', '46', NULL, 'GA0005301', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460109', 'ห้วยโพธิ์', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05302', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแวงใหญ่', '18', '', NULL, '03', '11', '01', '46', NULL, 'GA0005302', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460111', 'ภูปอ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05303', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเหล่าหลวง', '18', NULL, NULL, '08', '13', '01', '46', NULL, 'GA0005303', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460113', 'ภูดิน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05304', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำไผ่', '18', ' ', NULL, '02', '15', '01', '46', NULL, 'GA0005304', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460115', 'หนองกุง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05305', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเหล่ากลาง', '18', NULL, NULL, '02', '16', '01', '46', NULL, 'GA0005305', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460116', 'กลางหมื่น', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05306', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านน้ำบุ่น', '18', '', NULL, '05', '16', '01', '46', NULL, 'GA0005306', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460116', 'กลางหมื่น', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05307', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแวงใต้', '18', ' ', NULL, '03', '17', '01', '46', NULL, 'GA0005307', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460117', 'ขมิ้น', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05308', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนชัย', '18', NULL, NULL, '08', '17', '01', '46', NULL, 'GA0005308', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460117', 'ขมิ้น', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05309', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโพนทอง', '18', NULL, NULL, '07', '19', '01', '46', NULL, 'GA0005309', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460119', 'โพนทอง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05310', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาจารย์', '18', ' ', NULL, '04', '20', '01', '46', NULL, 'GA0005310', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460120', 'นาจารย์', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05311', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนศรีสวัสดิ์', '18', ' ', NULL, '07', '02', '02', '46', NULL, 'GA0005311', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460202', 'ยอดแกง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05312', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านยอดแกง', '18', ' ', NULL, '11', '02', '02', '46', NULL, 'GA0005312', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460202', 'ยอดแกง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05313', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหัวงัว', '18', ' ', NULL, '05', '03', '02', '46', NULL, 'GA0005313', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460203', 'สงเปลือย', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05314', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสงเปลือย', '18', ' ', NULL, '09', '03', '02', '46', NULL, 'GA0005314', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460203', 'สงเปลือย', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05315', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านอุทัยวรรณ', '18', ' ', NULL, '02', '04', '02', '46', NULL, 'GA0005315', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460204', 'หลักเหลี่ยม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05316', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัวใน', '18', ' ', NULL, '07', '05', '02', '46', NULL, 'GA0005316', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460205', 'หนองบัว', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05317', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านข้าวหลาม', '18', NULL, NULL, '02', '01', '03', '46', NULL, 'GA0005317', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460301', 'กมลาไสย', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05318', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านบึง', '18', ' ', NULL, '10', '02', '03', '46', NULL, 'GA0005318', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460302', 'หลักเมือง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05319', 'สถานีอนามัยเฉลิมพระเกียรติ 60 พรรษา นวมินทราชินี', '18', ' ', NULL, '08', '03', '03', '46', NULL, 'GA0005319', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460303', 'โพนงาม', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05320', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสีถาน', '18', ' ', NULL, '04', '04', '03', '46', NULL, 'GA0005320', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460304', 'ดงลิง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05321', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านบ่อ', '18', ' ', NULL, '02', '05', '03', '46', NULL, 'GA0005321', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460305', 'ธัญญา', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05322', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนเขวา', '18', ' ', NULL, '04', '02', '18', '46', NULL, 'GA0005322', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461802', 'เหล่ากลาง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05323', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนทัน', '18', ' ', NULL, '08', '02', '18', '46', NULL, 'GA0005323', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461802', 'เหล่ากลาง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05324', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านท่าเยื่ยม', '18', '', NULL, '06', '05', '18', '46', '', 'GA0005324', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461805', 'ลำชี', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05325', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนแดง', '18', '', NULL, '12', '05', '18', '46', '', 'GA0005325', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461805', 'ลำชี', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05326', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแปน', '18', NULL, NULL, '01', '08', '03', '46', NULL, 'GA0005326', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460308', 'หนองแปน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05327', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัว', '18', ' ', NULL, '03', '03', '18', '46', NULL, 'GA0005327', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461803', 'โคกสะอาด', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05328', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโคกประสิทธิ์', '18', ' ', NULL, '05', '03', '18', '46', NULL, 'GA0005328', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461803', 'โคกสะอาด', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05329', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านท่าเพลิง', '18', ' ', NULL, '01', '10', '03', '46', NULL, 'GA0005329', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460310', 'เจ้าท่า', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05330', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัว', '18', ' ', NULL, '09', '10', '03', '46', NULL, 'GA0005330', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460310', 'เจ้าท่า', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05331', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนามล', '18', ' ', NULL, '02', '11', '03', '46', NULL, 'GA0005331', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460311', 'โคกสมบูรณ์', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05332', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนศิลาเลิง', '18', '', NULL, '01', '04', '18', '46', '', 'GA0005332', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461804', 'โนนศิลาเลิง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05333', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาเรียง', '18', ' ', NULL, '10', '02', '04', '46', NULL, 'GA0005333', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4604', 'ร่องคำ', '460402', 'สามัคคี', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05334', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านค้อพัฒนา', '18', ' ', NULL, '03', '03', '04', '46', NULL, 'GA0005334', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4604', 'ร่องคำ', '460403', 'เหล่าอ้อย', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05335', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านแจนแลน', '18', ' ', NULL, '01', '02', '05', '46', NULL, 'GA0005335', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460502', 'แจนแลน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05336', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดฝั่งแดง', '18', ' ', NULL, '06', '03', '05', '46', NULL, 'GA0005336', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460503', 'เหล่าใหญ่', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05337', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเหล่าใหญ่', '18', ' ', NULL, '07', '03', '05', '46', NULL, 'GA0005337', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460503', 'เหล่าใหญ่', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05338', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสันติสุข ', '18', '', NULL, '14', '04', '05', '46', NULL, 'GA0005338', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460504', 'จุมจัง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05339', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาสีนวล', '18', ' ', NULL, '05', '04', '05', '46', NULL, 'GA0005339', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460504', 'จุมจัง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05340', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเหล่าไฮงาม', '18', '', NULL, '10', '05', '05', '46', NULL, 'GA0005340', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460505', 'เหล่าไฮงาม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05341', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสวนผึ้ง', '18', ' ', NULL, '04', '05', '05', '46', NULL, 'GA0005341', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460505', 'เหล่าไฮงาม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05342', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาไคร้ ', '18', ' ', NULL, '07', '06', '05', '46', NULL, 'GA0005342', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460506', 'กุดหว้า', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05343', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดหว้า', '18', ' ', NULL, '08', '06', '05', '46', NULL, 'GA0005343', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460506', 'กุดหว้า', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05344', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแวงศรี ', '18', '', NULL, '11', '07', '05', '46', NULL, 'GA0005344', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460507', 'สามขา', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05345', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคุย', '18', NULL, NULL, '12', '07', '05', '46', NULL, 'GA0005345', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460507', 'สามขา', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05346', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนฟองแก้ว', '18', ' ', NULL, '03', '08', '05', '46', NULL, 'GA0005346', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460508', 'นาขาม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05347', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนสวาง', '18', ' ', NULL, '06', '08', '05', '46', NULL, 'GA0005347', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460508', 'นาขาม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05348', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองห้าง', '18', ' ', NULL, '01', '09', '05', '46', NULL, 'GA0005348', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460509', 'หนองห้าง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05349', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาโก', '18', '', NULL, '01', '10', '05', '46', NULL, 'GA0005349', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460510', 'นาโก', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05350', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัวทอง', '18', ' ', NULL, '05', '11', '05', '46', NULL, 'GA0005350', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460511', 'สมสะอาด', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05351', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดค้าว', '18', ' ', NULL, '03', '12', '05', '46', NULL, 'GA0005351', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460512', 'กุดค้าว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05352', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดบอด', '18', ' ', NULL, '04', '02', '06', '46', NULL, 'GA0005352', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460602', 'สงเปลือย', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05353', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาตาหลิ่ว', '18', ' ', NULL, '05', '03', '06', '46', NULL, 'GA0005353', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460603', 'หนองผือ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05354', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองผือ', '18', ' ', NULL, '07', '03', '06', '46', NULL, 'GA0005354', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460603', 'หนองผือ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05355', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโพนสวาง', '18', ' ', NULL, '12', '06', '06', '46', NULL, 'GA0005355', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460606', 'กุดสิมคุ้มใหม่', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05356', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนสะอาด', '18', ' ', NULL, '03', '08', '06', '46', NULL, 'GA0005356', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460608', 'สระพังทอง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05357', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเสียว', '18', ' ', NULL, '06', '02', '07', '46', NULL, 'GA0005357', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460702', 'หัวงัว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05358', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโคกศรี', '18', ' ', NULL, '05', '03', '07', '46', NULL, 'GA0005358', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460703', 'อุ่มเม่า', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05359', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านตูม', '18', NULL, NULL, '04', '04', '07', '46', NULL, 'GA0005359', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460704', 'บัวบาน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05360', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโคกใหญ่', '18', ' ', NULL, '18', '04', '07', '46', NULL, 'GA0005360', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460704', 'บัวบาน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05361', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านห้วยเตย', '18', '', NULL, '04', '05', '07', '46', NULL, 'GA0005361', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460705', 'เว่อ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05362', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านแก', '18', NULL, NULL, '04', '06', '07', '46', NULL, 'GA0005362', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460706', 'อิตื้อ', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05363', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหัวนาคำ', '18', ' ', NULL, '11', '07', '07', '46', NULL, 'GA0005363', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460707', 'หัวนาคำ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05364', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดงบัง', '18', ' ', NULL, '15', '07', '07', '46', NULL, 'GA0005364', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460707', 'หัวนาคำ', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05365', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองอิเฒ่า', '18', ' ', NULL, '09', '08', '07', '46', NULL, 'GA0005365', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460708', 'หนองอิเฒ่า', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05366', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดอนยานาง', '18', ' ', NULL, '01', '09', '07', '46', NULL, 'GA0005366', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460709', 'ดอนสมบูรณ์', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05367', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาเชือก', '18', ' ', NULL, '06', '10', '07', '46', NULL, 'GA0005367', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460710', 'นาเชือก', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05368', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านขาม', '18', ' ', NULL, '03', '11', '07', '46', NULL, 'GA0005368', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460711', 'คลองขาม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05369', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโคกสี', '18', ' ', NULL, '06', '11', '07', '46', NULL, 'GA0005369', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460711', 'คลองขาม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05370', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพุทธรักษา', '18', NULL, NULL, '04', '12', '07', '46', NULL, 'GA0005370', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460712', 'เขาพระนอน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05371', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านปอแดง', '18', ' ', NULL, '03', '13', '07', '46', NULL, 'GA0005371', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460713', 'นาดี', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05372', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนสูง', '18', ' ', NULL, '05', '14', '07', '46', NULL, 'GA0005372', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460714', 'โนนสูง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05373', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองตอกแป้น', '18', '', NULL, '05', '15', '07', '46', NULL, 'GA0005373', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460715', 'หนองตอกแป้น', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05374', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำใหญ่', '18', ' ', NULL, '07', '02', '08', '46', NULL, 'GA0005374', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460802', 'คำใหญ่', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05375', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดโดน', '18', ' ', NULL, '01', '03', '08', '46', NULL, 'GA0005375', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460803', 'กุดโดน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05376', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัว', '18', '', NULL, '06', '04', '08', '46', NULL, 'GA0005376', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460804', 'บึงนาเรียง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05377', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านห้วยมะทอ', '18', ' ', NULL, '02', '05', '08', '46', NULL, 'GA0005377', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460805', 'หัวหิน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05378', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านพิมูล', '18', '', NULL, '05', '06', '08', '46', NULL, 'GA0005378', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460806', 'พิมูล', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05379', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำเหมือดแก้ว', '18', ' ', NULL, '03', '07', '08', '46', NULL, 'GA0005379', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460807', 'คำเหมือดแก้ว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05380', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนขี้ควง', '18', '', NULL, '02', '08', '08', '46', NULL, 'GA0005380', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460808', 'โนนสะอาด', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05381', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านทรายทอง', '18', ' ', NULL, '03', '09', '08', '46', NULL, 'GA0005381', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460809', 'ทรายทอง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05382', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำลือชา', '18', '', NULL, '01', '02', '09', '46', NULL, 'GA0005382', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460902', 'สหัสขันธ์', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05383', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนสมบูรณ์', '18', '', NULL, '01', '01', '09', '46', '', 'GA0005383', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460901', 'ภูสิงห์', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05384', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนามะเขือ', '18', ' ', NULL, '01', '03', '09', '46', NULL, 'GA0005384', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460903', 'นามะเขือ', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05385', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโคกก่อง', '18', ' ', NULL, '04', '04', '09', '46', NULL, 'GA0005385', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460904', 'โนนศิลา', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05386', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านม่วงกุญชร ', '18', ' ', NULL, '06', '04', '09', '46', NULL, 'GA0005386', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460904', 'โนนศิลา', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05387', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตาดดงเค็ง', '18', ' ', NULL, '02', '05', '09', '46', NULL, 'GA0005387', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460905', 'นิคม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05388', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนแหลมทอง', '18', ' ', NULL, '10', '06', '09', '46', NULL, 'GA0005388', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460906', 'โนนแหลมทอง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05389', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนน้ำเกลี้ยง', '18', ' ', NULL, '01', '08', '09', '46', NULL, 'GA0005389', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460908', 'โนนน้ำเกลี้ยง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05390', 'สถานีอนามัยบ้านเก่าเดื่อ', '18', ' ', NULL, '06', '01', '10', '46', NULL, 'GA0005390', '0', '-', '', 1, '00000', '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', '-', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461001', 'ทุ่งคลอง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05391', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโพน', '18', ' ', NULL, '01', '02', '10', '46', NULL, 'GA0005391', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461002', 'โพน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05392', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดินจี่', '18', ' ', NULL, '01', '05', '10', '46', NULL, 'GA0005392', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461005', 'ดินจี่', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05393', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาบอน', '18', ' ', NULL, '01', '06', '10', '46', NULL, 'GA0005393', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461006', 'นาบอน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05394', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาตาล', '18', ' ', NULL, '05', '07', '10', '46', NULL, 'GA0005394', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461007', 'นาทัน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05395', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดงสวนพัฒนา', '18', ' ', NULL, '07', '07', '10', '46', NULL, 'GA0005395', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461007', 'นาทัน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05396', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสูงเนิน', '18', ' ', NULL, '05', '09', '10', '46', NULL, 'GA0005396', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461009', 'เนินยาง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05397', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุงเก่า', '18', ' ', NULL, '08', '02', '11', '46', NULL, 'GA0005397', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461102', 'กุงเก่า', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05398', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านยางอุ้ม', '18', ' ', NULL, '01', '03', '11', '46', NULL, 'GA0005398', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461103', 'ยางอู้ม', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05399', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดจิก', '18', ' ', NULL, '01', '04', '11', '46', NULL, 'GA0005399', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461104', 'กุดจิก', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05400', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านแสนสุข', '18', '', NULL, '07', '04', '11', '46', NULL, 'GA0005400', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461104', 'กุดจิก', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05401', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแซง', '18', ' ', NULL, '11', '05', '11', '46', NULL, 'GA0005401', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461105', 'นาตาล', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05402', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดงกลาง', '18', '', NULL, '04', '06', '11', '46', NULL, 'GA0005402', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461106', 'ดงสมบูรณ์', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05403', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดงสมบูรณ์', '18', ' ', NULL, '05', '06', '11', '46', NULL, 'GA0005403', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461106', 'ดงสมบูรณ์', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05404', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำไฮ', '18', '', NULL, '08', '01', '12', '46', NULL, 'GA0005404', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461201', 'หนองกุงศรี', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05405', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัว', '18', ' ', NULL, '04', '02', '12', '46', NULL, 'GA0005405', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461202', 'หนองบัว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05406', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านห้วยยางดง', '18', '', NULL, '08', '03', '12', '46', NULL, 'GA0005406', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461203', 'โคกเครือ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05407', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองสรวง', '18', '', NULL, '01', '04', '12', '46', NULL, 'GA0005407', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461204', 'หนองสรวง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05408', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองไผ่', '18', ' ', NULL, '03', '05', '12', '46', NULL, 'GA0005408', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461205', 'เสาเล้า', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05409', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองชุมแสง', '18', '', NULL, '13', '06', '12', '46', NULL, 'GA0005409', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461206', 'หนองใหญ่', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05410', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านภูฮัง', '18', ' ', NULL, '03', '07', '12', '46', NULL, 'GA0005410', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461207', 'ดงมูล', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05411', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองกุงเผือก', '18', '', NULL, '03', '08', '12', '46', NULL, 'GA0005411', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461208', 'ลำหนองแสน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05412', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองหิน', '18', ' ', NULL, '01', '09', '12', '46', NULL, 'GA0005412', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461209', 'หนองหิน', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05413', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองบัวโดน', '18', '', NULL, '01', '01', '13', '46', NULL, 'GA0005413', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461301', 'สมเด็จ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05414', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสร้างแก้ว', '18', ' ', NULL, '03', '02', '13', '46', NULL, 'GA0005414', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461302', 'หนองแวง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05415', 'โรงพยาบาลส่งเสริมสุขภาพตำบลแซงบาดาล', '18', ' ', NULL, '01', '03', '13', '46', NULL, 'GA0005415', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461303', 'แซงบาดาล', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05416', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านมหาไชย ', '18', ' ', NULL, '01', '04', '13', '46', NULL, 'GA0005416', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461304', 'มหาไชย', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05417', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหมูม่น', '18', '', NULL, '02', '05', '13', '46', NULL, 'GA0005417', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461305', 'หมูม่น', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05418', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกอก', '18', ' ', NULL, '02', '06', '13', '46', NULL, 'GA0005418', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461306', 'ผาเสวย', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05419', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านขมิ้น', '18', ' ', NULL, '09', '06', '13', '46', NULL, 'GA0005419', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461306', 'ผาเสวย', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05420', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแสง', '18', ' ', NULL, '03', '07', '13', '46', NULL, 'GA0005420', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461307', 'ศรีสมเด็จ', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05421', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านบอน', '18', '', NULL, '08', '08', '13', '46', NULL, 'GA0005421', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461308', 'ลำห้วยหลัว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05422', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำบง', '18', ' ', NULL, '11', '01', '14', '46', NULL, 'GA0005422', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461401', 'คำบง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05423', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคงอุดม ', '18', ' ', NULL, '13', '01', '14', '46', NULL, 'GA0005423', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461401', 'คำบง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05424', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านไค้นุ่น', '18', NULL, NULL, '08', '02', '14', '46', NULL, 'GA0005424', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461402', 'ไค้นุ่น', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05425', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองอีบุตร', '18', ' ', NULL, '04', '04', '14', '46', NULL, 'GA0005425', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461404', 'หนองอีบุตร', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05426', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแซง', '18', NULL, NULL, '05', '01', '15', '46', NULL, 'GA0005426', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461501', 'สำราญ', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05427', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองแสง', '18', ' ', NULL, '02', '02', '15', '46', NULL, 'GA0005427', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461502', 'สำราญใต้', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05428', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองกุงน้อย', '18', NULL, NULL, '10', '02', '15', '46', NULL, 'GA0005428', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461502', 'สำราญใต้', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05429', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านคำสร้างเที่ยง', '18', ' ', NULL, '02', '03', '15', '46', NULL, 'GA0005429', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461503', 'คำสร้างเที่ยง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('05430', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองช้าง', '18', ' ', NULL, '02', '04', '15', '46', NULL, 'GA0005430', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461504', 'หนองช้าง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05431', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนาคู', '18', ' ', NULL, '01', '01', '16', '46', NULL, 'GA0005431', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461601', 'นาคู', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05432', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านจอมศรี', '18', ' ', NULL, '01', '02', '16', '46', NULL, 'GA0005432', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461602', 'สายนาวัง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05433', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านากระเดา', '18', ' ', NULL, '05', '02', '16', '46', NULL, 'GA0005433', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461602', 'สายนาวัง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05434', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโนนนาจาน', '18', NULL, NULL, '01', '03', '16', '46', NULL, 'GA0005434', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461603', 'โนนนาจาน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05435', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนางาม', '18', '', NULL, '03', '04', '16', '46', NULL, 'GA0005435', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461604', 'บ่อแก้ว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05436', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหว้านพัฒนา', '18', ' ', NULL, '05', '04', '16', '46', NULL, 'GA0005436', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461604', 'บ่อแก้ว', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05437', 'โรงพยาบาลส่งเสริมสุขภาพตำบลภูแล่นช้าง', '18', ' ', NULL, '01', '05', '16', '46', NULL, 'GA0005437', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461605', 'ภูแล่นช้าง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05438', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกุดครอง', '18', ' ', NULL, '08', '02', '17', '46', NULL, 'GA0005438', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461702', 'สะอาดไชยศรี', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05439', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสะอาดไชยศรี', '18', ' ', NULL, '03', '04', '17', '46', NULL, 'GA0005439', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461704', 'ม่วงนา', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05440', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดงเจริญ', '18', ' ', NULL, '11', '03', '17', '46', NULL, 'GA0005440', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461703', 'ดงพยุง', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05441', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านม่วงนา', '18', ' ', NULL, '08', '01', '17', '46', NULL, 'GA0005441', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461701', 'ดอนจาน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('05442', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านนาจำปา', '18', ' ', NULL, '08', '05', '17', '46', NULL, 'GA0005442', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461705', 'นาจำปา', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('10709', 'โรงพยาบาลกาฬสินธุ์', '06', 'ถนนกาฬสินธุ์   ', NULL, '00', '01', '01', '46', '46000', 'EA0010709', '570', 'โรงพยาบาลทั่วไปขนาดใหญ่', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460101', 'กาฬสินธุ์', 535, '', 6, NULL);
INSERT INTO `chospital` VALUES ('11077', 'โรงพยาบาลนามน', '07', '183 ', NULL, '07', '01', '02', '46', NULL, 'EA0011077', '37', 'โรงพยาบาลชุมชนขนาดกลาง', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4602', 'นามน', '460201', 'นามน', 37, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11078', 'โรงพยาบาลกมลาไสย', '07', '111  ถนนกมลาไสย-หนองแปน', NULL, '11', '01', '03', '46', NULL, 'EA0011078', '143', 'โรงพยาบาลชุมชนแม่ข่าย', '120', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460301', 'กมลาไสย', 143, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11079', 'โรงพยาบาลร่องคำ', '07', '101', NULL, '01', '01', '04', '46', NULL, 'EA0011079', '30', 'โรงพยาบาลชุมชนขนาดกลาง', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4604', 'ร่องคำ', '460401', 'ร่องคำ', 30, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11080', 'โรงพยาบาลเขาวง', '07', '249 ', NULL, '16', '01', '06', '46', NULL, 'EA0011080', '88', 'โรงพยาบาลชุมชนขนาดกลาง', '90', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4606', 'เขาวง', '460601', 'คุ้มเก่า', 88, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11081', 'โรงพยาบาลยางตลาด', '07', '87 ', NULL, '20', '01', '07', '46', NULL, 'EA0011081', '162', 'โรงพยาบาลชุมชนแม่ข่าย', '120', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4607', 'ยางตลาด', '460701', 'ยางตลาด', 162, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11082', 'โรงพยาบาลห้วยเม็ก', '07', '155 ', NULL, '04', '01', '08', '46', NULL, 'EA0011082', '58', 'โรงพยาบาลชุมชนขนาดกลาง', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460801', 'ห้วยเม็ก', 57, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11083', 'โรงพยาบาลสหัสขันธ์', '07', '48', NULL, '10', '07', '09', '46', NULL, 'EA0011083', '40', 'โรงพยาบาลชุมชนขนาดกลาง', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4609', 'สหัสขันธ์', '460907', 'โนนบุรี', 40, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11084', 'โรงพยาบาลคำม่วง', '07', '92 ', NULL, '10', '01', '10', '46', NULL, 'EA0011084', '81', 'โรงพยาบาลชุมชนขนาดกลาง', '60', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4610', 'คำม่วง', '461001', 'ทุ่งคลอง', 71, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11085', 'โรงพยาบาลท่าคันโท', '07', '183 ', NULL, '01', '05', '11', '46', NULL, 'EA0011085', '60', 'โรงพยาบาลชุมชนขนาดกลาง', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4611', 'ท่าคันโท', '461105', 'นาตาล', 56, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11086', 'โรงพยาบาลหนองกุงศรี', '07', '148 ', NULL, '02', '01', '12', '46', NULL, 'EA0011086', '80', 'โรงพยาบาลชุมชนขนาดใหญ่', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4612', 'หนองกุงศรี', '461201', 'หนองกุงศรี', 67, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11087', 'โรงพยาบาลสมเด็จ', '07', '398 ', NULL, '02', '01', '13', '46', NULL, 'EA0011087', '114', 'โรงพยาบาลชุมชนแม่ข่าย', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4613', 'สมเด็จ', '461301', 'สมเด็จ', 114, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11088', 'โรงพยาบาลห้วยผึ้ง', '07', '177', NULL, '08', '03', '14', '46', NULL, 'EA0011088', '34', 'โรงพยาบาลชุมชนขนาดกลาง', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461403', 'นิคมห้วยผึ้ง', 34, '', 7, NULL);
INSERT INTO `chospital` VALUES ('11449', 'โรงพยาบาลสมเด็จพระยุพราชกุฉินารายณ์', '07', '19', NULL, '13', '01', '05', '46', NULL, 'EA0011449', '177', 'โรงพยาบาลชุมชนแม่ข่าย', '160', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4605', 'กุฉินารายณ์', '460501', 'บัวขาว', 177, '', 7, NULL);
INSERT INTO `chospital` VALUES ('13963', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดงเมือง', '18', ' ', NULL, '13', '06', '01', '46', NULL, 'GA0013963', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460106', 'ลำพาน', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('13964', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านสวนโคก', '18', ' ', NULL, '13', '04', '03', '46', NULL, 'GA0013964', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4603', 'กมลาไสย', '460304', 'ดงลิง', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('13966', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเหล่าสีแก้ว', '18', ' ', NULL, '05', '02', '14', '46', NULL, 'GA0013966', '0', '-', '', 1, NULL, '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', NULL, '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4614', 'ห้วยผึ้ง', '461402', 'ไค้นุ่น', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('14153', 'สำนักงานสาธารณสุขอำเภอฆ้องชัย', '02', '', NULL, '07', '01', '18', '46', NULL, 'BA0014153', '0', '-', '', 0, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461801', 'ฆ้องชัยพัฒนา', NULL, '', 2, NULL);
INSERT INTO `chospital` VALUES ('14284', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหาดทรายมูล', '18', '', NULL, '05', '06', '08', '46', NULL, 'GA0014284', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4608', 'ห้วยเม็ก', '460806', 'พิมูล', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('14347', 'ศูนย์บริการสาธารณสุขเทศบาลเมืองกาฬสินธุ์แห่งที่ 1 (ซอยน้ำทิพย์)', '21', 'ถ.อนรรฆนาค', NULL, '00', '01', '01', '46', NULL, 'GA0014347', '0', '-', '', 1, '00000', '', NULL, '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', '-', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460101', 'กาฬสินธุ์', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('23219', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแวงแสน', '18', NULL, NULL, '02', '05', '17', '46', NULL, 'GA0023219', '0', '-', '', 1, '21002', '', NULL, '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461705', 'นาจำปา', NULL, '', 18, NULL);
INSERT INTO `chospital` VALUES ('24743', 'ศูนย์บริการสาธารณสุขเทศบาลเมืองกาฬสินธุแห่งที่ 2 (ดงปอ)', '21', 'ถ.บายพาส-ดงปอ', NULL, '00', '01', '01', '46', '46000', 'GA0024743', NULL, '-', '', 1, '00000', '', '2011-06-01', '75000', 1, 'องค์กรปกครองส่วนท้องถิ่น', '-', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460101', 'กาฬสินธุ์', NULL, '', 21, NULL);
INSERT INTO `chospital` VALUES ('28017', 'โรงพยาบาลนาคู', '07', '319', NULL, '09', '01', '16', '46', '46160', 'EA0028017', '41', 'โรงพยาบาลชุมชนขนาดกลาง', '30', 1, '21002', '', '2013-06-03', '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4616', 'นาคู', '461601', 'นาคู', 41, '', 7, NULL);
INSERT INTO `chospital` VALUES ('28789', 'โรงพยาบาลฆ้องชัย', '07', NULL, NULL, '11', '01', '18', '46', '46130', 'EA0028789', '30', 'โรงพยาบาลชุมชนขนาดเล็ก', '10', 1, '21002', '', '2013-08-15', '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4618', 'ฆ้องชัย', '461801', 'ฆ้องชัยพัฒนา', 30, '', 7, NULL);
INSERT INTO `chospital` VALUES ('28790', 'โรงพยาบาลดอนจาน', '07', NULL, NULL, '06', '02', '17', '46', '46000', 'EA0028790', '14', 'โรงพยาบาลชุมชนขนาดเล็ก', '30', 1, '21002', '', '2013-08-15', '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4617', 'ดอนจาน', '461702', 'สะอาดไชยศรี', 14, '', 7, NULL);
INSERT INTO `chospital` VALUES ('28791', 'โรงพยาบาลสามชัย', '07', NULL, NULL, '04', '01', '15', '46', NULL, 'EA0028791', '30', 'โรงพยาบาลชุมชนขนาดกลาง', '30', 1, '21002', '', '2013-09-02', '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4615', 'สามชัย', '461501', 'สำราญ', 30, '', 7, NULL);
INSERT INTO `chospital` VALUES ('77738', 'ศูนย์สุขภาพชุมชนเมืองโรงพยาบาลกาฬสินธุ์', '08', ' เลขที่ 1 ถ.1155', NULL, '01', '01', '01', '46', '46000', 'GA0077738', NULL, '-', '', 1, '21002', '', '2012-03-13', '21000', 1, 'กระทรวงสาธารณสุข', 'สำนักงานปลัดกระทรวงสาธารณสุข', '07', 'เขตสุขภาพที่ 7', '46', 'กาฬสินธุ์', '4601', 'เมืองกาฬสินธุ์', '460101', 'กาฬสินธุ์', NULL, '', 8, NULL);

-- ----------------------------
-- Table structure for croles
-- ----------------------------
DROP TABLE IF EXISTS `croles`;
CREATE TABLE `croles`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสสิทธิ์ (PK)',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อสิทธิ์ (System Name)',
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อสิทธิ์ที่แสดงผล (Display Name)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลสิทธิ์การใช้งาน (Roles)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of croles
-- ----------------------------
INSERT INTO `croles` VALUES (1, 'ADMIN', 'ผู้ดูแลระบบ');
INSERT INTO `croles` VALUES (2, 'Primary Responsible', 'ผู้รับผิดชอบหลัก');
INSERT INTO `croles` VALUES (3, 'Indicator Owner', 'ผู้รับผิดชอบตัวชี้วัด');

-- ----------------------------
-- Table structure for csub_excellence
-- ----------------------------
DROP TABLE IF EXISTS `csub_excellence`;
CREATE TABLE `csub_excellence`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'รหัสลำดับ (PK)',
  `ex_id` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัส Excellence หลัก (FK)',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสย่อยที่แสดงผล (เช่น 1.1, 1.2)',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อประเด็นย่อย',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sub_ex`(`ex_id` ASC) USING BTREE,
  CONSTRAINT `fk_sub_ex_main` FOREIGN KEY (`ex_id`) REFERENCES `cexcellence` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลประเด็นย่อยภายใต้ Excellence' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csub_excellence
-- ----------------------------
INSERT INTO `csub_excellence` VALUES (1, '01', '1.1', 'ด้านส่งเสริมสุขภาพ');
INSERT INTO `csub_excellence` VALUES (2, '01', '1.2', 'ด้านความรอบรู้ด้านสุขภาพ');
INSERT INTO `csub_excellence` VALUES (3, '01', '1.3', 'ด้านป้องกันควบคุมโรค');
INSERT INTO `csub_excellence` VALUES (4, '01', '1.4', 'ด้านการบริหารจัดการสิ่งแวดล้อม');
INSERT INTO `csub_excellence` VALUES (5, '02', '2.1', 'ด้านลดป่วย');
INSERT INTO `csub_excellence` VALUES (6, '02', '2.2', 'ด้านลดตาย');
INSERT INTO `csub_excellence` VALUES (7, '02', '2.3', 'ด้านลดรอคอย');
INSERT INTO `csub_excellence` VALUES (8, '02', '2.4', 'ด้านเพิ่มการเข้าถึงบริการ');
INSERT INTO `csub_excellence` VALUES (9, '02', '2.5', 'ด้านระบบบริการสุขภาพจิตและยาเสพติด');
INSERT INTO `csub_excellence` VALUES (10, '03', '3.1', 'บุคลากรเป็นเลิศ');
INSERT INTO `csub_excellence` VALUES (11, '04', '4.1', 'บริหารเป็นเลิศด้วยธรรมาภิบาล');
INSERT INTO `csub_excellence` VALUES (12, '05', '5.1', 'เศรษฐกิจสุขภาพเป็นเลิศ');

-- ----------------------------
-- Table structure for ctambon
-- ----------------------------
DROP TABLE IF EXISTS `ctambon`;
CREATE TABLE `ctambon`  (
  `tamboncodefull` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสตำบล 6 หลัก (PK)',
  `tambonname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อตำบล',
  `ampurcode` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสอำเภอ (FK)',
  `changwatcode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสจังหวัด',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT 'ละติจูด (Latitude)',
  `lon` decimal(10, 6) NULL DEFAULT NULL COMMENT 'ลองจิจูด (Longitude)',
  `zoom_lv` int NULL DEFAULT NULL COMMENT 'ระดับการซูมแผนที่เริ่มต้น',
  `flag_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'สถานะการใช้งาน (1=ใช้งาน, 0=ยกเลิก)',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูล',
  PRIMARY KEY (`tamboncodefull`) USING BTREE,
  INDEX `idx_ctambon_ampur`(`ampurcode` ASC) USING BTREE,
  CONSTRAINT `fk_ctambon_campur` FOREIGN KEY (`ampurcode`) REFERENCES `campur` (`ampurcodefull`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลตำบล' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ctambon
-- ----------------------------
INSERT INTO `ctambon` VALUES ('460101', 'กาฬสินธุ์', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460102', 'เหนือ', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460103', 'หลุบ', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460104', 'ไผ่', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460105', 'ลำปาว', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460106', 'ลำพาน', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460107', 'เชียงเครือ', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460108', 'บึงวิชัย', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460109', 'ห้วยโพธิ์', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460111', 'ภูปอ', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460113', 'ภูดิน', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460115', 'หนองกุง', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460116', 'กลางหมื่น', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460117', 'ขมิ้น', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460119', 'โพนทอง', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460120', 'นาจารย์', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460121', 'ลำคลอง', '4601', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460201', 'นามน', '4602', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460202', 'ยอดแกง', '4602', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460203', 'สงเปลือย', '4602', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460204', 'หลักเหลี่ยม', '4602', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460205', 'หนองบัว', '4602', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460301', 'กมลาไสย', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460302', 'หลักเมือง', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460303', 'โพนงาม', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460304', 'ดงลิง', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460305', 'ธัญญา', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460308', 'หนองแปน', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460310', 'เจ้าท่า', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460311', 'โคกสมบูรณ์', '4603', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460401', 'ร่องคำ', '4604', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460402', 'สามัคคี', '4604', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460403', 'เหล่าอ้อย', '4604', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460501', 'บัวขาว', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460502', 'แจนแลน', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460503', 'เหล่าใหญ่', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460504', 'จุมจัง', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460505', 'เหล่าไฮงาม', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460506', 'กุดหว้า', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460507', 'สามขา', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460508', 'นาขาม', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460509', 'หนองห้าง', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460510', 'นาโก', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460511', 'สมสะอาด', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460512', 'กุดค้าว', '4605', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460601', 'คุ้มเก่า', '4606', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460602', 'สงเปลือย', '4606', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460603', 'หนองผือ', '4606', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460606', 'กุดสิมคุ้มใหม่', '4606', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460608', 'สระพังทอง', '4606', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460611', 'กุดปลาค้าว', '4606', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460701', 'ยางตลาด', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460702', 'หัวงัว', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460703', 'อุ่มเม่า', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460704', 'บัวบาน', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460705', 'เว่อ', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460706', 'อิตื้อ', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460707', 'หัวนาคำ', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460708', 'หนองอิเฒ่า', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460709', 'ดอนสมบูรณ์', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460710', 'นาเชือก', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460711', 'คลองขาม', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460712', 'เขาพระนอน', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460713', 'นาดี', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460714', 'โนนสูง', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460715', 'หนองตอกแป้น', '4607', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460801', 'ห้วยเม็ก', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460802', 'คำใหญ่', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460803', 'กุดโดน', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460804', 'บึงนาเรียง', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460805', 'หัวหิน', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460806', 'พิมูล', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460807', 'คำเหมือดแก้ว', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460808', 'โนนสะอาด', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460809', 'ทรายทอง', '4608', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460901', 'ภูสิงห์', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460902', 'สหัสขันธ์', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460903', 'นามะเขือ', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460904', 'โนนศิลา', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460905', 'นิคม', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460906', 'โนนแหลมทอง', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460907', 'โนนบุรี', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('460908', 'โนนน้ำเกลี้ยง', '4609', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461001', 'ทุ่งคลอง', '4610', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461002', 'โพน', '4610', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461005', 'ดินจี่', '4610', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461006', 'นาบอน', '4610', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461007', 'นาทัน', '4610', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461009', 'เนินยาง', '4610', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461101', 'ท่าคันโท', '4611', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461102', 'กุงเก่า', '4611', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461103', 'ยางอู้ม', '4611', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461104', 'กุดจิก', '4611', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461105', 'นาตาล', '4611', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461106', 'ดงสมบูรณ์', '4611', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461201', 'หนองกุงศรี', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461202', 'หนองบัว', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461203', 'โคกเครือ', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461204', 'หนองสรวง', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461205', 'เสาเล้า', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461206', 'หนองใหญ่', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461207', 'ดงมูล', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461208', 'ลำหนองแสน', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461209', 'หนองหิน', '4612', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461301', 'สมเด็จ', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461302', 'หนองแวง', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461303', 'แซงบาดาล', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461304', 'มหาไชย', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461305', 'หมูม่น', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461306', 'ผาเสวย', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461307', 'ศรีสมเด็จ', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461308', 'ลำห้วยหลัว', '4613', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461401', 'คำบง', '4614', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461402', 'ไค้นุ่น', '4614', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461403', 'นิคมห้วยผึ้ง', '4614', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461404', 'หนองอีบุตร', '4614', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461501', 'สำราญ', '4615', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461502', 'สำราญใต้', '4615', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461503', 'คำสร้างเที่ยง', '4615', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461504', 'หนองช้าง', '4615', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461601', 'นาคู', '4616', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461602', 'สายนาวัง', '4616', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461603', 'โนนนาจาน', '4616', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461604', 'บ่อแก้ว', '4616', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461605', 'ภูแล่นช้าง', '4616', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461701', 'ดอนจาน', '4617', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461702', 'สะอาดไชยศรี', '4617', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461703', 'ดงพยุง', '4617', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461704', 'ม่วงนา', '4617', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461705', 'นาจำปา', '4617', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461801', 'ฆ้องชัยพัฒนา', '4618', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461802', 'เหล่ากลาง', '4618', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461803', 'โคกสะอาด', '4618', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461804', 'โนนศิลาเลิง', '4618', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');
INSERT INTO `ctambon` VALUES ('461805', 'ลำชี', '4618', '46', NULL, NULL, NULL, '0', '2025-08-14 10:08:46');

-- ----------------------------
-- Table structure for cworkgroups
-- ----------------------------
DROP TABLE IF EXISTS `cworkgroups`;
CREATE TABLE `cworkgroups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'รหัสกลุ่มงาน (PK)',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อกลุ่มงาน',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูล',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลกลุ่มงาน' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cworkgroups
-- ----------------------------
INSERT INTO `cworkgroups` VALUES (1, 'บริหารทั่วไป', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (2, 'พัฒนายุทธศาสตร์สาธารณสุข', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (3, 'ประกันสุขภาพ', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (4, 'พัฒนาคุณภาพและรูปแบบบริการ', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (5, 'ส่งเสริมสุขภาพ', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (6, 'ควบคุมโรคติดต่อ', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (7, 'การแพทย์แผนไทยและการแพทย์ทางเลือก', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (8, 'ควบคุมโรคไม่ติดต่อ ยาเสพติดและสุขภาพจิต', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (9, 'คุ้มครองผู้บริโภคและเภสัชสาธารณสุข', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (10, 'บริหารทรัพยากรบุคคล', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (11, 'กฎหมาย', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (12, 'อนามัยสิ่งแวดล้อม', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (13, 'ปฐมภูมิและเครือข่ายสุขภาพ', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (14, 'ทันตสาธารณสุข', '2025-09-16 14:59:44');
INSERT INTO `cworkgroups` VALUES (15, 'สุขภาพดิจิทัล', '2025-09-16 14:59:44');

-- ----------------------------
-- Table structure for fiscal_years
-- ----------------------------
DROP TABLE IF EXISTS `fiscal_years`;
CREATE TABLE `fiscal_years`  (
  `id` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ปีงบประมาณ',
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `is_active` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลปีงบประมาณ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fiscal_years
-- ----------------------------
INSERT INTO `fiscal_years` VALUES ('2568', '2024-10-01', '2025-09-30', 'N');
INSERT INTO `fiscal_years` VALUES ('2569', '2025-10-01', '2026-09-30', 'Y');

-- ----------------------------
-- Table structure for indicator_assignees
-- ----------------------------
DROP TABLE IF EXISTS `indicator_assignees`;
CREATE TABLE `indicator_assignees`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `indicator_id` int UNSIGNED NOT NULL COMMENT 'รหัสตัวชี้วัด (FK)',
  `user_id` int NOT NULL COMMENT 'รหัสผู้ใช้งาน (FK)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_assign`(`indicator_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `fk_assign_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_assign_ind` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_assign_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ตารางระบุผู้รับผิดชอบตัวชี้วัดรายบุคคล' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of indicator_assignees
-- ----------------------------
INSERT INTO `indicator_assignees` VALUES (1, 1, 1, '2026-01-14 09:51:35');
INSERT INTO `indicator_assignees` VALUES (2, 1, 2, '2026-01-14 09:51:35');
INSERT INTO `indicator_assignees` VALUES (3, 2, 1, '2026-01-14 09:51:35');
INSERT INTO `indicator_assignees` VALUES (4, 2, 2, '2026-01-14 09:51:35');
INSERT INTO `indicator_assignees` VALUES (5, 3, 1, '2026-01-14 09:51:35');
INSERT INTO `indicator_assignees` VALUES (6, 3, 2, '2026-01-14 09:51:35');
INSERT INTO `indicator_assignees` VALUES (7, 4, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (8, 4, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (9, 5, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (10, 5, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (11, 6, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (12, 6, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (13, 7, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (14, 7, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (15, 8, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (16, 8, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (17, 9, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (18, 9, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (19, 10, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (20, 10, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (21, 11, 1, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (22, 11, 2, '2026-01-14 09:52:14');
INSERT INTO `indicator_assignees` VALUES (23, 12, 1, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (24, 12, 2, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (25, 13, 1, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (26, 13, 2, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (27, 14, 1, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (28, 14, 2, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (29, 15, 1, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (30, 15, 2, '2026-01-14 09:53:08');
INSERT INTO `indicator_assignees` VALUES (31, 16, 1, '2026-01-14 09:53:56');
INSERT INTO `indicator_assignees` VALUES (32, 16, 2, '2026-01-14 09:53:56');
INSERT INTO `indicator_assignees` VALUES (33, 17, 1, '2026-01-14 09:54:35');
INSERT INTO `indicator_assignees` VALUES (34, 17, 2, '2026-01-14 09:54:35');
INSERT INTO `indicator_assignees` VALUES (35, 18, 1, '2026-01-14 09:54:35');
INSERT INTO `indicator_assignees` VALUES (36, 18, 2, '2026-01-14 09:54:35');
INSERT INTO `indicator_assignees` VALUES (37, 19, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (38, 19, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (39, 20, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (40, 20, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (41, 21, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (42, 21, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (43, 22, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (44, 22, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (45, 23, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (46, 23, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (47, 24, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (48, 24, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (49, 25, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (50, 25, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (51, 26, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (52, 26, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (53, 27, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (54, 27, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (55, 28, 1, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (56, 28, 2, '2026-01-14 09:55:29');
INSERT INTO `indicator_assignees` VALUES (57, 29, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (58, 29, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (59, 30, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (60, 30, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (61, 31, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (62, 31, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (63, 32, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (64, 32, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (65, 33, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (66, 33, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (67, 34, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (68, 34, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (69, 35, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (70, 35, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (71, 36, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (72, 36, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (73, 37, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (74, 37, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (75, 38, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (76, 38, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (77, 39, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (78, 39, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (79, 40, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (80, 40, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (81, 41, 1, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (82, 41, 2, '2026-01-14 09:56:38');
INSERT INTO `indicator_assignees` VALUES (89, 1, 3, '2026-01-14 11:48:38');
INSERT INTO `indicator_assignees` VALUES (90, 2, 3, '2026-01-14 11:48:39');
INSERT INTO `indicator_assignees` VALUES (91, 3, 3, '2026-01-14 11:48:39');
INSERT INTO `indicator_assignees` VALUES (92, 4, 3, '2026-01-14 11:48:41');
INSERT INTO `indicator_assignees` VALUES (93, 5, 3, '2026-01-14 11:48:42');
INSERT INTO `indicator_assignees` VALUES (94, 6, 3, '2026-01-14 11:48:42');
INSERT INTO `indicator_assignees` VALUES (95, 7, 3, '2026-01-14 11:48:43');
INSERT INTO `indicator_assignees` VALUES (96, 8, 3, '2026-01-14 11:48:44');
INSERT INTO `indicator_assignees` VALUES (97, 9, 3, '2026-01-14 11:48:45');
INSERT INTO `indicator_assignees` VALUES (98, 10, 3, '2026-01-14 11:48:45');
INSERT INTO `indicator_assignees` VALUES (99, 11, 3, '2026-01-14 11:48:46');
INSERT INTO `indicator_assignees` VALUES (100, 12, 3, '2026-01-14 11:48:47');
INSERT INTO `indicator_assignees` VALUES (101, 13, 3, '2026-01-14 11:48:48');
INSERT INTO `indicator_assignees` VALUES (102, 14, 3, '2026-01-14 11:48:48');
INSERT INTO `indicator_assignees` VALUES (103, 15, 3, '2026-01-14 11:48:49');
INSERT INTO `indicator_assignees` VALUES (104, 16, 3, '2026-01-14 11:48:50');
INSERT INTO `indicator_assignees` VALUES (105, 17, 3, '2026-01-14 11:48:51');
INSERT INTO `indicator_assignees` VALUES (106, 18, 3, '2026-01-14 11:48:52');
INSERT INTO `indicator_assignees` VALUES (107, 19, 3, '2026-01-14 11:48:52');
INSERT INTO `indicator_assignees` VALUES (108, 20, 3, '2026-01-14 11:48:53');
INSERT INTO `indicator_assignees` VALUES (109, 21, 3, '2026-01-14 11:48:54');
INSERT INTO `indicator_assignees` VALUES (110, 22, 3, '2026-01-14 11:48:55');
INSERT INTO `indicator_assignees` VALUES (111, 23, 3, '2026-01-14 11:48:56');
INSERT INTO `indicator_assignees` VALUES (112, 24, 3, '2026-01-14 11:48:57');
INSERT INTO `indicator_assignees` VALUES (113, 25, 3, '2026-01-14 11:48:57');
INSERT INTO `indicator_assignees` VALUES (114, 26, 3, '2026-01-14 11:48:58');
INSERT INTO `indicator_assignees` VALUES (115, 27, 3, '2026-01-14 11:48:59');
INSERT INTO `indicator_assignees` VALUES (116, 28, 3, '2026-01-14 11:49:00');
INSERT INTO `indicator_assignees` VALUES (117, 29, 3, '2026-01-14 11:49:00');
INSERT INTO `indicator_assignees` VALUES (118, 30, 3, '2026-01-14 11:49:01');
INSERT INTO `indicator_assignees` VALUES (119, 31, 3, '2026-01-14 11:49:01');
INSERT INTO `indicator_assignees` VALUES (120, 32, 3, '2026-01-14 11:49:03');
INSERT INTO `indicator_assignees` VALUES (121, 33, 3, '2026-01-14 11:51:34');
INSERT INTO `indicator_assignees` VALUES (122, 34, 3, '2026-01-14 11:51:36');
INSERT INTO `indicator_assignees` VALUES (123, 35, 3, '2026-01-14 11:51:36');
INSERT INTO `indicator_assignees` VALUES (124, 36, 3, '2026-01-14 11:51:38');
INSERT INTO `indicator_assignees` VALUES (125, 37, 3, '2026-01-14 11:51:38');
INSERT INTO `indicator_assignees` VALUES (126, 38, 3, '2026-01-14 11:51:39');
INSERT INTO `indicator_assignees` VALUES (127, 39, 3, '2026-01-14 11:51:40');
INSERT INTO `indicator_assignees` VALUES (128, 40, 3, '2026-01-14 11:51:40');
INSERT INTO `indicator_assignees` VALUES (129, 41, 3, '2026-01-14 11:51:41');
INSERT INTO `indicator_assignees` VALUES (130, 36, 8, '2026-01-23 09:45:41');
INSERT INTO `indicator_assignees` VALUES (132, 30, 6, '2026-01-23 09:49:20');
INSERT INTO `indicator_assignees` VALUES (136, 29, 7, '2026-01-23 11:44:17');
INSERT INTO `indicator_assignees` VALUES (138, 27, 9, '2026-01-23 12:57:21');
INSERT INTO `indicator_assignees` VALUES (139, 12, 9, '2026-01-23 12:57:33');
INSERT INTO `indicator_assignees` VALUES (142, 35, 14, '2026-01-23 16:10:56');
INSERT INTO `indicator_assignees` VALUES (143, 31, 15, '2026-01-23 16:12:53');
INSERT INTO `indicator_assignees` VALUES (144, 32, 15, '2026-01-23 16:12:58');
INSERT INTO `indicator_assignees` VALUES (145, 33, 15, '2026-01-23 16:13:02');
INSERT INTO `indicator_assignees` VALUES (146, 34, 15, '2026-01-23 16:13:04');
INSERT INTO `indicator_assignees` VALUES (148, 6, 19, '2026-01-25 20:14:25');
INSERT INTO `indicator_assignees` VALUES (150, 17, 10, '2026-01-26 08:58:55');
INSERT INTO `indicator_assignees` VALUES (151, 16, 10, '2026-01-26 09:01:46');
INSERT INTO `indicator_assignees` VALUES (152, 7, 16, '2026-01-26 09:22:11');
INSERT INTO `indicator_assignees` VALUES (153, 8, 16, '2026-01-26 09:22:12');
INSERT INTO `indicator_assignees` VALUES (154, 9, 16, '2026-01-26 09:22:13');
INSERT INTO `indicator_assignees` VALUES (155, 10, 16, '2026-01-26 09:22:14');
INSERT INTO `indicator_assignees` VALUES (156, 20, 16, '2026-01-26 09:22:30');
INSERT INTO `indicator_assignees` VALUES (157, 21, 16, '2026-01-26 09:22:32');
INSERT INTO `indicator_assignees` VALUES (158, 23, 16, '2026-01-26 09:22:41');
INSERT INTO `indicator_assignees` VALUES (159, 24, 16, '2026-01-26 09:22:43');
INSERT INTO `indicator_assignees` VALUES (160, 25, 16, '2026-01-26 09:22:46');
INSERT INTO `indicator_assignees` VALUES (161, 26, 16, '2026-01-26 09:22:48');
INSERT INTO `indicator_assignees` VALUES (162, 33, 16, '2026-01-26 09:23:13');
INSERT INTO `indicator_assignees` VALUES (163, 34, 16, '2026-01-26 09:23:20');
INSERT INTO `indicator_assignees` VALUES (164, 31, 16, '2026-01-26 09:23:42');
INSERT INTO `indicator_assignees` VALUES (165, 12, 16, '2026-01-26 09:24:07');
INSERT INTO `indicator_assignees` VALUES (166, 15, 16, '2026-01-26 09:24:12');
INSERT INTO `indicator_assignees` VALUES (167, 27, 16, '2026-01-26 09:24:22');
INSERT INTO `indicator_assignees` VALUES (168, 1, 16, '2026-01-26 09:29:43');
INSERT INTO `indicator_assignees` VALUES (169, 5, 5, '2026-01-26 13:26:40');
INSERT INTO `indicator_assignees` VALUES (170, 11, 25, '2026-01-26 15:29:11');
INSERT INTO `indicator_assignees` VALUES (190, 1, 26, '2026-01-26 15:46:25');
INSERT INTO `indicator_assignees` VALUES (193, 2, 24, '2026-01-26 15:58:29');
INSERT INTO `indicator_assignees` VALUES (197, 5, 13, '2026-01-26 16:38:49');
INSERT INTO `indicator_assignees` VALUES (198, 7, 17, '2026-01-27 09:27:49');
INSERT INTO `indicator_assignees` VALUES (199, 8, 17, '2026-01-27 09:27:49');
INSERT INTO `indicator_assignees` VALUES (200, 9, 17, '2026-01-27 09:27:53');
INSERT INTO `indicator_assignees` VALUES (201, 10, 17, '2026-01-27 09:27:54');
INSERT INTO `indicator_assignees` VALUES (202, 13, 29, '2026-01-27 10:09:31');
INSERT INTO `indicator_assignees` VALUES (208, 6, 29, '2026-01-27 16:14:10');
INSERT INTO `indicator_assignees` VALUES (211, 22, 26, '2026-01-28 13:48:30');
INSERT INTO `indicator_assignees` VALUES (212, 18, 26, '2026-01-28 13:48:35');
INSERT INTO `indicator_assignees` VALUES (226, 21, 12, '2026-01-29 13:48:02');
INSERT INTO `indicator_assignees` VALUES (229, 41, 21, '2026-01-30 11:04:58');
INSERT INTO `indicator_assignees` VALUES (230, 40, 21, '2026-01-30 12:06:28');
INSERT INTO `indicator_assignees` VALUES (231, 39, 21, '2026-01-30 12:06:30');
INSERT INTO `indicator_assignees` VALUES (232, 40, 20, '2026-01-30 13:00:22');
INSERT INTO `indicator_assignees` VALUES (237, 28, 32, '2026-01-30 16:07:38');
INSERT INTO `indicator_assignees` VALUES (238, 39, 20, '2026-01-30 19:11:22');
INSERT INTO `indicator_assignees` VALUES (239, 28, 13, '2026-01-31 17:01:05');
INSERT INTO `indicator_assignees` VALUES (243, 1, 30, '2026-02-02 15:56:24');
INSERT INTO `indicator_assignees` VALUES (245, 3, 30, '2026-02-02 15:56:27');
INSERT INTO `indicator_assignees` VALUES (246, 4, 30, '2026-02-02 15:56:28');
INSERT INTO `indicator_assignees` VALUES (247, 5, 30, '2026-02-02 15:56:28');
INSERT INTO `indicator_assignees` VALUES (248, 6, 30, '2026-02-02 15:56:29');
INSERT INTO `indicator_assignees` VALUES (249, 7, 30, '2026-02-02 15:56:29');
INSERT INTO `indicator_assignees` VALUES (250, 8, 30, '2026-02-02 15:56:31');
INSERT INTO `indicator_assignees` VALUES (251, 9, 30, '2026-02-02 15:56:31');
INSERT INTO `indicator_assignees` VALUES (252, 10, 30, '2026-02-02 15:56:32');
INSERT INTO `indicator_assignees` VALUES (253, 11, 30, '2026-02-02 15:56:32');
INSERT INTO `indicator_assignees` VALUES (254, 12, 30, '2026-02-02 15:56:34');
INSERT INTO `indicator_assignees` VALUES (255, 14, 30, '2026-02-02 15:56:35');
INSERT INTO `indicator_assignees` VALUES (256, 15, 30, '2026-02-02 15:56:36');
INSERT INTO `indicator_assignees` VALUES (257, 16, 30, '2026-02-02 15:56:36');
INSERT INTO `indicator_assignees` VALUES (258, 17, 30, '2026-02-02 15:56:37');
INSERT INTO `indicator_assignees` VALUES (259, 18, 30, '2026-02-02 15:56:37');
INSERT INTO `indicator_assignees` VALUES (260, 19, 30, '2026-02-02 15:56:39');
INSERT INTO `indicator_assignees` VALUES (261, 20, 30, '2026-02-02 15:56:39');
INSERT INTO `indicator_assignees` VALUES (262, 21, 30, '2026-02-02 15:56:40');
INSERT INTO `indicator_assignees` VALUES (263, 22, 30, '2026-02-02 15:56:42');
INSERT INTO `indicator_assignees` VALUES (264, 23, 30, '2026-02-02 15:56:42');
INSERT INTO `indicator_assignees` VALUES (265, 24, 30, '2026-02-02 15:56:43');
INSERT INTO `indicator_assignees` VALUES (266, 25, 30, '2026-02-02 15:56:43');
INSERT INTO `indicator_assignees` VALUES (267, 26, 30, '2026-02-02 15:56:45');
INSERT INTO `indicator_assignees` VALUES (268, 27, 30, '2026-02-02 15:56:46');
INSERT INTO `indicator_assignees` VALUES (269, 28, 30, '2026-02-02 15:56:46');
INSERT INTO `indicator_assignees` VALUES (270, 29, 30, '2026-02-02 15:56:47');
INSERT INTO `indicator_assignees` VALUES (271, 30, 30, '2026-02-02 15:56:48');
INSERT INTO `indicator_assignees` VALUES (272, 31, 30, '2026-02-02 15:56:48');
INSERT INTO `indicator_assignees` VALUES (273, 32, 30, '2026-02-02 15:56:49');
INSERT INTO `indicator_assignees` VALUES (274, 33, 30, '2026-02-02 15:56:50');
INSERT INTO `indicator_assignees` VALUES (275, 34, 30, '2026-02-02 15:56:51');
INSERT INTO `indicator_assignees` VALUES (276, 35, 30, '2026-02-02 15:56:51');
INSERT INTO `indicator_assignees` VALUES (277, 36, 30, '2026-02-02 15:56:53');
INSERT INTO `indicator_assignees` VALUES (278, 37, 30, '2026-02-02 15:56:53');
INSERT INTO `indicator_assignees` VALUES (279, 38, 30, '2026-02-02 15:56:54');
INSERT INTO `indicator_assignees` VALUES (280, 39, 30, '2026-02-02 15:56:55');
INSERT INTO `indicator_assignees` VALUES (281, 40, 30, '2026-02-02 15:56:56');
INSERT INTO `indicator_assignees` VALUES (282, 41, 30, '2026-02-02 15:56:57');
INSERT INTO `indicator_assignees` VALUES (283, 13, 30, '2026-02-03 10:48:14');
INSERT INTO `indicator_assignees` VALUES (287, 37, 23, '2026-02-03 18:24:41');
INSERT INTO `indicator_assignees` VALUES (290, 38, 35, '2026-02-10 10:00:01');
INSERT INTO `indicator_assignees` VALUES (291, 2, 30, '2026-02-11 10:02:53');
INSERT INTO `indicator_assignees` VALUES (292, 3, 24, '2026-02-13 13:30:58');
INSERT INTO `indicator_assignees` VALUES (295, 37, 28, '2026-02-15 18:02:48');
INSERT INTO `indicator_assignees` VALUES (296, 14, 41, '2026-02-17 10:25:39');
INSERT INTO `indicator_assignees` VALUES (297, 28, 8, '2026-02-17 10:33:51');
INSERT INTO `indicator_assignees` VALUES (298, 33, 8, '2026-02-17 10:34:07');
INSERT INTO `indicator_assignees` VALUES (299, 30, 8, '2026-02-17 14:08:05');
INSERT INTO `indicator_assignees` VALUES (303, 4, 11, '2026-02-24 14:13:20');
INSERT INTO `indicator_assignees` VALUES (306, 29, 8, '2026-02-26 14:57:01');
INSERT INTO `indicator_assignees` VALUES (307, 36, 45, '2026-02-27 09:44:02');

-- ----------------------------
-- Table structure for indicator_criteria
-- ----------------------------
DROP TABLE IF EXISTS `indicator_criteria`;
CREATE TABLE `indicator_criteria`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `indicator_id` int UNSIGNED NOT NULL,
  `fiscal_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eval_round` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scoring_type` enum('MORE_IS_BETTER','LESS_IS_BETTER','RANGE','FIXED_LEVEL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'MORE_IS_BETTER',
  `criteria_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `criteria_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `criteria_3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `criteria_4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `criteria_5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_crit`(`indicator_id` ASC, `fiscal_year` ASC, `eval_round` ASC) USING BTREE,
  CONSTRAINT `fk_crit_ind` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of indicator_criteria
-- ----------------------------
INSERT INTO `indicator_criteria` VALUES (1, 1, '2569', '1', 'LESS_IS_BETTER', '≥ 25.00', '22.00 - 24.99', '19.00 - 21.99', '15.00 - 18.99', '< 15.00');
INSERT INTO `indicator_criteria` VALUES (2, 2, '2569', '1', 'MORE_IS_BETTER', '≤ 67.99', '68.00 - 72.99', '73.00 - 77.99', '78.00 - 82.99', '≥ 83.00');
INSERT INTO `indicator_criteria` VALUES (3, 3, '2569', '1', 'MORE_IS_BETTER', '< 2.99', '3.00 - 7.99', '8.00 - 12.99', '13.00 - 17.99', '≥ 18.00');
INSERT INTO `indicator_criteria` VALUES (4, 4, '2569', '1', 'MORE_IS_BETTER', '< 50.00', '50.00 - 59.99', '60.00 - 69.99', '70.00 - 79.99', '≥ 80.00');
INSERT INTO `indicator_criteria` VALUES (5, 5, '2569', '1', 'MORE_IS_BETTER', '< 35.00', '35.00 - 39.99', '40.00 - 44.99', '45.00 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (6, 6, '2569', '1', 'MORE_IS_BETTER', '≤ 65.99', '66.00 - 74.99', '75.00 - 83.99', '84.00 - 92.99', '≥ 93.00');
INSERT INTO `indicator_criteria` VALUES (7, 7, '2569', '1', 'MORE_IS_BETTER', '< 10.00', '10.00 - 19.99', '20.00 - 29.99', '30.00 - 39.99', '≥ 40.00');
INSERT INTO `indicator_criteria` VALUES (8, 8, '2569', '1', 'MORE_IS_BETTER', '< 20.00', '20.00 - 29.99', '30.00 - 39.99', '40.00 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (9, 9, '2569', '1', 'MORE_IS_BETTER', '< 10.00', '10.00 - 19.99', '20.00 - 29.99', '30.00 - 39.99', '≥ 40.00');
INSERT INTO `indicator_criteria` VALUES (10, 10, '2569', '1', 'MORE_IS_BETTER', '< 30.00', '30.00 - 39.99', '40.00 - 49.99', '50.00 - 59.99', '≥ 60.00');
INSERT INTO `indicator_criteria` VALUES (11, 11, '2569', '1', 'LESS_IS_BETTER', '≥ 75.00', '66.00 - 75.00', '56.00 - 65.99', '45.00 - 55.99', '< 45.00');
INSERT INTO `indicator_criteria` VALUES (12, 12, '2569', '1', 'MORE_IS_BETTER', '≤ 1.49', '1.50-1.99', '2.00-2.49', '2.50-2.99', '≥ 3.00');
INSERT INTO `indicator_criteria` VALUES (13, 13, '2569', '1', 'MORE_IS_BETTER', '< 75.00', '75.00 - 79.99', '80.00 - 84.99', '85.00 - 89.99', '≥ 90.00');
INSERT INTO `indicator_criteria` VALUES (14, 14, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');
INSERT INTO `indicator_criteria` VALUES (15, 15, '2569', '1', 'MORE_IS_BETTER', '< 3.00', '3.00 - 4.99', '5.00 - 6.99', '7.00 - 8.99', '≥ 9.00');
INSERT INTO `indicator_criteria` VALUES (16, 16, '2569', '1', 'MORE_IS_BETTER', '< 60.00', '60.00 - 69.99', '70.00 - 79.99', '80.00 - 89.99', '≥ 90.00');
INSERT INTO `indicator_criteria` VALUES (17, 17, '2569', '1', 'MORE_IS_BETTER', '< 60.00', '60.00 - 69.99', '70.00 - 79.99', '80.00 - 89.99', '≥ 90.00');
INSERT INTO `indicator_criteria` VALUES (18, 18, '2569', '1', 'MORE_IS_BETTER', '< 65.00', '65.00 - 74.99', '75.00 - 84.99', '85.00 - 95.99', '> 95.00');
INSERT INTO `indicator_criteria` VALUES (19, 19, '2569', '1', 'LESS_IS_BETTER', '≥ 39.00', '34.00 - 38.99', '29.00 - 33.99', '24.00 - 28.99', '< 24.00');
INSERT INTO `indicator_criteria` VALUES (20, 20, '2569', '1', 'LESS_IS_BETTER', '≥ 13.00', '11.00 - 12.99', '9.00 - 10.99', '7.00 - 8.99', '< 7.00');
INSERT INTO `indicator_criteria` VALUES (21, 21, '2569', '1', 'LESS_IS_BETTER', '≥ 15.00', '12.00 - 14.99', '10.00 - 11.99', '8.00 - 9.99', '< 8.00');
INSERT INTO `indicator_criteria` VALUES (22, 22, '2569', '1', 'LESS_IS_BETTER', '≥ 4.80', '4.40 - 4.79', '4.00 - 4.39', '3.60 - 3.99', '< 3.60');
INSERT INTO `indicator_criteria` VALUES (23, 23, '2569', '1', 'MORE_IS_BETTER', '< 20.00', '20.00 - 29.99', '30.00 - 39.99', '40.00 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (24, 24, '2569', '1', 'MORE_IS_BETTER', '< 20.00', '20.00 - 29.99', '30.00 - 39.99', '40.00 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (25, 25, '2569', '1', 'MORE_IS_BETTER', '< 20.00', '20.00 - 29.99', '30.00 - 39.99', '40.00 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (26, 26, '2569', '1', 'MORE_IS_BETTER', '< 20.00', '20.00 - 29.99', '30.00 - 39.99', '40.00 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (27, 27, '2569', '1', 'MORE_IS_BETTER', '< 24.00', '25.00 - 25.99', '26.00 - 26.99', '27.00 - 27.99', '≥ 28.00');
INSERT INTO `indicator_criteria` VALUES (28, 28, '2569', '1', 'MORE_IS_BETTER', '< 2.00', '2.00 - 3.99', '4.00 - 5.99', '6.00 - 8.99', '≥ 9.00');
INSERT INTO `indicator_criteria` VALUES (29, 29, '2569', '1', 'MORE_IS_BETTER', '< 44.00', '44.00 - 44.99', '45.00 - 45.99', '46.00 - 46.99', '≥ 47.00');
INSERT INTO `indicator_criteria` VALUES (30, 30, '2569', '1', 'MORE_IS_BETTER', '≥ 4.00', '4.01 - 5.59', '5.60 - 7.00', '7.01 - 8.59', '≥ 8.60');
INSERT INTO `indicator_criteria` VALUES (31, 31, '2569', '1', 'LESS_IS_BETTER', '> 8.00', '7.01 - 8.00', '6.01 - 7.00 ', '5.01 - 6.00', '≤ 5.00');
INSERT INTO `indicator_criteria` VALUES (32, 32, '2569', '1', 'MORE_IS_BETTER', '< 40.00', '40.00 - 44.99', '45.00 – 49.99', '50.00 – 54.99', '≥ 55.00');
INSERT INTO `indicator_criteria` VALUES (33, 33, '2569', '1', 'MORE_IS_BETTER', '< 50.00', '50.00 – 59.99', '60.00 – 69.99', '70.00 - 79.99', '≥ 80.00');
INSERT INTO `indicator_criteria` VALUES (34, 34, '2569', '1', 'MORE_IS_BETTER', '< 40.00', '40.00- 44.99', '45.00 – 49.99', '50.00 – 54.99', '≥ 55.00');
INSERT INTO `indicator_criteria` VALUES (35, 35, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');
INSERT INTO `indicator_criteria` VALUES (36, 36, '2569', '1', 'MORE_IS_BETTER', '< 20.00', '20.01 - 29.99', '30.01 - 39.99', '40.04 - 49.99', '≥ 50.00');
INSERT INTO `indicator_criteria` VALUES (37, 37, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');
INSERT INTO `indicator_criteria` VALUES (38, 38, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');
INSERT INTO `indicator_criteria` VALUES (39, 39, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');
INSERT INTO `indicator_criteria` VALUES (40, 40, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');
INSERT INTO `indicator_criteria` VALUES (41, 41, '2569', '1', 'FIXED_LEVEL', '1', '2', '3', '4', '5');

-- ----------------------------
-- Table structure for indicators
-- ----------------------------
DROP TABLE IF EXISTS `indicators`;
CREATE TABLE `indicators`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fiscal_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2569',
  `eval_round` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_ex_id` int UNSIGNED NOT NULL,
  `indicator_sequence` int NULL DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `multiplier` decimal(10, 2) NULL DEFAULT 1.00,
  `weight` decimal(5, 2) NULL DEFAULT 0.00,
  `target_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `result_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `template_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source_type` enum('KEYIN','HDC') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KEYIN',
  `workgroup_id` int UNSIGNED NOT NULL,
  `is_collaborative` tinyint(1) NULL DEFAULT 0,
  `formula_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `formula_calc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `recorder_type` enum('HOSPITAL','PROVINCE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `display_type` enum('อำเภอ','รพ.','หน่วยบริการ') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'อำเภอ',
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ind_workgroup`(`workgroup_id` ASC) USING BTREE,
  INDEX `indicators_ibfk2`(`fiscal_year` ASC) USING BTREE,
  INDEX `indicators_ibfk3`(`sub_ex_id` ASC) USING BTREE,
  CONSTRAINT `fk_ind_workgroup` FOREIGN KEY (`workgroup_id`) REFERENCES `cworkgroups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `indicators_ibfk2` FOREIGN KEY (`fiscal_year`) REFERENCES `fiscal_years` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `indicators_ibfk3` FOREIGN KEY (`sub_ex_id`) REFERENCES `csub_excellence` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of indicators
-- ----------------------------
INSERT INTO `indicators` VALUES (1, '2569', '1', 1, 1, 'อัตราส่วนการตายมารดาไทยต่อการเกิดมีชีพแสนคน', 'อัตราต่อแสน', 100000.00, 2.00, 'จำนวนการเกิดมีชีพทั้งหมดในช่วงเวลาเดียวกัน', 'จำนวนมารดาตายระหว่างตั้งครรภ์ คลอด และหลังคลอดภายใน 42 วัน ทุกสาเหตุ ยกเว้น อุบัติเหตุในช่วงเวลาที่กำหนด', '256901.pdf', 'KEYIN', 5, 0, '(A/B) x 100,000', '(A/B)*100000', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (2, '2569', '1', 1, 2, 'ร้อยละของเด็ก อายุ 0 - 5 ปี มีพัฒนาการสมวัย', 'ร้อยละ', 100.00, 4.00, 'จำนวนเด็กอายุ 9, 18, 30, 42 และ 60 เดือน ทั้งหมด ในช่วงเวลาที่กำหนด', 'จำนวนเด็กอายุ 9, 18, 30, 42 และ 60 เดือน ที่ได้รับการตรวจคัดกรองพัฒนาการ โดยใช้คู่มือเฝ้าระวังและส่งเสริมพัฒนาการเด็กปฐมวัย (DSPM) แล้วผลการตรวจคัดกรอง ผ่านครบ 5 ด้าน', '256902.pdf', 'KEYIN', 5, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (3, '2569', '1', 1, 3, 'ร้อยละของเด็กปฐมวัยที่มีพัฒนาการล่าช้าเข้าถึงบริการพัฒนาการและสุขภาพจิตที่ได้มาตรฐาน', 'ร้อยละ', 100.00, 2.00, 'จำนวนเด็กปฐมวัยอายุ 0 – 5 ปี ในเขตสุขภาพ x ความชุก 21.7 *** ความชุกของเด็กที่มีระดับสติปัญญา ต่ำกว่า 90 เท่ากับ ร้อยละ 21.7 (ได้จากการสำรวจสถานการณ์ระดับ สติปัญญา (IQ) เด็กไทยชั้นประถมศึกษาปีที่ 1 ประจำปี 2564 ของกรมสุขภาพจิต)', 'จำนวนเด็กปฐมวัยอายุ 0 – 5 ปี ที่มีพัฒนาการล่าช้าที่เข้าถึงบริการพัฒนาการและ สุขภาพจิตที่ได้มาตรฐาน (สะสม) ในเขตสุขภาพ *** เด็กปฐมวัยอายุ 0 – 5 ปี (5 ปี 11 เดือน 29 วัน) ที่เป็นประชากรไทย ข้อมูลจากทะเบียนราษฎร์กรมการ ปกครอง กระทรวงมหาดไทย ในปี พ.ศ. (ณ วันที่ 31 ธ.ค.)', '256903.pdf', 'KEYIN', 5, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (4, '2569', '1', 1, 4, 'ร้อยละของเด็ก อายุ 0 - 5 ปี ฟันดีไม่มีผุ', 'ร้อยละ', 100.00, 3.00, 'จำนวนเด็กอายุ 0 – 5 ปี 11 เดือน 29 วัน ณ วันที่มารับบริการตรวจช่องปาก และเป็นประชาชนไทย Nation = 099 ที่อาศัยอยู่ในเขตรับผิดชอบ Person Type Area = 1 ,3 และ Person Discharge = 9, ใช้แฟ้ม Dental ที่ปรับปรุงข้อมูลล่าสุด (d_update) ในปีงบประมาณ ไม่นับซ้ำ (Distinct) hospcode+pid และแฟ้ม Dental มี provider type = 02 ,06 เงื่อนไขคุณภาพแฟ้ม dental DTEETH= 1 - 20 , DFILLING + DEXTRACT + DCARIES <=20 และ DCARIES + DFILLING <= DTEETH', 'จำนวนเด็กในรายการ (B) ที่มีเงื่อนไขคือ เด็กอายุ 0 - 5 ปี 11 เดือน 29 วัน DFILLING>=0 และ DEXTRACT=0 และ DCARIES=0 ', '256904.pdf', 'KEYIN', 14, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (5, '2569', '1', 1, 5, 'ร้อยละของชุมชนมีการดำเนินการจัดการสุขภาพที่เหมาะสมกับประชาชน', 'ร้อยละ', 100.00, 3.00, 'จำนวนตำบลเป้าหมาย 135 ตำบล', 'จำนวนตำบลที่มีการดำเนินงานจัดการสุขภาพตามเกณฑ์ที่กำหนด (135 ตำบล) ', '256905.pdf', 'KEYIN', 13, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (6, '2569', '1', 2, 6, 'อัตราความรอบรู้ด้านสุขภาพของประชาชนไทย อายุ 15 ปี ขึ้นไป', 'ร้อยละ', 100.00, 2.00, 'จำนวนกลุ่มตัวอย่างทั้งหมดที่ได้รับการประเมิน', 'จำนวนกลุ่มตัวอย่างที่มีผลการประเมินในระดับเพียงพอขึ้นไป', '256906.pdf', 'KEYIN', 5, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (7, '2569', '1', 3, 7, 'ร้อยละการตรวจติดตามยืนยันวินิจฉัยกลุ่มสงสัยป่วยโรคเบาหวาน', 'ร้อยละ', 100.00, 3.00, 'จำนวนประชากรอายุ 35 ปี ขึ้นไป ในเขตรับผิดชอบที่ยังไม่ได้รับการวินิจฉัย และขึ้นทะเบียนโรคเบาหวาน ได้รับการคัดกรองโรคเบาหวาน และเป็นกลุ่มสงสัยป่วยโรคเบาหวาน', 'จำนวนประชากรใน B ได้รับการตรวจยืนยันวินิจฉัยโดยการตรวจระดับพลาสมากลูโคสหลังอดอาหารมากกว่า 8 ชั่วโมง (FPG) ทางห้องปฏิบัติการ ในสถานบริการสาธารณสุข โดยสามารถตรวจติดตามยืนยันวินิจฉัยได้ตั้งแต่ 1 วันถัดไป หลังจากวันที ่คัดกรองและเป็นกลุ่มสงสัยป่วยโรคเบาหวาน (ภายใน 1 - 180 วัน ก่อนสิ้นปีงบประมาณ) ตามแนวทางเวชปฏิบัติสำหรับโรคเบาหวาน 2566', '256907.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (8, '2569', '1', 3, 8, 'ร้อยละการตรวจติดตามยืนยันวินิจฉัยกลุ่มสงสัยป่วยโรคความดันโลหิตสูง', 'ร้อยละ', 100.00, 3.00, 'จำนวนประชากรอายุ 35 ปี ขึ้นไป ในเขตรับผิดชอบที่ยังไม่ได้รับการวินิจฉัยและขึ้นทะเบียนโรคความดันโลหิตสูง ได้รับการคัดกรองโรคความดันโลหิตสูงและเป็นกลุ่มสงสัยป่วยโรคความดันโลหิตสูง หมายเหตุ: ใช้ข้อมูลจำนวนประชากรอายุ 35 ปีขึ้นไป ในเขตรับผิดชอบที่ยังไม่ได้รับการวินิจฉัยและขึ้นทะเบียนโรคความดันโลหิตสูง ได้รับการคัดกรองโรคความดันโลหิตสูงและเป็นกลุ่มสงสัยป่วยโรคความดันโลหิตสูง สะสมตั้งแต่วันที่ 1 ตุลาคม 2568 - 30 มิถุนายน 2569', 'จำนวนประชากรใน B ได้รับการติดตามวัดความดันโลหิตด้วยตนเองที่บ้าน (HBPM) ติดต่อกันอย่างน้อย 7 วัน ภายใน 1 - 30 วัน ก่อนสิ้นปีงบประมาณ หรือ ได้รับการติดตามวัดความดันโลหิตซ้ำในสถานบริการสาธารณสุขเดิม ( OBPM) ภายใน 1 - 30 วัน ก่อนสิ้นปีงบประมาณ ด้วยวิธีการวัดความดันโลหิตที่ถูกต้องตามมาตรฐาน ตามแนวทางการรักษาโรคความดันโลหิตสูงในเวชปฏิบัติทั่วไป พ.ศ. 2567 หลังจากได้รับการคัดกรองโรคความดันโลหิตสูงที่สถานบริการสาธารณสุข หรือในชุมชนแล้ว เพื่อรับการวินิจฉัยโรคความดันโลหิตสูง หมายเหตุ: กรณีได้วัดความดันโลหิตซ้ำทั้ง 2 วิธี คือ ด้วยวิธีการวัดความดันโลหิต ด้วยตนเองที่บ้าน (HBPM) และได้รับการวัดความดันโลหิตซ้ำในสถานบริการสาธารณสุขเดิม (OBPM) การประมวลผลจะใช้ผลการวัดความดันโลหิตซ้ำจาก HBPM เป็นหลัก', '256908.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (9, '2569', '1', 3, 9, 'ร้อยละของผู้ป่วยเบาหวานที่ควบคุมระดับน้ำตาลในเลือดได้ดี', 'ร้อยละ', 100.00, 3.00, 'จำนวนผู้ป่วยเบาหวานที่ ได้รับการวินิจฉัยจากแฟ้ม DIAGNOSIS_OPD, DIAGNOSIS_IPD,CHRONIC รหัส ICD-10 3 หลักขึ้นต้นด้วย E10 – E14 ที่อยู่อาศัยในเขตพื้นที่รับผิดชอบ PERSON.TYPE AREA IN (“1” , “3”) 1 (มีชื่ออยู่ตามทะเบียนบ้านในเขตพื้นที่รับผิดชอบและอยู่จริง), 3 (มาอาศัยอยู่ในเขตรับผิดชอบ แต่ทะเบียนบ้านอยู่นอกเขต) และ PERSON.DISCHARGE=“9” (ไม่จำหน่าย) PERSON.NATION=“099” (สัญชาติไทย) และ/หรือจำนวนผู้ป่วยเบาหวานที่ขึ้นทะเบียน CHRONIC และมารับบริการทั้งหมดจากแฟ้ม CHRONICFU ในปีงบประมาณของหน่วยบริการ', 'จำนวนผู้ป่วยเบาหวานที่ได้รับการวินิจฉัยจากแฟ้ม DIAGNOSIS_OPD, DIAGNOSIS_IPD, CHRONIC รหัส ICD-10 3 หลักขึ้นต้นด้วย E10 – E14 ที่อยู่อาศัยในเขตพื้นที่รับผิดชอบ PERSON.TYPE AREA IN (“1”, “3”) 1 (มีชื ่ออยู่ตามทะเบียนบ้านในเขตพื้นที่รับผิดชอบและอยู่จริง), 3 (มาอาศัยอยู่ในเขตรับผิดชอบ แต่ทะเบียนบ้านอยู่นอกเขตรับผิดชอบ) และ PERSON.DISCHARGE = “9” (ไม่จำหน่าย) PERSON.NATION = “099” (สัญชาติไทย) และได้รับการตรวจ HbA1C (LABFU.LABTEST = “0531601”) ระดับ HbA1C ครั้งสุดท้าย ใช้ข้อมูลจาก LABFU.LABRESULT (HbA1c ครั้งสุดท้ายน้อยกว่าร้อยละ 7 ในผู้ป่วยเบาหวานที่ไม่มีโรคร่วม, HbA1c ครั้งสุดท้ายน้อยกว่าร้อยละ 8 ในผู้ป่วยเบาหวานที่มีโรคร่วม) และ/หรือจำนวนผู้ป่วยเบาหวานขึ้นทะเบียนที่มารับบริการจากแฟ้ม CHRONICFU ในปีงบประมาณของหน่วยบริการ ที่ได้รับการตรวจ HbA1C (LABFU.LABTEST=”0531601”) ระดับ HbA1C ครั้งสุดท้าย ใช้ข้อมูลจาก LABFU.LABRESULT (HbA1c ครั้งสุดท้ายน้อยกว่าร้อยละ 7 ในผู้ป่วยเบาหวานที่ไม่มีโรคร่วม, HbA1c ครั้งสุดท้ายน้อยกว่าร้อยละ 8 ในผู้ป่วยเบาหวานที่มีโรคร่วม)', '256909.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (10, '2569', '1', 3, 10, 'ร้อยละของผู้ป่วยโรคความดันโลหิตสูงที่ควบคุมระดับความดันโลหิตได้ดี', 'ร้อยละ', 100.00, 3.00, 'จำนวนผู้ป่วยโรคความดันโลหิตสูงที่ได้รับการวินิจฉัยจากแฟ้ม DIAGNOSIS_OPD, DIAGNOSIS_IPD, CHRONIC รหัส ICD-10 3 หลักขึ้นต้นด้วย I10-I15 (สัญชาติไทย) ในเขตรับผิดชอบ PERSON.TYPE AREA IN (“1”, “3”)', 'จำนวนผู้ป่วยโรคความดันโลหิตสูงที่ได้รับการวินิจฉัยจากแฟ้ม DIAGNOSIS_OPD, DIAGNOSIS_IPD, CHRONIC รหัส ICD-10 3 หลักขึ้นต้นด้วย I10-I15 ในเขตรับผิดชอบ PERSON.TYPEAREA IN (“1”, “3”) 1 (มีชื่ออยู่ตามทะเบียนบ้านในเขตพื้นที่รับผิดชอบและอยู่จริง), 3(มาอาศัยในเขตรับผิดชอบ แต่ทะเบียนอยู่นอกเขตรับผิดชอบ) และ PERSON.DISCHAGE = “9” (ไม่จำหน่าย) PERSON.NATION= “099” (สัญชาติไทย) และมีค่าระดับความดันโลหิตครั้งสุดท้าย ใช้ข้อมูลจาก CHRONICFU (CHRONICFU.SBP BETWEEN 50 and 139 mmHg), (CHRONICFU.DBP BETWEEN 50 and 89 mmHg)', '256910.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (11, '2569', '1', 3, 11, 'อัตราป่วยโรคไข้เลือดออกลดลง', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้ป่วยไข้เลือดออก', 'จำนวนผู้ป่วยตายโรคไข้เลือดออก', '256911.pdf', 'KEYIN', 6, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (12, '2569', '1', 3, 12, 'อัตราการเสียชีวิตและบาดเจ็บจากอุบัติเหตุทางถนนในกลุ่มเด็กและเยาวชน (ช่วงวัย 1-18 ปี) ลดลง', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้เสียชีวิตรวมกับจำนวนผู้บาดเจ็บค่าเฉลี่ยปี 2566 - 2568', '(จำนวนผู้เสียชีวิตรวมกับจำนวนผู้บาดเจ็บปี 2569) – (จำนวนผู้เสียชีวิตรวมกับจำนวนผู้บาดเจ็บค่าเฉลี่ยปี 2566 - 2568) ', '256912.pdf', 'KEYIN', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (13, '2569', '1', 3, 13, 'ร้อยละความครอบคลุมของวัคซีนป้องกันหัด-คางทูม-หัดเยอรมัน เข็มที่ 2 (MMR2) ในเด็กอายุต่ำกว่า 3 ปี', 'ร้อยละ', 100.00, 2.00, 'ประชากรเป้าหมายที่อาศัยอยู่จริงในพื้นที่รับผิดชอบทั้งหมด จากฐานข้อมูล 43 แฟ้ม (Health Data Center)', 'ประชากรเป้าหมายที่ได้รับวัคซีนรวมป้องกันโรคหัด – คางทูม - หัดเยอรมัน (MMR) จากฐานข้อมูล 43 แฟ้ม (Health Data Center)', '256913.pdf', 'KEYIN', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (14, '2569', '1', 4, 14, 'ระดับความสำเร็จของหน่วยงานที่พัฒนาอนามัยสิ่งแวดล้อมได้ตามเกณฑ์ GREEN & CLEAN Hospital Challenge', 'ระดับ', 1.00, 2.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256914.pdf', 'KEYIN', 12, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (15, '2569', '1', 5, 15, 'ร้อยละผู้ป่วยไตเรื้อรัง Stage 5 รายใหม่ ลดลงจากปีงบประมาณก่อนหน้า', 'อัตราลดลง', 100.00, 3.00, 'จำนวนผู้ป่วยโรคไตเรื้อรังระยะที่ 5 รายใหม่ ที่มารับบริการที่โรงพยาบาลของ ปีงบประมาณก่อนหน้า', 'จำนวนผู้ป่วยโรคไตเรื้อรังระยะที่ 5 รายใหม่ ที่มารับบริการที่โรงพยาบาลของ ปีงบประมาณปัจจุบัน', '256915.pdf', 'KEYIN', 8, 0, '((B-A)/B) x 100', '((B-A)/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (16, '2569', '1', 5, 16, 'อัตราความสำเร็จการรักษาผู้ป่วยวัณโรคปอดรายใหม่', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้ป่วยวัณโรคปอดรายใหม่ ที่ขึ้นทะเบียน ในไตรมาสที่ 1 ของปีงบประมาณ พ.ศ. 2569 (1 ตุลาคม - 31 ธันวาคม 2568)', 'จำนวนผู้ป่วยวัณโรคปอดรายใหม่ ที่ขึ้นทะเบียน ในไตรมาสที่ 1 ของปีงบประมาณ พ.ศ. 2569 (1 ตุลาคม - 31 ธันวาคม 2568) โดยมีผลการรักษาหาย (Cured) รวมกับรักษาครบ (Completed)', '256916.pdf', 'KEYIN', 6, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (17, '2569', '1', 5, 17, 'อัตราความครอบคลุมการขึ้นทะเบียนผู้ป่วยวัณโรครายใหม่และกลับเป็นซ้ำ', 'ร้อยละ', 100.00, 2.00, 'จำนวนคาดประมาณผู้ป่วยวัณโรครายใหม่และกลับเป็นซ้ำที่ขึ้นทะเบียนรักษาในปีงบประมาณ พ.ศ. 2569 (คิดจากอัตรา 157 ต่อประชากรแสนคน*) หมายเหตุ: ข้อมูลประชากรอ้างอิงระบบคลังข้อมูลด้านการแพทย์และสาธารณสุข (HDC) *ข้อมูลจาก HCD รายงานประชากรทะเบียนราษฎร์ จำแนกรายอายุและเพศ', 'จำนวนผู้ป่วยวัณโรครายใหม่และกลับเป็นซ้ำที่ค้นพบและขึ้นทะเบียนรักษาในปีงบประมาณ พ.ศ. 2569 (1 ตุลาคม พ.ศ. 2568 - 30 กันยายน พ.ศ. 2569)', '256917.pdf', 'KEYIN', 6, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (18, '2569', '1', 5, 18, 'ร้อยละความครอบคลุมการคัดกรองการได้ยินของทารกแรกเกิด', 'ร้อยละ', 100.00, 2.00, 'จำนวนทารกแรกเกิดมีชีพทั้งหมด ในโรงพยาบาล ', 'จำนวนทารกแรกเกิดมีชีพทั้งหมด ทุก Patient type ในโรงพยาบาล ทั้ง OPD และ IPD ที่ได้รับการตรวจการได้ยิน ภายใน 30 วันนับจากวันเกิด (รหัสโรค ICD 10 Z13.5 + รหัส ICD-9 95.43)', '256918.pdf', 'KEYIN', 5, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (19, '2569', '1', 6, 19, 'อัตราตายผู้ป่วยติดเชื้อในกระแสเลือดแบบรุนแรงชนิด Community-Acquired', 'ร้อยละ', 100.00, 3.00, 'จำนวนผู้ป่วยติดเชื้อในกระแสเลือดแบบรุนแรงชนิด community-acquired ทั้งหมด ที่ลง ICD 10 รหัส R 65.1 และ R57.2 ใน Principle Diagnosis และ Comorbidity ไม่นับรวมที่ลงใน Post Admission Comorbidity (complication) และไม่นับรวมผู้ป่วย palliative (รหัส Z 51.5) ', 'จำนวนผู้ป่วยที่เสียชีวิต (dead) จากภาวะการติดเชื้อในกระแสเลือดแบบรุนแรงชนิด community-acquiredที่ลง ICD 10 รหัส R 65.1 และ R57.2 ใน Principle Diagnosis และ Comorbidity ไม่นับรวมที่ลงใน Post Admission Comorbidity (complication) และไม่นับรวมผู้ป่วย palliative (รหัส Z 51.5) และ/หรือ จำนวนผู้ป่วยที่ปฏิเสธการรักษาเพื่อกลับไปเสียชีวิตที่บ้าน (against advise) จากภาวะการติดเชื้อในกระแสเลือดแบบรุนแรงชนิด community-acquired ทีลง ICD-10 รหัส R 65.1 และ R57.2 ใน Principle Diagnosis และ Comorbidity ไม่นับรวมทีลงใน Post Admission Comorbidity (complication) และไม่นับรวมผู้ป่วย palliative (รหัส Z 51.5) โดยมีสถานภาพการจำหน่าย (Discharge status) = 2 ปฏิเสธการรักษา, และวิธีการจำหน่าย (Discharge type) = 3 ไม่ดีขึ้น', '256919.pdf', 'HDC', 4, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (20, '2569', '1', 6, 20, 'อัตราตายของผู้ป่วยโรคหลอดเลือดสมอง (Stroke; I60 - I64)', 'ร้อยละ', 100.00, 2.00, 'จำนวนครั้งของการจำหน่ายของผู้ป่วยโรคหลอดเลือดสมองจากทุกหอผู้ป่วยในช่วงเวลาเดียวกัน (Stroke: I60-I69)', 'จำนวนครั้งของการจำหน่ายสถานะตายของผู้ป่วยโรคหลอดเลือดสมอง (Stroke :I60-I69) จากทุกหอผู้ป่วย', '256920.pdf', 'HDC', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (21, '2569', '1', 6, 21, 'อัตราตายของผู้ป่วยโรคกล้ามเนื้อหัวใจตายเฉียบพลันชนิด STEMI', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้ป่วย STEMI ที่มาถึงโรงพยาบาลและได้รับยาละลายลิ่มเลือดทั้งหมด', 'จำนวนครั้งการรักษาที่สามารถให้ยาละลายลิ่มเลือดภายใน 30 นาที นับจากผู้ป่วยได้รับการวินิจฉัย STEMI (EKG diagnosis) เมื่อมาถึงโรงพยาบาล', '256921.pdf', 'HDC', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (22, '2569', '1', 6, 22, 'อัตราตายทารกแรกเกิดอายุน้อยกว่าหรือเท่ากับ 28 วัน', 'อัตราต่อพัน', 1000.00, 2.00, 'จำนวนทารกแรกเกิดมีชีพ', 'จำนวนทารกที่เสียชีวิต ≤ 28 วัน', '256922.pdf', 'HDC', 5, 0, '(A/B) x 1,000', '(A/B)*1000', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (23, '2569', '1', 7, 23, 'ร้อยละการคัดกรองมะเร็งปากมดลูก', 'ร้อยละ', 100.00, 2.00, 'จำนวนประชากรหญิงไทย อายุ 30-60 ปี ทั้งหมด', 'จำนวนประชากรหญิงไทย อายุ 30-60 ปี ที่ได้รับการคัดกรองมะเร็งปากมดลูก', '256923.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (24, '2569', '1', 7, 24, 'ร้อยละผู้ที่มีผลผิดปกติ (มะเร็งปากมดลูก) ได้รับการส่องกล้อง Colposcopy', 'ร้อยละ', 100.00, 2.00, 'จำนวนประชากรหญิงไทย อายุ 30-60 ปี ที่มีผลการตรวจคัดกรองมะเร็งปากมดลูกผิดปกติ', 'จำนวนประชากรกลุ่มเป้าหมายที่มีผลผิดปกติได้รับการส่องกล้อง Colposcopy', '256924.pdf', 'KEYIN', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (25, '2569', '1', 7, 25, 'ร้อยละการคัดกรองมะเร็งลำไส้ใหญ่และไส้ตรง', 'ร้อยละ', 100.00, 2.00, 'จำนวนประชากร อายุ 50-70 ปี เป็นรายจังหวัด ทั้งหมด', 'จำนวนประชากร อายุ 50-70 ปี เป็นรายจังหวัด ที่ได้รับการคัดกรองมะเร็งลำไส้ใหญ่และไส้ตรง', '256925.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (26, '2569', '1', 7, 26, 'ร้อยละผู้ที่มีผลผิดปกติ (มะเร็งลำไส้ใหญ่และไส้ผิดปกติ) ได้รับการส่องกล้อง Colonoscopy', 'ร้อยละ', 100.00, 2.00, 'จำนวนประชากร อายุ 50-70 ปี ที่มีผลการตรวจคัดกรองมะเร็งลำไส้ใหญ่และไส้ตรงผิดปกติ', 'จำนวนประชากรกลุ่มเป้าหมายที่มีผลผิดปกติได้รับการส่องกล้อง Colonoscopy', '256926.pdf', 'KEYIN', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (27, '2569', '1', 7, 27, 'ร้อยละของผู้ปวยวิกฤติเข้าถึงบริการการแพทย์ฉุกเฉิน', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้ป่วยฉุกเฉินวิกฤต (L1-สีแดง) ที่มารับบริการ ณ ห้องฉุกเฉิน ทั้งหมด (ER Visit) ไม่รวมผู้ป่วยส่งต่อ (Refer)', 'จำนวนผู้ป่วยฉุกเฉินวิกฤต (L1-สีแดง) ที่มารับบริการ ณ ห้องฉุกเฉิน เฉพาะการมาโดยระบบบริการการแพทย์ฉุกเฉิน (EMS) เท่านั้น', '256927.pdf', 'KEYIN', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (28, '2569', '1', 8, 28, 'ระดับความสำเร็จของหน่วยบริการที่ผ่านเกณฑ์คุณภาพมาตรฐาน ตาม พ.ร.บ.ระบบสุขภาพปฐมภูมิ พ.ศ. 2562', 'คะแนนเต็ม 10', 10.00, 3.00, 'คะแนนเต็ม', 'ระดับคะแนนเชิงคุณภาพ', '256928.pdf', 'KEYIN', 13, 1, '(A/B) x 10', '(A/B)*10', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (29, '2569', '1', 8, 29, 'ร้อยละของประชาชนที่มารับบริการในระดับปฐมภูมิได้รับการรักษาด้วยการแพทย์แผนไทยและการแพทย์ทางเลือก', 'ร้อยละ', 100.00, 2.00, 'จำนวน (ครั้ง) ของการบริการทั้งหมดในสถานบริการสาธารณสุขระดับปฐมภูมิ ที่มีรหัสประเภทหน่วยบริการ 03, 04, 08, 13, 18 โดยมีการวินิจฉัยรหัสกลุ่มโรคและอาการของแพทย์แผนปัจจุบัน (ขึ้นต้นด้วย A ถึง Y) หรือแพทย์แผนไทย ที่มีรหัส 3 หลักขึ้นต้นด้วย U50 ถึง U76 หรือแพทย์แผนจีน ที่มีรหัส 3 หลักขึ้นต้นด้วย U78 ถึง U79', 'จำนวน (ครั้ง) ของการบริการการแพทย์แผนไทยและการแพทย์ทางเลือกในสถานบริการสาธารณสุขระดับปฐมภูมิ ที่มีรหัสประเภทหน่วยบริการ 03, 04, 08, 13, 18 โดยมีการวินิจฉัยรหัสกลุ่มโรคและอาการที่มีรหัส 3 หลักขึ้นต้นด้วย U50 ถึง U76 หรือ U78 ถึง U79 หรือ สั่งจ่ายยาสมุนไพรเดี่ยว หรือยาสมุนไพรตำรับ ที่มีรหัสขึ้นต้นด้วย 41 หรือ 42 หรือให้หัตถการแผนไทย (100-77-00 ถึง 999-78-88) หรือหัตถการส่งเสริมสุขภาพ (100-79-00 ถึง 999-79-99) หรือกิจกรรมบริการการแพทย์แผนไทยที่บ้าน (1I00 ถึง 1I081) หรือบริการการแพทย์ทางเลือกที่บ้าน (1I100 ถึง 1I183) อย่างใดอย่างหนึ่ง ทั้งนี้ หากมีการลงหัตถการ หรือจ่ายยาสมุนไพร มากกว่า 1 รายการ ก็จะนับเป็นการบริการ 1 ครั้ง (visit)', '256929.pdf', 'KEYIN', 7, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (30, '2569', '1', 8, 30, 'ระดับความสำเร็จของการใช้ยาสมุนไพรในสิทธิ UC เปรียบเทียบกับค่าเป้าหมาย', 'คะแนนเต็ม 10', 10.00, 2.00, 'คะแนนเต็ม', 'ระดับคะแนนเชิงคุณภาพ', '256930.pdf', 'KEYIN', 7, 0, '(A/B) x 10', '(A/B)*10', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (31, '2569', '1', 9, 31, 'อัตราการฆ่าตัวตายสำเร็จ', 'อัตราต่อแสน', 100000.00, 3.00, 'จำนวนประชากรกลางปี 2569 **หมายเหตุ สำหรับไตรมาส 2 ใช้ประชากรปลายปี 2568 สำหรับไตรมาส 3 และ 4  ใช้ประชากรกลางปี 2569', 'จำนวนผู้ฆ่าตัวตายสำเร็จ (อ้างอิงตามสถานที่เสียชีวิต)  ปีงบประมาณ 2569', '256931.pdf', 'KEYIN', 8, 1, '(A/B) x 100,000', '(A/B)*100000', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (32, '2569', '1', 9, 32, 'ร้อยละของผู้พยายามฆ่าตัวตาย ไม่กลับมาทำร้ายตัวเองซ้ำในระยะเวลา 1 ปี', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้พยายามฆ่าตัวตายทั้งหมด', 'จำนวนผู้พยายามฆ่าตัวตายเข้าถึงบริการที่มีประสิทธิภาพ', '256932.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (33, '2569', '1', 9, 33, 'ร้อยละของผู้ป่วยยาเสพติดเข้าสู่กระบวนการบำบัดรักษา ได้รับการดูแลอย่างมีคุณภาพต่อเนื่องจนถึงการติดตาม (Retention Rate)', 'ร้อยละ', 100.00, 2.00, 'จำนวนผู้ป่วยยาเสพติดที่เข้าสู่กระบวนการบำบัดรักษาทั้งหมด ที่ครบระยะเวลา 1 ปี หลังจากวันที่สรุปบำบัด (ยกเว้นกรณีถูกจับ เสียชีวิต ปรับเปลี่ยนการรักษา หรือ บำบัดโดย Methadone)', 'จำนวนผู้ป่วยยาเสพติดที่เข้าสู่กระบวนการบำบัดรักษาและฟื้นฟูครบตามโปรแกรมมาตรฐาน และได้รับการดูแล ติดตามทางการแพทย์อย่างต่อเนื่อง หลังสิ้นสุดการบำบัดรักษา ครบตามเกณฑ์มาตรฐาน* และครบระยะเวลา 1 ปี หลังจากวันที่สรุปบำบัด', '256933.pdf', 'KEYIN', 8, 1, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (34, '2569', '1', 9, 34, 'ร้อยละผู้ป่วยโรคจิตเวชยาเสพติดที่มีความเสี่ยงสูงต่อการก่อความรุนแรง (SMI-V) ได้รับการดูแลต่อเนื่องจนไม่กลับมาก่อความรุนแรงซ้ำ', 'ร้อยละ', 100.00, 3.00, 'ผู้ป่วยโรคจิตเวชและสารเสพติดที่มีความเสี่ยงสูงต่อการก่อความรุนแรง (SMI-V) ในพื้นที่ได้รับการดูแลต่อเนื่อง', 'ผู้ป่วยโรคจิตเวชและสารเสพติดที่มีความเสี่ยงสูงต่อการก่อความรุนแรง (SMI-V) ในพื้นที่ได้รับการดูแลต่อเนื่องจนไม่ก่อความรุนแรงซ้ำ', '256934.pdf', 'KEYIN', 8, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (35, '2569', '1', 10, 35, 'ระดับความสำร็จ ในการดำเนินงานองค์กรแห่งความสุข', 'ระดับ', 1.00, 3.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256935.pdf', 'KEYIN', 10, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (36, '2569', '1', 11, 36, 'ร้อยละของหน่วยงานที่ผ่านเกณฑ์มาตรฐานความมั่นคงปลอดภัยไซเบอร์ระดับสูง', 'คะแนนเต็ม 50', 50.00, 3.00, 'หน่วยงานทั้งหมด (หน่วยงานตามที่กำหนดไว้ในคำนิยาม)', 'หน่วยงานที่รักษาระดับมาตรฐานความมั่นคงปลอดภัยไซเบอร์ระดับสูง', '256936.pdf', 'KEYIN', 15, 0, '(A/B) x 100', '(A/B)*100', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (37, '2569', '1', 11, 37, 'ระดับความสำเร็จของโรงพยาบาลในเขตสุขภาพผ่านเกณฑ์พัฒนาโรงพยาบาลที่มีการตรวจทางห้องปฏิบัติการอย่างสมเหตุผล (RLU Hospital Plus) ตามที่กำหนด', 'ระดับ', 1.00, 2.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256937.pdf', 'KEYIN', 4, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (38, '2569', '1', 11, 38, 'ระดับความสำเร็จของหน่วยบริการที่ผ่านเกณฑ์การประเมินประสิทธิภาพ Total Performance Score (TPS)', 'ระดับ', 1.00, 4.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256938.pdf', 'KEYIN', 3, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (39, '2569', '1', 12, 39, 'ระดับความสำเร็จของการส่งเสริมสถานประกอบการด้านการท่องเที่ยวเชิงสุขภาพที่ได้รับมาตรฐานตามที่กำหนด', 'ระดับ', 1.00, 3.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256939.pdf', 'KEYIN', 9, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (40, '2569', '1', 12, 40, 'ระดับความสำเร็จในการส่งเสริมสถานประกอบการผลิตภัณฑ์สุขภาพ', 'ระดับ', 1.00, 2.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256940.pdf', 'KEYIN', 9, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');
INSERT INTO `indicators` VALUES (41, '2569', '1', 12, 41, 'ระดับความสำเร็จในการพัฒนาร้านชำคุณภาพ (G-RDU)', 'ระดับ', 1.00, 2.00, 'ระดับความสำเร็จของการดำเนินการ', 'ระดับความสำเร็จที่ได้', '256941.pdf', 'KEYIN', 9, 0, 'A', 'A', 'PROVINCE', 'อำเภอ', 'ACTIVE');

-- ----------------------------
-- Table structure for kpi_results
-- ----------------------------
DROP TABLE IF EXISTS `kpi_results`;
CREATE TABLE `kpi_results`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'รหัสลำดับ (PK)',
  `fiscal_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ปีงบประมาณ',
  `eval_round` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รอบการประเมิน (เช่น รอบที่ 1)',
  `indicator_id` int UNSIGNED NOT NULL COMMENT 'รหัสตัวชี้วัด (FK)',
  `amp_code` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสอำเภอ (FK)',
  `target_amount` decimal(12, 2) NULL DEFAULT 0.00 COMMENT 'ค่าเป้าหมาย (Target/ตัวตั้ง)',
  `result_amount` decimal(12, 2) NULL DEFAULT 0.00 COMMENT 'ผลการดำเนินงาน (Result/ตัวหาร)',
  `result_rate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT 'อัตราผลงานที่คำนวณได้ (ร้อยละหรืออัตรา)',
  `score` int NULL DEFAULT 0 COMMENT 'คะแนนที่ได้ (1-5)',
  `status` enum('DRAFT','SUBMITTED','WAITING_PROVINCE','APPROVED','REJECTED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'APPROVED' COMMENT 'สถานะข้อมูล',
  `evidence_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อไฟล์หลักฐานแนบ',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'หมายเหตุเพิ่มเติม',
  `updated_by` int NULL DEFAULT NULL COMMENT 'รหัสผู้บันทึกรายการ (FK)',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันเวลาที่แก้ไขล่าสุด',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_res_ind`(`indicator_id` ASC) USING BTREE,
  INDEX `idx_kpi_res_amp`(`amp_code` ASC) USING BTREE,
  CONSTRAINT `fk_res_amp` FOREIGN KEY (`amp_code`) REFERENCES `campur` (`ampurcodefull`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_res_ind` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 739 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ตารางเก็บผลการดำเนินงานตัวชี้วัด (Transaction)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_results
-- ----------------------------
INSERT INTO `kpi_results` VALUES (1, '2569', '1', 1, '4601', 343.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (2, '2569', '1', 1, '4602', 8.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (3, '2569', '1', 1, '4603', 57.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (4, '2569', '1', 1, '4604', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (5, '2569', '1', 1, '4605', 172.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (6, '2569', '1', 1, '4606', 18.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (7, '2569', '1', 1, '4607', 176.00, 1.00, 568.18, 1, 'APPROVED', NULL, NULL, 26, '2026-01-28 10:50:33');
INSERT INTO `kpi_results` VALUES (8, '2569', '1', 1, '4608', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (9, '2569', '1', 1, '4609', 13.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (10, '2569', '1', 1, '4610', 15.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (11, '2569', '1', 1, '4611', 11.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (12, '2569', '1', 1, '4612', 12.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (13, '2569', '1', 1, '4613', 123.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (14, '2569', '1', 1, '4614', 10.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (15, '2569', '1', 1, '4615', 7.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (16, '2569', '1', 1, '4616', 10.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (17, '2569', '1', 1, '4617', 40.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (18, '2569', '1', 1, '4618', 8.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 26, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (19, '2569', '1', 30, '4601', 10.00, 8.61, 8.61, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (20, '2569', '1', 30, '4602', 10.00, 9.17, 9.17, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (21, '2569', '1', 30, '4603', 10.00, 4.61, 4.61, 2, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (22, '2569', '1', 30, '4604', 10.00, 7.56, 7.56, 4, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (23, '2569', '1', 30, '4605', 10.00, 4.05, 4.05, 2, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (24, '2569', '1', 30, '4606', 10.00, 9.18, 9.18, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (25, '2569', '1', 30, '4607', 10.00, 5.35, 5.35, 2, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (26, '2569', '1', 30, '4608', 10.00, 9.18, 9.18, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (27, '2569', '1', 30, '4609', 10.00, 9.73, 9.73, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (28, '2569', '1', 30, '4610', 10.00, 6.47, 6.47, 3, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (29, '2569', '1', 30, '4611', 10.00, 9.30, 9.30, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (30, '2569', '1', 30, '4612', 10.00, 9.33, 9.33, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (31, '2569', '1', 30, '4613', 10.00, 7.28, 7.28, 4, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (32, '2569', '1', 30, '4614', 10.00, 9.51, 9.51, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (33, '2569', '1', 30, '4615', 10.00, 7.28, 7.28, 4, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (34, '2569', '1', 30, '4616', 10.00, 9.10, 9.10, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (35, '2569', '1', 30, '4617', 10.00, 9.04, 9.04, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (36, '2569', '1', 30, '4618', 10.00, 9.78, 9.78, 5, 'APPROVED', NULL, NULL, 6, '2026-02-24 16:35:02');
INSERT INTO `kpi_results` VALUES (37, '2569', '1', 27, '4601', 1976.00, 796.00, 40.28, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (38, '2569', '1', 27, '4602', 76.00, 51.00, 67.11, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (39, '2569', '1', 27, '4603', 621.00, 296.00, 47.67, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (40, '2569', '1', 27, '4604', 300.00, 121.00, 40.33, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (41, '2569', '1', 27, '4605', 342.00, 127.00, 37.13, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (42, '2569', '1', 27, '4606', 327.00, 92.00, 28.13, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (43, '2569', '1', 27, '4607', 1090.00, 353.00, 32.39, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (44, '2569', '1', 27, '4608', 35.00, 21.00, 60.00, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (45, '2569', '1', 27, '4609', 296.00, 87.00, 29.39, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (46, '2569', '1', 27, '4610', 262.00, 79.00, 30.15, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (47, '2569', '1', 27, '4611', 195.00, 76.00, 38.97, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (48, '2569', '1', 27, '4612', 481.00, 135.00, 28.07, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (49, '2569', '1', 27, '4613', 843.00, 398.00, 47.21, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (50, '2569', '1', 27, '4614', 197.00, 56.00, 28.43, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (51, '2569', '1', 27, '4615', 129.00, 38.00, 29.46, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (52, '2569', '1', 27, '4616', 207.00, 58.00, 28.02, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (53, '2569', '1', 27, '4617', 56.00, 24.00, 42.86, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (54, '2569', '1', 27, '4618', 204.00, 65.00, 31.86, 5, 'APPROVED', NULL, NULL, 9, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (55, '2569', '1', 31, '4601', 142358.00, 1.00, 0.70, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (56, '2569', '1', 31, '4602', 35958.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (57, '2569', '1', 31, '4603', 67069.00, 1.00, 1.49, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (58, '2569', '1', 31, '4604', 16280.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (59, '2569', '1', 31, '4605', 99626.00, 2.00, 2.01, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (60, '2569', '1', 31, '4606', 33155.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (61, '2569', '1', 31, '4607', 124938.00, 8.00, 6.40, 3, 'APPROVED', NULL, NULL, 1, '2026-01-30 00:25:33');
INSERT INTO `kpi_results` VALUES (62, '2569', '1', 31, '4608', 50184.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (63, '2569', '1', 31, '4609', 42037.00, 1.00, 2.38, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (64, '2569', '1', 31, '4610', 48226.00, 2.00, 4.15, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (65, '2569', '1', 31, '4611', 37114.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (66, '2569', '1', 31, '4612', 64653.00, 2.00, 3.09, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (67, '2569', '1', 31, '4613', 60994.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (68, '2569', '1', 31, '4614', 29699.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (69, '2569', '1', 31, '4615', 25034.00, 1.00, 3.99, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (70, '2569', '1', 31, '4616', 30336.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (71, '2569', '1', 31, '4617', 25834.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (72, '2569', '1', 31, '4618', 26176.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (73, '2569', '1', 33, '4601', 42.00, 37.00, 88.10, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (74, '2569', '1', 33, '4602', 75.00, 63.00, 84.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (75, '2569', '1', 33, '4603', 54.00, 34.00, 62.96, 1, 'APPROVED', NULL, NULL, 15, '2026-02-28 08:32:22');
INSERT INTO `kpi_results` VALUES (76, '2569', '1', 33, '4604', 8.00, 7.00, 87.50, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (77, '2569', '1', 33, '4605', 127.00, 124.00, 97.64, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (78, '2569', '1', 33, '4606', 33.00, 30.00, 90.91, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (79, '2569', '1', 33, '4607', 10.00, 10.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (80, '2569', '1', 33, '4608', 7.00, 7.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (81, '2569', '1', 33, '4609', 124.00, 92.00, 74.19, 4, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (82, '2569', '1', 33, '4610', 88.00, 87.00, 98.86, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (83, '2569', '1', 33, '4611', 1.00, 1.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (84, '2569', '1', 33, '4612', 41.00, 33.00, 80.49, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (85, '2569', '1', 33, '4613', 38.00, 36.00, 94.74, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (86, '2569', '1', 33, '4614', 5.00, 4.00, 80.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (87, '2569', '1', 33, '4615', 1.00, 1.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (88, '2569', '1', 33, '4616', 2.00, 2.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (89, '2569', '1', 33, '4617', 72.00, 68.00, 94.44, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (90, '2569', '1', 33, '4618', 49.00, 47.00, 95.92, 5, 'APPROVED', NULL, NULL, 15, '2026-02-24 20:39:32');
INSERT INTO `kpi_results` VALUES (91, '2569', '1', 35, '4601', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (92, '2569', '1', 35, '4602', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (93, '2569', '1', 35, '4603', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (94, '2569', '1', 35, '4604', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (95, '2569', '1', 35, '4605', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (96, '2569', '1', 35, '4606', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (97, '2569', '1', 35, '4607', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (98, '2569', '1', 35, '4608', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (99, '2569', '1', 35, '4609', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (100, '2569', '1', 35, '4610', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (101, '2569', '1', 35, '4611', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (102, '2569', '1', 35, '4612', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (103, '2569', '1', 35, '4613', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (104, '2569', '1', 35, '4614', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (105, '2569', '1', 35, '4615', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (106, '2569', '1', 35, '4616', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (107, '2569', '1', 35, '4617', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (108, '2569', '1', 35, '4618', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 1, '2026-01-30 02:00:28');
INSERT INTO `kpi_results` VALUES (109, '2569', '1', 2, '4601', 1045.00, 870.00, 83.25, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (110, '2569', '1', 2, '4602', 330.00, 291.00, 88.18, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (111, '2569', '1', 2, '4603', 541.00, 507.00, 93.72, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (112, '2569', '1', 2, '4604', 111.00, 104.00, 93.69, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (113, '2569', '1', 2, '4605', 806.00, 683.00, 84.74, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (114, '2569', '1', 2, '4606', 231.00, 225.00, 97.40, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (115, '2569', '1', 2, '4607', 910.00, 831.00, 91.32, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (116, '2569', '1', 2, '4608', 430.00, 429.00, 99.77, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (117, '2569', '1', 2, '4609', 207.00, 189.00, 91.30, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (118, '2569', '1', 2, '4610', 427.00, 373.00, 87.35, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (119, '2569', '1', 2, '4611', 363.00, 353.00, 97.25, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (120, '2569', '1', 2, '4612', 532.00, 438.00, 82.33, 4, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (121, '2569', '1', 2, '4613', 393.00, 374.00, 95.17, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (122, '2569', '1', 2, '4614', 224.00, 205.00, 91.52, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (123, '2569', '1', 2, '4615', 196.00, 189.00, 96.43, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (124, '2569', '1', 2, '4616', 200.00, 180.00, 90.00, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (125, '2569', '1', 2, '4617', 220.00, 213.00, 96.82, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (126, '2569', '1', 2, '4618', 198.00, 183.00, 92.42, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:38:58');
INSERT INTO `kpi_results` VALUES (127, '2569', '1', 4, '4601', 1531.00, 1226.00, 80.08, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (128, '2569', '1', 4, '4602', 527.00, 455.00, 86.34, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (129, '2569', '1', 4, '4603', 964.00, 777.00, 80.60, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (130, '2569', '1', 4, '4604', 281.00, 220.00, 78.29, 4, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (131, '2569', '1', 4, '4605', 1749.00, 1371.00, 78.39, 4, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (132, '2569', '1', 4, '4606', 731.00, 661.00, 90.42, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (133, '2569', '1', 4, '4607', 1956.00, 1522.00, 77.81, 4, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (134, '2569', '1', 4, '4608', 1231.00, 1025.00, 83.27, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (135, '2569', '1', 4, '4609', 362.00, 303.00, 83.70, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (136, '2569', '1', 4, '4610', 599.00, 510.00, 85.14, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (137, '2569', '1', 4, '4611', 536.00, 510.00, 95.15, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (138, '2569', '1', 4, '4612', 1084.00, 980.00, 90.41, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (139, '2569', '1', 4, '4613', 1201.00, 973.00, 81.02, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (140, '2569', '1', 4, '4614', 520.00, 402.00, 77.31, 4, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (141, '2569', '1', 4, '4615', 381.00, 317.00, 83.20, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (142, '2569', '1', 4, '4616', 558.00, 452.00, 81.00, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (143, '2569', '1', 4, '4617', 678.00, 603.00, 88.94, 5, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (144, '2569', '1', 4, '4618', 564.00, 440.00, 78.01, 4, 'APPROVED', NULL, NULL, 11, '2026-02-24 20:07:29');
INSERT INTO `kpi_results` VALUES (145, '2569', '1', 7, '4601', 381.00, 218.00, 57.22, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (146, '2569', '1', 7, '4602', 47.00, 25.00, 53.19, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (147, '2569', '1', 7, '4603', 136.00, 76.00, 55.88, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (148, '2569', '1', 7, '4604', 10.00, 6.00, 60.00, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (149, '2569', '1', 7, '4605', 134.00, 62.00, 46.27, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (150, '2569', '1', 7, '4606', 56.00, 26.00, 46.43, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (151, '2569', '1', 7, '4607', 318.00, 250.00, 78.62, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (152, '2569', '1', 7, '4608', 154.00, 102.00, 66.23, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (153, '2569', '1', 7, '4609', 96.00, 31.00, 32.29, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (154, '2569', '1', 7, '4610', 224.00, 146.00, 65.18, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (155, '2569', '1', 7, '4611', 11.00, 9.00, 81.82, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (156, '2569', '1', 7, '4612', 127.00, 112.00, 88.19, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (157, '2569', '1', 7, '4613', 94.00, 68.00, 72.34, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (158, '2569', '1', 7, '4614', 20.00, 17.00, 85.00, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (159, '2569', '1', 7, '4615', 46.00, 24.00, 52.17, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (160, '2569', '1', 7, '4616', 199.00, 126.00, 63.32, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (161, '2569', '1', 7, '4617', 41.00, 21.00, 51.22, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (162, '2569', '1', 7, '4618', 122.00, 80.00, 65.57, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:28:19');
INSERT INTO `kpi_results` VALUES (163, '2569', '1', 8, '4601', 1104.00, 974.00, 88.22, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (164, '2569', '1', 8, '4602', 214.00, 188.00, 87.85, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (165, '2569', '1', 8, '4603', 472.00, 360.00, 76.27, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (166, '2569', '1', 8, '4604', 56.00, 53.00, 94.64, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (167, '2569', '1', 8, '4605', 392.00, 342.00, 87.24, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (168, '2569', '1', 8, '4606', 110.00, 75.00, 68.18, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (169, '2569', '1', 8, '4607', 1249.00, 1050.00, 84.07, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (170, '2569', '1', 8, '4608', 310.00, 308.00, 99.35, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (171, '2569', '1', 8, '4609', 375.00, 291.00, 77.60, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (172, '2569', '1', 8, '4610', 846.00, 680.00, 80.38, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (173, '2569', '1', 8, '4611', 157.00, 151.00, 96.18, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (174, '2569', '1', 8, '4612', 811.00, 692.00, 85.33, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (175, '2569', '1', 8, '4613', 242.00, 233.00, 96.28, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (176, '2569', '1', 8, '4614', 130.00, 127.00, 97.69, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (177, '2569', '1', 8, '4615', 251.00, 176.00, 70.12, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (178, '2569', '1', 8, '4616', 512.00, 507.00, 99.02, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (179, '2569', '1', 8, '4617', 144.00, 120.00, 83.33, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (180, '2569', '1', 8, '4618', 393.00, 360.00, 91.60, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 13:33:20');
INSERT INTO `kpi_results` VALUES (181, '2569', '1', 9, '4601', 10082.00, 2289.00, 22.70, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (182, '2569', '1', 9, '4602', 2198.00, 426.00, 19.38, 2, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (183, '2569', '1', 9, '4603', 5980.00, 1445.00, 24.16, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (184, '2569', '1', 9, '4604', 1278.00, 215.00, 16.82, 2, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (185, '2569', '1', 9, '4605', 7788.00, 1364.00, 17.51, 2, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (186, '2569', '1', 9, '4606', 3295.00, 1217.00, 36.93, 4, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (187, '2569', '1', 9, '4607', 9763.00, 2077.00, 21.27, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (188, '2569', '1', 9, '4608', 3407.00, 779.00, 22.86, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (189, '2569', '1', 9, '4609', 2719.00, 724.00, 26.63, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (190, '2569', '1', 9, '4610', 3874.00, 2090.00, 53.95, 5, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (191, '2569', '1', 9, '4611', 2631.00, 680.00, 25.85, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (192, '2569', '1', 9, '4612', 4154.00, 673.00, 16.20, 2, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (193, '2569', '1', 9, '4613', 3995.00, 1188.00, 29.74, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (194, '2569', '1', 9, '4614', 2239.00, 279.00, 12.46, 2, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (195, '2569', '1', 9, '4615', 1920.00, 779.00, 40.57, 5, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (196, '2569', '1', 9, '4616', 2860.00, 787.00, 27.52, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (197, '2569', '1', 9, '4617', 2081.00, 473.00, 22.73, 3, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (198, '2569', '1', 9, '4618', 2528.00, 956.00, 37.82, 4, 'APPROVED', NULL, NULL, 17, '2026-02-27 15:09:49');
INSERT INTO `kpi_results` VALUES (199, '2569', '1', 10, '4601', 14325.00, 8077.00, 56.38, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (200, '2569', '1', 10, '4602', 3725.00, 2215.00, 59.46, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (201, '2569', '1', 10, '4603', 10715.00, 5942.00, 55.45, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (202, '2569', '1', 10, '4604', 2035.00, 1403.00, 68.94, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (203, '2569', '1', 10, '4605', 12742.00, 7299.00, 57.28, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (204, '2569', '1', 10, '4606', 5046.00, 3774.00, 74.79, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (205, '2569', '1', 10, '4607', 12259.00, 7449.00, 60.76, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (206, '2569', '1', 10, '4608', 5305.00, 3671.00, 69.20, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (207, '2569', '1', 10, '4609', 3966.00, 2646.00, 66.72, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (208, '2569', '1', 10, '4610', 5873.00, 4300.00, 73.22, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (209, '2569', '1', 10, '4611', 4200.00, 2820.00, 67.14, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (210, '2569', '1', 10, '4612', 6508.00, 3948.00, 60.66, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (211, '2569', '1', 10, '4613', 6652.00, 4218.00, 63.41, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (212, '2569', '1', 10, '4614', 3634.00, 1978.00, 54.43, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (213, '2569', '1', 10, '4615', 2694.00, 1368.00, 50.78, 4, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (214, '2569', '1', 10, '4616', 4892.00, 3017.00, 61.67, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (215, '2569', '1', 10, '4617', 2987.00, 2171.00, 72.68, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (216, '2569', '1', 10, '4618', 4209.00, 2654.00, 63.06, 5, 'APPROVED', NULL, NULL, 17, '2026-02-22 14:01:27');
INSERT INTO `kpi_results` VALUES (217, '2569', '1', 19, '4601', 357.00, 179.00, 50.14, 1, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (218, '2569', '1', 19, '4602', 3.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (219, '2569', '1', 19, '4603', 32.00, 2.00, 6.25, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (220, '2569', '1', 19, '4604', 4.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (221, '2569', '1', 19, '4605', 35.00, 1.00, 2.86, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (222, '2569', '1', 19, '4606', 13.00, 1.00, 7.69, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (223, '2569', '1', 19, '4607', 28.00, 7.00, 25.00, 4, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (224, '2569', '1', 19, '4608', 15.00, 1.00, 6.67, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (225, '2569', '1', 19, '4609', 13.00, 1.00, 7.69, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (226, '2569', '1', 19, '4610', 17.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (227, '2569', '1', 19, '4611', 3.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (228, '2569', '1', 19, '4612', 30.00, 1.00, 3.33, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (229, '2569', '1', 19, '4613', 19.00, 1.00, 5.26, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (230, '2569', '1', 19, '4614', 7.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (231, '2569', '1', 19, '4615', 18.00, 2.00, 11.11, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (232, '2569', '1', 19, '4616', 18.00, 2.00, 11.11, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (233, '2569', '1', 19, '4617', 4.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (234, '2569', '1', 19, '4618', 8.00, 1.00, 12.50, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:23:29');
INSERT INTO `kpi_results` VALUES (235, '2569', '1', 20, '4601', 465.00, 27.00, 5.81, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (236, '2569', '1', 20, '4602', 6.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (237, '2569', '1', 20, '4603', 83.00, 3.00, 3.61, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (238, '2569', '1', 20, '4604', 4.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (239, '2569', '1', 20, '4605', 61.00, 1.00, 1.64, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (240, '2569', '1', 20, '4606', 6.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (241, '2569', '1', 20, '4607', 82.00, 2.00, 2.44, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (242, '2569', '1', 20, '4608', 12.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (243, '2569', '1', 20, '4609', 4.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (244, '2569', '1', 20, '4610', 6.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (245, '2569', '1', 20, '4611', 26.00, 1.00, 3.85, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (246, '2569', '1', 20, '4612', 16.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (247, '2569', '1', 20, '4613', 44.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (248, '2569', '1', 20, '4614', 3.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (249, '2569', '1', 20, '4615', 3.00, 1.00, 33.33, 1, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (250, '2569', '1', 20, '4616', 3.00, 1.00, 33.33, 1, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (251, '2569', '1', 20, '4617', 2.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (252, '2569', '1', 20, '4618', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:27:02');
INSERT INTO `kpi_results` VALUES (253, '2569', '1', 21, '4601', 38.00, 2.00, 5.26, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (254, '2569', '1', 21, '4602', 5.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (255, '2569', '1', 21, '4603', 16.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (256, '2569', '1', 21, '4604', 2.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (257, '2569', '1', 21, '4605', 11.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (258, '2569', '1', 21, '4606', 5.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (259, '2569', '1', 21, '4607', 18.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (260, '2569', '1', 21, '4608', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (261, '2569', '1', 21, '4609', 7.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (262, '2569', '1', 21, '4610', 7.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (263, '2569', '1', 21, '4611', 4.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (264, '2569', '1', 21, '4612', 12.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (265, '2569', '1', 21, '4613', 7.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (266, '2569', '1', 21, '4614', 5.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (267, '2569', '1', 21, '4615', 3.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (268, '2569', '1', 21, '4616', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (269, '2569', '1', 21, '4617', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (270, '2569', '1', 21, '4618', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:28:23');
INSERT INTO `kpi_results` VALUES (271, '2569', '1', 22, '4601', 356.00, 1.00, 2.81, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (272, '2569', '1', 22, '4602', 7.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (273, '2569', '1', 22, '4603', 92.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (274, '2569', '1', 22, '4604', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (275, '2569', '1', 22, '4605', 218.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (276, '2569', '1', 22, '4606', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (277, '2569', '1', 22, '4607', 205.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (278, '2569', '1', 22, '4608', 3.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (279, '2569', '1', 22, '4609', 16.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (280, '2569', '1', 22, '4610', 16.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (281, '2569', '1', 22, '4611', 12.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (282, '2569', '1', 22, '4612', 10.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (283, '2569', '1', 22, '4613', 244.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (284, '2569', '1', 22, '4614', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (285, '2569', '1', 22, '4615', 1.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (286, '2569', '1', 22, '4616', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (287, '2569', '1', 22, '4617', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (288, '2569', '1', 22, '4618', 0.00, 0.00, 0.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-13 10:29:27');
INSERT INTO `kpi_results` VALUES (289, '2569', '1', 23, '4601', 5302.00, 484.00, 9.13, 1, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (290, '2569', '1', 23, '4602', 1378.00, 681.00, 49.42, 4, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (291, '2569', '1', 23, '4603', 2466.00, 1050.00, 42.58, 4, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (292, '2569', '1', 23, '4604', 591.00, 245.00, 41.46, 4, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (293, '2569', '1', 23, '4605', 3519.00, 393.00, 11.17, 1, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (294, '2569', '1', 23, '4606', 1283.00, 507.00, 39.52, 3, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (295, '2569', '1', 23, '4607', 4766.00, 761.00, 15.97, 1, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (296, '2569', '1', 23, '4608', 1791.00, 784.00, 43.77, 4, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (297, '2569', '1', 23, '4609', 1485.00, 253.00, 17.04, 1, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (298, '2569', '1', 23, '4610', 1627.00, 349.00, 21.45, 2, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (299, '2569', '1', 23, '4611', 1249.00, 971.00, 77.74, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (300, '2569', '1', 23, '4612', 2375.00, 2179.00, 91.75, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (301, '2569', '1', 23, '4613', 2144.00, 1109.00, 51.73, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (302, '2569', '1', 23, '4614', 1009.00, 301.00, 29.83, 2, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (303, '2569', '1', 23, '4615', 715.00, 91.00, 12.73, 1, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (304, '2569', '1', 23, '4616', 1081.00, 430.00, 39.78, 3, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (305, '2569', '1', 23, '4617', 948.00, 425.00, 44.83, 4, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (306, '2569', '1', 23, '4618', 914.00, 298.00, 32.60, 3, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:37:37');
INSERT INTO `kpi_results` VALUES (307, '2569', '1', 25, '4601', 4199.00, 698.00, 16.62, 1, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (308, '2569', '1', 25, '4602', 1015.00, 977.00, 96.26, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (309, '2569', '1', 25, '4603', 2063.00, 1836.00, 89.00, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (310, '2569', '1', 25, '4604', 489.00, 449.00, 91.82, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (311, '2569', '1', 25, '4605', 3046.00, 1233.00, 40.48, 4, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (312, '2569', '1', 25, '4606', 1059.00, 1227.00, 115.86, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (313, '2569', '1', 25, '4607', 3879.00, 3331.00, 85.87, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (314, '2569', '1', 25, '4608', 1487.00, 1452.00, 97.65, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (315, '2569', '1', 25, '4609', 1246.00, 1395.00, 111.96, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (316, '2569', '1', 25, '4610', 1374.00, 1375.00, 100.07, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (317, '2569', '1', 25, '4611', 1005.00, 660.00, 65.67, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (318, '2569', '1', 25, '4612', 1840.00, 1246.00, 67.72, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (319, '2569', '1', 25, '4613', 1783.00, 1784.00, 100.06, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (320, '2569', '1', 25, '4614', 907.00, 341.00, 37.60, 3, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (321, '2569', '1', 25, '4615', 719.00, 500.00, 69.54, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (322, '2569', '1', 25, '4616', 1010.00, 824.00, 81.58, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (323, '2569', '1', 25, '4617', 735.00, 1279.00, 174.01, 5, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (324, '2569', '1', 25, '4618', 830.00, 255.00, 30.72, 3, 'APPROVED', NULL, NULL, 1, '2026-02-23 09:44:02');
INSERT INTO `kpi_results` VALUES (325, '2569', '1', 29, '4601', 59362.00, 27623.00, 46.53, 4, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (326, '2569', '1', 29, '4602', 17264.00, 9051.00, 52.43, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (327, '2569', '1', 29, '4603', 32031.00, 8765.00, 27.36, 1, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (328, '2569', '1', 29, '4604', 4239.00, 2257.00, 53.24, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (329, '2569', '1', 29, '4605', 37137.00, 17408.00, 46.88, 4, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (330, '2569', '1', 29, '4606', 12897.00, 5015.00, 38.89, 1, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (331, '2569', '1', 29, '4607', 42133.00, 27310.00, 64.82, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (332, '2569', '1', 29, '4608', 17415.00, 9563.00, 54.91, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (333, '2569', '1', 29, '4609', 12149.00, 6257.00, 51.50, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (334, '2569', '1', 29, '4610', 18782.00, 8427.00, 44.87, 2, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (335, '2569', '1', 29, '4611', 18273.00, 11547.00, 63.19, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (336, '2569', '1', 29, '4612', 21929.00, 10733.00, 48.94, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (337, '2569', '1', 29, '4613', 22756.00, 11630.00, 51.11, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (338, '2569', '1', 29, '4614', 10995.00, 5565.00, 50.61, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (339, '2569', '1', 29, '4615', 4470.00, 3534.00, 79.06, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (340, '2569', '1', 29, '4616', 21288.00, 15285.00, 71.80, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (341, '2569', '1', 29, '4617', 20731.00, 9806.00, 47.30, 5, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (342, '2569', '1', 29, '4618', 15528.00, 6593.00, 42.46, 1, 'APPROVED', NULL, NULL, 7, '2026-02-26 15:23:09');
INSERT INTO `kpi_results` VALUES (343, '2569', '1', 6, '4601', 2939.00, 3404.00, 115.82, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (344, '2569', '1', 6, '4602', 1273.00, 1265.00, 99.37, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (345, '2569', '1', 6, '4603', 1757.00, 4193.00, 238.65, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (346, '2569', '1', 6, '4604', 964.00, 1408.00, 146.06, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (347, '2569', '1', 6, '4605', 2265.00, 2575.00, 113.69, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (348, '2569', '1', 6, '4606', 1228.00, 1584.00, 128.99, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (349, '2569', '1', 6, '4607', 2659.00, 4795.00, 180.33, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (350, '2569', '1', 6, '4608', 1495.00, 2294.00, 153.44, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (351, '2569', '1', 6, '4609', 1367.00, 1401.00, 102.49, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (352, '2569', '1', 6, '4610', 1464.00, 3290.00, 224.73, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (353, '2569', '1', 6, '4611', 1295.00, 1985.00, 153.28, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (354, '2569', '1', 6, '4612', 1721.00, 2725.00, 158.34, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (355, '2569', '1', 6, '4613', 1664.00, 4039.00, 242.73, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (356, '2569', '1', 6, '4614', 1174.00, 1711.00, 145.74, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (357, '2569', '1', 6, '4615', 1101.00, 4400.00, 399.64, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (358, '2569', '1', 6, '4616', 1182.00, 1154.00, 97.63, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (359, '2569', '1', 6, '4617', 1114.00, 1349.00, 121.10, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (360, '2569', '1', 6, '4618', 1118.00, 1251.00, 111.90, 5, 'APPROVED', NULL, NULL, 19, '2026-02-26 12:46:02');
INSERT INTO `kpi_results` VALUES (361, '2569', '1', 16, '4601', 100.00, 97.00, 97.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (362, '2569', '1', 16, '4602', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (363, '2569', '1', 16, '4603', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (364, '2569', '1', 16, '4604', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (365, '2569', '1', 16, '4605', 100.00, 97.00, 97.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (366, '2569', '1', 16, '4606', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (367, '2569', '1', 16, '4607', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (368, '2569', '1', 16, '4608', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (369, '2569', '1', 16, '4609', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (370, '2569', '1', 16, '4610', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (371, '2569', '1', 16, '4611', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (372, '2569', '1', 16, '4612', 100.00, 94.00, 94.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (373, '2569', '1', 16, '4613', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (374, '2569', '1', 16, '4614', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (375, '2569', '1', 16, '4615', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (376, '2569', '1', 16, '4616', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (377, '2569', '1', 16, '4617', 100.00, 91.00, 91.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (378, '2569', '1', 16, '4618', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-02-10 10:00:38');
INSERT INTO `kpi_results` VALUES (379, '2569', '1', 17, '4601', 100.00, 100.00, 100.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (380, '2569', '1', 17, '4602', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (381, '2569', '1', 17, '4603', 100.00, 94.00, 94.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (382, '2569', '1', 17, '4604', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (383, '2569', '1', 17, '4605', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (384, '2569', '1', 17, '4606', 100.00, 94.00, 94.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (385, '2569', '1', 17, '4607', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (386, '2569', '1', 17, '4608', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (387, '2569', '1', 17, '4609', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (388, '2569', '1', 17, '4610', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (389, '2569', '1', 17, '4611', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (390, '2569', '1', 17, '4612', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (391, '2569', '1', 17, '4613', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (392, '2569', '1', 17, '4614', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (393, '2569', '1', 17, '4615', 100.00, 92.00, 92.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (394, '2569', '1', 17, '4616', 100.00, 94.00, 94.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (395, '2569', '1', 17, '4617', 100.00, 93.00, 93.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (396, '2569', '1', 17, '4618', 100.00, 96.00, 96.00, 5, 'APPROVED', NULL, NULL, 10, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (397, '2569', '1', 5, '4601', 17.00, 17.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (398, '2569', '1', 5, '4602', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (399, '2569', '1', 5, '4603', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (400, '2569', '1', 5, '4604', 3.00, 3.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (401, '2569', '1', 5, '4605', 12.00, 12.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (402, '2569', '1', 5, '4606', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (403, '2569', '1', 5, '4607', 13.00, 13.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (404, '2569', '1', 5, '4608', 9.00, 9.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (405, '2569', '1', 5, '4609', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (406, '2569', '1', 5, '4610', 6.00, 6.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (407, '2569', '1', 5, '4611', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (408, '2569', '1', 5, '4612', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (409, '2569', '1', 5, '4613', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (410, '2569', '1', 5, '4614', 4.00, 4.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (411, '2569', '1', 5, '4615', 4.00, 4.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (412, '2569', '1', 5, '4616', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (413, '2569', '1', 5, '4617', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (414, '2569', '1', 5, '4618', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 5, '2026-02-13 09:55:15');
INSERT INTO `kpi_results` VALUES (415, '2569', '1', 11, '4601', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (416, '2569', '1', 11, '4602', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (417, '2569', '1', 11, '4603', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (418, '2569', '1', 11, '4604', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (419, '2569', '1', 11, '4605', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (420, '2569', '1', 11, '4606', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (421, '2569', '1', 11, '4607', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (422, '2569', '1', 11, '4608', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (423, '2569', '1', 11, '4609', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (424, '2569', '1', 11, '4610', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (425, '2569', '1', 11, '4611', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (426, '2569', '1', 11, '4612', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (427, '2569', '1', 11, '4613', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (428, '2569', '1', 11, '4614', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (429, '2569', '1', 11, '4615', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (430, '2569', '1', 11, '4616', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (431, '2569', '1', 11, '4617', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (432, '2569', '1', 11, '4618', 45.00, 5.00, 11.11, 5, 'APPROVED', NULL, NULL, 25, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (433, '2569', '1', 15, '4601', 232.00, 101.00, 56.47, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (434, '2569', '1', 15, '4602', 32.00, 16.00, 50.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (435, '2569', '1', 15, '4603', 115.00, 77.00, 33.04, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (436, '2569', '1', 15, '4604', 34.00, 28.00, 17.65, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (437, '2569', '1', 15, '4605', 81.00, 44.00, 45.68, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (438, '2569', '1', 15, '4606', 58.00, 14.00, 75.86, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (439, '2569', '1', 15, '4607', 215.00, 82.00, 61.86, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (440, '2569', '1', 15, '4608', 64.00, 26.00, 59.38, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (441, '2569', '1', 15, '4609', 28.00, 13.00, 53.57, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (442, '2569', '1', 15, '4610', 71.00, 44.00, 38.03, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (443, '2569', '1', 15, '4611', 39.00, 11.00, 71.79, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (444, '2569', '1', 15, '4612', 101.00, 68.00, 32.67, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (445, '2569', '1', 15, '4613', 82.00, 31.00, 62.20, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (446, '2569', '1', 15, '4614', 50.00, 24.00, 52.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (447, '2569', '1', 15, '4615', 31.00, 20.00, 35.48, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (448, '2569', '1', 15, '4616', 58.00, 35.00, 39.66, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (449, '2569', '1', 15, '4617', 22.00, 11.00, 50.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (450, '2569', '1', 15, '4618', 35.00, 21.00, 40.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-05 09:40:31');
INSERT INTO `kpi_results` VALUES (451, '2569', '1', 37, '4601', 5.00, 2.00, 2.00, 2, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (452, '2569', '1', 37, '4602', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (453, '2569', '1', 37, '4603', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (454, '2569', '1', 37, '4604', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (455, '2569', '1', 37, '4605', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (456, '2569', '1', 37, '4606', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (457, '2569', '1', 37, '4607', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (458, '2569', '1', 37, '4608', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (459, '2569', '1', 37, '4609', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (460, '2569', '1', 37, '4610', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (461, '2569', '1', 37, '4611', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (462, '2569', '1', 37, '4612', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (463, '2569', '1', 37, '4613', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (464, '2569', '1', 37, '4614', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (465, '2569', '1', 37, '4615', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (466, '2569', '1', 37, '4616', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (467, '2569', '1', 37, '4617', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (468, '2569', '1', 37, '4618', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 23, '2026-02-24 16:33:54');
INSERT INTO `kpi_results` VALUES (469, '2569', '1', 13, '4601', 171.00, 150.00, 87.72, 4, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (470, '2569', '1', 13, '4602', 55.00, 50.00, 90.91, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (471, '2569', '1', 13, '4603', 101.00, 100.00, 99.01, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (472, '2569', '1', 13, '4604', 24.00, 24.00, 100.00, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (473, '2569', '1', 13, '4605', 139.00, 127.00, 91.37, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (474, '2569', '1', 13, '4606', 32.00, 32.00, 100.00, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (475, '2569', '1', 13, '4607', 144.00, 137.00, 95.14, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (476, '2569', '1', 13, '4608', 60.00, 59.00, 98.33, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (477, '2569', '1', 13, '4609', 51.00, 49.00, 96.08, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (478, '2569', '1', 13, '4610', 77.00, 74.00, 96.10, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (479, '2569', '1', 13, '4611', 74.00, 69.00, 93.24, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (480, '2569', '1', 13, '4612', 113.00, 108.00, 95.58, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (481, '2569', '1', 13, '4613', 77.00, 77.00, 100.00, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (482, '2569', '1', 13, '4614', 43.00, 42.00, 97.67, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (483, '2569', '1', 13, '4615', 23.00, 22.00, 95.65, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (484, '2569', '1', 13, '4616', 42.00, 42.00, 100.00, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (485, '2569', '1', 13, '4617', 43.00, 43.00, 100.00, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (486, '2569', '1', 13, '4618', 32.00, 32.00, 100.00, 5, 'APPROVED', NULL, NULL, 29, '2026-02-27 20:38:00');
INSERT INTO `kpi_results` VALUES (487, '2569', '1', 12, '4601', 67.00, 38.00, 56.72, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (488, '2569', '1', 12, '4602', 35.00, 17.00, 48.57, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (489, '2569', '1', 12, '4603', 11.00, -9.00, -81.82, 1, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (490, '2569', '1', 12, '4604', 7.00, 2.00, 28.57, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (491, '2569', '1', 12, '4605', 33.00, 21.00, 63.64, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (492, '2569', '1', 12, '4606', 11.00, 4.00, 36.36, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (493, '2569', '1', 12, '4607', 58.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (494, '2569', '1', 12, '4608', 9.00, 7.00, 77.78, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (495, '2569', '1', 12, '4609', 8.00, -4.00, -50.00, 1, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (496, '2569', '1', 12, '4610', 42.00, 14.00, 33.33, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (497, '2569', '1', 12, '4611', 4.00, 2.00, 50.00, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (498, '2569', '1', 12, '4612', 83.00, 76.00, 91.57, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (499, '2569', '1', 12, '4613', 16.00, 1.00, 6.25, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (500, '2569', '1', 12, '4614', 12.00, 8.00, 66.67, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (501, '2569', '1', 12, '4615', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (502, '2569', '1', 12, '4616', 35.00, 17.00, 48.57, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (503, '2569', '1', 12, '4617', 6.00, 2.00, 33.33, 5, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (504, '2569', '1', 12, '4618', 3.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 9, '2026-02-03 14:15:01');
INSERT INTO `kpi_results` VALUES (505, '2569', '1', 34, '4601', 136.00, 135.00, 99.26, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (506, '2569', '1', 34, '4602', 3.00, 3.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (507, '2569', '1', 34, '4603', 66.00, 66.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (508, '2569', '1', 34, '4604', 60.00, 60.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (509, '2569', '1', 34, '4605', 93.00, 88.00, 94.62, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (510, '2569', '1', 34, '4606', 41.00, 38.00, 92.68, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (511, '2569', '1', 34, '4607', 451.00, 448.00, 99.33, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (512, '2569', '1', 34, '4608', 83.00, 82.00, 98.80, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (513, '2569', '1', 34, '4609', 22.00, 22.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (514, '2569', '1', 34, '4610', 117.00, 114.00, 97.44, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (515, '2569', '1', 34, '4611', 20.00, 20.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (516, '2569', '1', 34, '4612', 42.00, 42.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (517, '2569', '1', 34, '4613', 73.00, 73.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (518, '2569', '1', 34, '4614', 10.00, 10.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (519, '2569', '1', 34, '4615', 11.00, 11.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (520, '2569', '1', 34, '4616', 17.00, 17.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (521, '2569', '1', 34, '4617', 11.00, 11.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (522, '2569', '1', 34, '4618', 6.00, 6.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (523, '2569', '1', 32, '4601', 71.00, 71.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (524, '2569', '1', 32, '4602', 9.00, 9.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (525, '2569', '1', 32, '4603', 32.00, 32.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (526, '2569', '1', 32, '4604', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (527, '2569', '1', 32, '4605', 15.00, 15.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (528, '2569', '1', 32, '4606', 14.00, 14.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (529, '2569', '1', 32, '4607', 47.00, 46.00, 97.87, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (530, '2569', '1', 32, '4608', 12.00, 12.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (531, '2569', '1', 32, '4609', 9.00, 9.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (532, '2569', '1', 32, '4610', 24.00, 24.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (533, '2569', '1', 32, '4611', 6.00, 6.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (534, '2569', '1', 32, '4612', 39.00, 39.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (535, '2569', '1', 32, '4613', 32.00, 32.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (536, '2569', '1', 32, '4614', 7.00, 7.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (537, '2569', '1', 32, '4615', 6.00, 6.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (538, '2569', '1', 32, '4616', 13.00, 13.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (539, '2569', '1', 32, '4617', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (540, '2569', '1', 32, '4618', 10.00, 10.00, 100.00, 5, 'APPROVED', NULL, NULL, 15, '2026-01-29 23:40:58');
INSERT INTO `kpi_results` VALUES (541, '2569', '1', 40, '4601', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (542, '2569', '1', 40, '4602', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (543, '2569', '1', 40, '4603', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (544, '2569', '1', 40, '4604', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (545, '2569', '1', 40, '4605', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (546, '2569', '1', 40, '4606', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (547, '2569', '1', 40, '4607', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (548, '2569', '1', 40, '4608', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (549, '2569', '1', 40, '4609', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (550, '2569', '1', 40, '4610', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (551, '2569', '1', 40, '4611', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (552, '2569', '1', 40, '4612', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (553, '2569', '1', 40, '4613', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (554, '2569', '1', 40, '4614', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (555, '2569', '1', 40, '4615', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (556, '2569', '1', 40, '4616', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (557, '2569', '1', 40, '4617', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (558, '2569', '1', 40, '4618', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-24 22:09:32');
INSERT INTO `kpi_results` VALUES (559, '2569', '1', 41, '4601', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (560, '2569', '1', 41, '4602', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (561, '2569', '1', 41, '4603', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (562, '2569', '1', 41, '4604', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (563, '2569', '1', 41, '4605', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (564, '2569', '1', 41, '4606', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (565, '2569', '1', 41, '4607', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (566, '2569', '1', 41, '4608', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (567, '2569', '1', 41, '4609', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (568, '2569', '1', 41, '4610', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (569, '2569', '1', 41, '4611', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (570, '2569', '1', 41, '4612', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (571, '2569', '1', 41, '4613', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (572, '2569', '1', 41, '4614', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (573, '2569', '1', 41, '4615', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (574, '2569', '1', 41, '4616', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (575, '2569', '1', 41, '4617', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (576, '2569', '1', 41, '4618', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 21, '2026-02-20 15:37:20');
INSERT INTO `kpi_results` VALUES (577, '2569', '1', 39, '4601', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (578, '2569', '1', 39, '4602', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (579, '2569', '1', 39, '4603', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (580, '2569', '1', 39, '4604', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (581, '2569', '1', 39, '4605', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (582, '2569', '1', 39, '4606', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (583, '2569', '1', 39, '4607', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (584, '2569', '1', 39, '4608', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (585, '2569', '1', 39, '4609', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (586, '2569', '1', 39, '4610', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (587, '2569', '1', 39, '4611', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (588, '2569', '1', 39, '4612', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (589, '2569', '1', 39, '4613', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (590, '2569', '1', 39, '4614', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (591, '2569', '1', 39, '4615', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (592, '2569', '1', 39, '4616', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (593, '2569', '1', 39, '4617', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (594, '2569', '1', 39, '4618', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 20, '2026-02-20 09:43:17');
INSERT INTO `kpi_results` VALUES (595, '2569', '1', 36, '4601', 50.00, 50.00, 50.00, 5, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (596, '2569', '1', 36, '4602', 50.00, 39.00, 39.00, 3, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (597, '2569', '1', 36, '4603', 50.00, 39.00, 39.00, 3, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (598, '2569', '1', 36, '4604', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (599, '2569', '1', 36, '4605', 50.00, 50.00, 50.00, 5, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (600, '2569', '1', 36, '4606', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (601, '2569', '1', 36, '4607', 50.00, 39.00, 39.00, 3, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (602, '2569', '1', 36, '4608', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (603, '2569', '1', 36, '4609', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (604, '2569', '1', 36, '4610', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (605, '2569', '1', 36, '4611', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (606, '2569', '1', 36, '4612', 50.00, 38.00, 38.00, 3, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (607, '2569', '1', 36, '4613', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (608, '2569', '1', 36, '4614', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (609, '2569', '1', 36, '4615', 50.00, 39.00, 39.00, 3, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (610, '2569', '1', 36, '4616', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (611, '2569', '1', 36, '4617', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (612, '2569', '1', 36, '4618', 50.00, 0.00, 0.00, 1, 'APPROVED', NULL, NULL, 8, '2026-03-03 00:19:49');
INSERT INTO `kpi_results` VALUES (613, '2569', '1', 28, '4601', 10.00, 7.48, 7.48, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (614, '2569', '1', 28, '4602', 10.00, 6.92, 6.92, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (615, '2569', '1', 28, '4603', 10.00, 7.13, 7.13, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (616, '2569', '1', 28, '4604', 10.00, 6.08, 6.08, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (617, '2569', '1', 28, '4605', 10.00, 6.36, 6.36, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (618, '2569', '1', 28, '4606', 10.00, 6.92, 6.92, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (619, '2569', '1', 28, '4607', 10.00, 7.90, 7.90, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (620, '2569', '1', 28, '4608', 10.00, 9.16, 9.16, 5, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (621, '2569', '1', 28, '4609', 10.00, 7.48, 7.48, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (622, '2569', '1', 28, '4610', 10.00, 8.74, 8.74, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (623, '2569', '1', 28, '4611', 10.00, 7.48, 7.48, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (624, '2569', '1', 28, '4612', 10.00, 7.27, 7.27, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (625, '2569', '1', 28, '4613', 10.00, 9.02, 9.02, 5, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (626, '2569', '1', 28, '4614', 10.00, 7.48, 7.48, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (627, '2569', '1', 28, '4615', 10.00, 8.39, 8.39, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (628, '2569', '1', 28, '4616', 10.00, 9.06, 9.06, 5, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (629, '2569', '1', 28, '4617', 10.00, 8.53, 8.53, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (630, '2569', '1', 28, '4618', 10.00, 8.32, 8.32, 4, 'APPROVED', NULL, NULL, 32, '2026-02-20 16:46:53');
INSERT INTO `kpi_results` VALUES (631, '2569', '1', 38, '4601', 5.00, 2.00, 2.00, 2, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (632, '2569', '1', 38, '4602', 5.00, 2.00, 2.00, 2, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (633, '2569', '1', 38, '4603', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (634, '2569', '1', 38, '4604', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (635, '2569', '1', 38, '4605', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (636, '2569', '1', 38, '4606', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (637, '2569', '1', 38, '4607', 5.00, 1.00, 1.00, 1, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (638, '2569', '1', 38, '4608', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (639, '2569', '1', 38, '4609', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (640, '2569', '1', 38, '4610', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (641, '2569', '1', 38, '4611', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (642, '2569', '1', 38, '4612', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (643, '2569', '1', 38, '4613', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (644, '2569', '1', 38, '4614', 5.00, 1.00, 1.00, 1, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (645, '2569', '1', 38, '4615', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (646, '2569', '1', 38, '4616', 5.00, 3.00, 3.00, 3, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (647, '2569', '1', 38, '4617', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (648, '2569', '1', 38, '4618', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 35, '2026-02-10 10:19:19');
INSERT INTO `kpi_results` VALUES (649, '2569', '1', 18, '4601', 604.00, 556.00, 92.05, 4, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (650, '2569', '1', 18, '4602', 10.00, 10.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (651, '2569', '1', 18, '4603', 90.00, 87.00, 96.67, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (652, '2569', '1', 18, '4604', 3.00, 3.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (653, '2569', '1', 18, '4605', 225.00, 190.00, 84.44, 3, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (654, '2569', '1', 18, '4606', 27.00, 27.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (655, '2569', '1', 18, '4607', 263.00, 252.00, 95.82, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (656, '2569', '1', 18, '4608', 2.00, 2.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (657, '2569', '1', 18, '4609', 15.00, 15.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (658, '2569', '1', 18, '4610', 16.00, 16.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (659, '2569', '1', 18, '4611', 17.00, 16.00, 94.12, 4, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (660, '2569', '1', 18, '4612', 21.00, 19.00, 90.48, 4, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (661, '2569', '1', 18, '4613', 182.00, 168.00, 92.31, 4, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (662, '2569', '1', 18, '4614', 1.00, 1.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (663, '2569', '1', 18, '4615', 14.00, 14.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (664, '2569', '1', 18, '4616', 20.00, 20.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (665, '2569', '1', 18, '4617', 35.00, 35.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (666, '2569', '1', 18, '4618', 29.00, 29.00, 100.00, 5, 'APPROVED', NULL, NULL, 26, '2026-02-20 11:21:11');
INSERT INTO `kpi_results` VALUES (667, '2569', '1', 26, '4601', 31.00, 27.00, 87.10, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (668, '2569', '1', 26, '4602', 18.00, 18.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (669, '2569', '1', 26, '4603', 10.00, 9.00, 90.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (670, '2569', '1', 26, '4604', 9.00, 9.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (671, '2569', '1', 26, '4605', 13.00, 11.00, 84.62, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (672, '2569', '1', 26, '4606', 29.00, 26.00, 89.66, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (673, '2569', '1', 26, '4607', 28.00, 28.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (674, '2569', '1', 26, '4608', 33.00, 33.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (675, '2569', '1', 26, '4609', 14.00, 13.00, 92.86, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (676, '2569', '1', 26, '4610', 9.00, 9.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (677, '2569', '1', 26, '4611', 17.00, 17.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (678, '2569', '1', 26, '4612', 24.00, 24.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (679, '2569', '1', 26, '4613', 9.00, 6.00, 66.67, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (680, '2569', '1', 26, '4614', 23.00, 23.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (681, '2569', '1', 26, '4615', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (682, '2569', '1', 26, '4616', 14.00, 14.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (683, '2569', '1', 26, '4617', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (684, '2569', '1', 26, '4618', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 14:26:45');
INSERT INTO `kpi_results` VALUES (685, '2569', '1', 3, '4601', 1418.00, 216.00, 15.23, 4, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (686, '2569', '1', 3, '4602', 387.00, 90.00, 23.26, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (687, '2569', '1', 3, '4603', 591.00, 295.00, 49.92, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (688, '2569', '1', 3, '4604', 159.00, 20.00, 12.58, 3, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (689, '2569', '1', 3, '4605', 958.00, 101.00, 10.54, 3, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (690, '2569', '1', 3, '4606', 273.00, 78.00, 28.57, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (691, '2569', '1', 3, '4607', 1091.00, 319.00, 29.24, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (692, '2569', '1', 3, '4608', 467.00, 64.00, 13.70, 4, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (693, '2569', '1', 3, '4609', 406.00, 47.00, 11.58, 3, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (694, '2569', '1', 3, '4610', 481.00, 53.00, 11.02, 3, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (695, '2569', '1', 3, '4611', 384.00, 57.00, 14.84, 4, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (696, '2569', '1', 3, '4612', 653.00, 80.00, 12.25, 3, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (697, '2569', '1', 3, '4613', 558.00, 102.00, 18.28, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (698, '2569', '1', 3, '4614', 277.00, 174.00, 62.82, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (699, '2569', '1', 3, '4615', 256.00, 68.00, 26.56, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (700, '2569', '1', 3, '4616', 246.00, 59.00, 23.98, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (701, '2569', '1', 3, '4617', 259.00, 30.00, 11.58, 3, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (702, '2569', '1', 3, '4618', 234.00, 70.00, 29.91, 5, 'APPROVED', NULL, NULL, 24, '2026-02-26 12:26:30');
INSERT INTO `kpi_results` VALUES (703, '2569', '1', 24, '4601', 8.00, 8.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (704, '2569', '1', 24, '4602', 1.00, 1.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (705, '2569', '1', 24, '4603', 4.00, 4.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (706, '2569', '1', 24, '4604', 3.00, 3.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (707, '2569', '1', 24, '4605', 11.00, 11.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (708, '2569', '1', 24, '4606', 7.00, 7.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (709, '2569', '1', 24, '4607', 12.00, 10.00, 83.33, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (710, '2569', '1', 24, '4608', 26.00, 24.00, 92.31, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (711, '2569', '1', 24, '4609', 24.00, 24.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (712, '2569', '1', 24, '4610', 29.00, 27.00, 93.10, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (713, '2569', '1', 24, '4611', 3.00, 3.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (714, '2569', '1', 24, '4612', 11.00, 11.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (715, '2569', '1', 24, '4613', 7.00, 7.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (716, '2569', '1', 24, '4614', 2.00, 2.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (717, '2569', '1', 24, '4615', 4.00, 4.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (718, '2569', '1', 24, '4616', 5.00, 5.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (719, '2569', '1', 24, '4617', 9.00, 9.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (720, '2569', '1', 24, '4618', 11.00, 11.00, 100.00, 5, 'APPROVED', NULL, NULL, 16, '2026-02-17 09:27:04');
INSERT INTO `kpi_results` VALUES (721, '2569', '1', 14, '4601', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (722, '2569', '1', 14, '4602', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (723, '2569', '1', 14, '4603', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (724, '2569', '1', 14, '4604', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (725, '2569', '1', 14, '4605', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (726, '2569', '1', 14, '4606', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (727, '2569', '1', 14, '4607', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (728, '2569', '1', 14, '4608', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (729, '2569', '1', 14, '4609', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (730, '2569', '1', 14, '4610', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (731, '2569', '1', 14, '4611', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (732, '2569', '1', 14, '4612', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (733, '2569', '1', 14, '4613', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (734, '2569', '1', 14, '4614', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (735, '2569', '1', 14, '4615', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (736, '2569', '1', 14, '4616', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (737, '2569', '1', 14, '4617', 5.00, 4.00, 4.00, 4, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');
INSERT INTO `kpi_results` VALUES (738, '2569', '1', 14, '4618', 5.00, 5.00, 5.00, 5, 'APPROVED', NULL, NULL, 41, '2026-02-27 11:38:38');

-- ----------------------------
-- Table structure for login_logs
-- ----------------------------
DROP TABLE IF EXISTS `login_logs`;
CREATE TABLE `login_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'รหัสลำดับ (PK)',
  `user_id` int NOT NULL COMMENT 'รหัสผู้ใช้งาน (FK)',
  `login_at` datetime NULL DEFAULT current_timestamp() COMMENT 'วันเวลาที่ล็อกอิน',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'หมายเลข IP Address',
  `status` enum('SUCCESS','FAILED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'สถานะการล็อกอิน',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_logs_ibfk1`(`user_id` ASC) USING BTREE,
  CONSTRAINT `login_logs_ibfk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ประวัติการเข้าใช้งานระบบ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_logs
-- ----------------------------

-- ----------------------------
-- Table structure for system_periods
-- ----------------------------
DROP TABLE IF EXISTS `system_periods`;
CREATE TABLE `system_periods`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fiscal_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eval_round` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hosp_start_date` datetime NULL DEFAULT NULL,
  `hosp_end_date` datetime NULL DEFAULT NULL,
  `prov_start_date` datetime NULL DEFAULT NULL,
  `prov_end_date` datetime NULL DEFAULT NULL,
  `is_active` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N',
  `is_keyin` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT 'สถานะการบันทึกข้อมูล',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_periods_ibfk1`(`fiscal_year` ASC) USING BTREE,
  CONSTRAINT `system_periods_ibfk1` FOREIGN KEY (`fiscal_year`) REFERENCES `fiscal_years` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_periods
-- ----------------------------
INSERT INTO `system_periods` VALUES (1, '2569', 'รอบที่ 1', '1', '2025-10-01 00:00:00', '2025-12-19 23:59:59', '2025-10-01 00:00:00', '2025-12-20 23:59:59', 'Y', 'N');

-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings`  (
  `setting_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อตัวแปรตั้งค่า',
  `setting_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ค่าที่กำหนด',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'คำอธิบาย',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ตารางตั้งค่าระบบทั่วไป' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_settings
-- ----------------------------
INSERT INTO `system_settings` VALUES ('ENABLE_DATA_ENTRY', '0', 'เปิด/ปิด การบันทึกข้อมูล (1=เปิด, 0=ปิด)', '2026-03-03 00:21:47');
INSERT INTO `system_settings` VALUES ('MAINTENANCE_MODE', '0', 'โหมดปิดปรับปรุงระบบ (1=เปิด, 0=ปิด)', '2026-01-06 11:05:18');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้ใช้ (PK)',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อผู้ใช้เข้าระบบ',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสผ่าน (NULL ได้ถ้า login ผ่าน Social)',
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อ',
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'นามสกุล',
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'อีเมล (ถ้ามี)',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ลิงก์รูปโปรไฟล์',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ตำแหน่ง',
  `workgroup_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'รหัสกลุ่มงาน (FK)',
  `role_id` int NULL DEFAULT 3 COMMENT 'ระดับสิทธิ์ (FK)',
  `status` enum('active','inactive','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'สถานะบัญชี',
  `line_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Line User ID',
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'เวลาที่ลงทะเบียน',
  `last_login` datetime NULL DEFAULT NULL COMMENT 'เวลาที่ล็อกอินล่าสุด',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_hosp`(`position` ASC) USING BTREE,
  INDEX `idx_users_role`(`role_id` ASC) USING BTREE,
  INDEX `fk_users_cworkgroups`(`workgroup_id` ASC) USING BTREE,
  CONSTRAINT `fk_users_croles` FOREIGN KEY (`role_id`) REFERENCES `croles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_users_cworkgroups` FOREIGN KEY (`workgroup_id`) REFERENCES `cworkgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ข้อมูลผู้ใช้งาน' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$10$Af7hrRIbE5RPy6pV4dfsjONYktGNBETNKczhPc8owDRtQ8uZzWyAa', 'Super Admin', NULL, NULL, NULL, 'avatar_1_1768278026_0ad78c7c.png', 'Adminitrator', 15, 1, 'active', NULL, '2025-12-20 23:00:47', NULL);
INSERT INTO `users` VALUES (2, 'auto_system', 'NO_LOGIN', 'System Auto', NULL, NULL, NULL, NULL, '00033', 15, 1, 'active', NULL, '2025-12-20 23:00:47', NULL);
INSERT INTO `users` VALUES (3, 'Nisakorn', '$2y$10$1dZJiSTtcnVyJxV3TDqt0..tQG58zxqSG.AIc4rAKE3SVXXzyxG06', 'นิสากร', 'พละสาร', 'nisapls58@gmail.com', '0986949974', NULL, 'นักสาธารณสุขชำนาญการ', 2, 2, 'active', NULL, '2026-01-14 11:28:39', NULL);
INSERT INTO `users` VALUES (4, 'Arisar2006', '$2y$10$fsfiLGoNhrAXl9w77ZGtNuzZm61Zh.8o79nhZzG99ExPKM/pwSiO2', 'อริศา', 'ไตรศิวะกุล', 'Arisar_tri2006@yahoo.co.th', '0897192668', NULL, 'นักสาธารณสุขชำนาญการ', 2, 3, 'inactive', NULL, '2026-01-19 15:58:51', NULL);
INSERT INTO `users` VALUES (5, 'euaangkul', '$2y$10$FzFPVFGC1ciiLihqbk5M9Osg2zOzZPi7fLtEQ5MxKj8q7Not10qYu', 'เอื้ออังกูร', 'มหัทธนะวรสิริ', 'euaangkul8032516@gmail.com', '0630375887', NULL, 'นวก.สส.ชำนาญการ', 13, 3, 'active', NULL, '2026-01-20 09:32:43', NULL);
INSERT INTO `users` VALUES (6, 'Juthamart', '$2y$10$Bt3/fdL2.M75ugVEsvZNZuvWWrHhQYd.3b/lg9WG5gBvrZFxLiDy.', 'จุฑามาศ', 'ภูนีรับ', 'run_pion@hotmail.com', '0833278676', NULL, 'แพทย์แผนไทยชำนาญการ', 7, 3, 'active', NULL, '2026-01-22 16:30:24', NULL);
INSERT INTO `users` VALUES (7, 'Lukkana', '$2y$10$LxlJR/uJK1vk0XuifaeNQOOnr8LeGML3R4WGV.Z7c0WS3.bH8b3F2', 'ลักคณา', 'สุเพ็ญศิลป์', 'lukkana17207@gmail.com', '0885617927', NULL, 'แพมย์แผนไทยปฏิบัติการ', 7, 3, 'active', NULL, '2026-01-23 08:23:04', NULL);
INSERT INTO `users` VALUES (8, 'oatwaranyoo', '$2y$10$xZyKvnDfF3Y4VoIIYLFYiOydCf1fYQPhn2u57vSTs12HcPvsxiI6G', 'วรัญญู', 'สุริยะ', 'waranyoo.suriya@gmail.com', '0637255527', 'avatar_8_1769136444_02b4d30c.jpg', 'นักวิชาการคอมพิวเตอร์ปฏิบัติการ', 15, 3, 'active', NULL, '2026-01-23 09:43:57', NULL);
INSERT INTO `users` VALUES (9, 'Juthamanee', '$2y$10$T99NZLs09YkFJYxwRyJpCusi4a7geNWScyWr8gTo2ZnTACCy5sw2e', 'นางจุฑามณี', 'พละศิลา', 'tiptuktong2522@gmail.com', '0885729755', NULL, 'พยาบาลวิชาชีพชำนาญการ', 8, 3, 'active', NULL, '2026-01-23 12:08:40', NULL);
INSERT INTO `users` VALUES (10, 'vacharaporn', '$2y$10$26kgetECJ7zQo9l3WqEnhuVQsXuKgrmCTOBXgN.9ZD3EeSTcflik2', 'วัชราภรณ์', 'ยุบลเขต', 'vacharapornaun@gmail.com', '0847915987', NULL, 'นักสาธารณสุขชำนาญการ', 6, 3, 'active', NULL, '2026-01-23 13:45:52', NULL);
INSERT INTO `users` VALUES (11, 'Pamtuan', '$2y$10$cY5pCZRGj9yyVNIqHu8Ei.9.USki/Yan8oGPMcx25G3VgiUtVF4eu', 'ภาวิกา', 'ยุบลนารถ', 'Pawikabdph@gmail.com', '0923169849', NULL, 'นักวิชาการสาธารณสุขชำนาญการ', 14, 3, 'active', NULL, '2026-01-23 14:16:11', NULL);
INSERT INTO `users` VALUES (12, 'Nathaphon', '$2y$10$SGWF2TgU1dOaahwmNPPy8edFmPD7tuSfUCBB6.5//7/FujA.uLRzW', 'ณฐพร', 'ต้นอินทร์', 'jeeup888@gmail.com', '0928924592', NULL, 'พยาบาลวิชาชีพปฏิบัติการ', 8, 3, 'active', NULL, '2026-01-23 15:04:07', NULL);
INSERT INTO `users` VALUES (13, 'Wangphusit', '$2y$10$wURZsSdW.LrXwhiJtNFND.3HjNgpUji6kdY6.n4uy5OYt92PSz6EG', 'เพชรลัดดา', 'วังภูสิทธิ์', 'wangphusit272@gmail.com', '0623565562', NULL, 'นักวิชาการสาธารณสุขชำนาญการพิเศษ', 13, 3, 'active', NULL, '2026-01-23 15:21:26', NULL);
INSERT INTO `users` VALUES (14, 'Wannapa', '$2y$10$MSiBhWXpfbuCQlPY.hFR5.ax0DQt6LeFNGxXr9pNjenjqv13BZRU6', 'วรรณภา', 'นิติมงคลชัย', 'n.wannapa2013@gmail.com', '043019760', NULL, 'นักทรัพยากรบุคคลชำนาญการพิเศษ', 10, 3, 'active', NULL, '2026-01-23 16:00:44', NULL);
INSERT INTO `users` VALUES (15, 'namwan', '$2y$10$vJpMwTC3Qd11c7DFfzj2NefCkM65xtIS/8KHHQraXcs6pBHiTawk2', 'ณัฐกฤตา', 'ทุมวงศ์', 'wwanjai@hotmail.com', '0819649410', NULL, 'พยาบาลวิชาชีพชำนาญการ', 8, 3, 'active', NULL, '2026-01-23 16:09:16', NULL);
INSERT INTO `users` VALUES (16, 'wuttichai', '$2y$10$63pRI8Tf9AnkVlyVDUQCUOPkLuxl1mbNnmfzT5dOd2wnlgixAADMC', 'นายวุฒิชัย', 'อินทรพาณิชย์', 'yaris3026@gmail.com', '0875280093', NULL, 'นัดจัดการงานทั่วไป', 8, 3, 'active', NULL, '2026-01-23 16:19:16', NULL);
INSERT INTO `users` VALUES (17, 'Pornsuda81', '$2y$10$cP7bin0fk88y6sTNgotE3.2/UXEtyOw.y1zbZ7x/tp3H/UmESmchK', 'พรสุดา', 'มโนชัย', 'manochai.psd@gmail.com', '0833560354', NULL, 'นักวิชาการสาธารณสุขปฏิบัติการ', 8, 3, 'active', NULL, '2026-01-23 16:40:11', NULL);
INSERT INTO `users` VALUES (18, 'Aisarapoosari', '$2y$10$AHu96EoOIJm9X5ZJn5SLDOqMy42qLGuxSgZNP3MzqxK8dsiJEcfTO', 'อริศรา', 'ภูสาริ', 'Arisara.poosari@gmail.com', '0872225129', NULL, 'นักวิชาการสาธารณสุขชำนาญการ', 8, 3, 'active', NULL, '2026-01-23 16:40:27', NULL);
INSERT INTO `users` VALUES (19, 'Uraiwan', '$2y$10$bXgipGAFI2.3detXZvvANOJpNyDUmwNurafpVVR9wBH1XhRr0Dftm', 'นางสาวอุไรวรรณ', 'พงษ์คำผาย', 'uraivan.mai@gmail.com', '0610183430', NULL, 'นักสาธารณสุขชำนาญการ', 5, 3, 'active', NULL, '2026-01-25 16:55:00', NULL);
INSERT INTO `users` VALUES (20, 'Warapon', '$2y$10$PQBAt4kH9gNv5w2b6t.s3enw6izz0c.6/j8LLsgHizts6xPXE22gK', 'วราภรณ์', 'อิสระพงศ์ไพศาล', 'bonusisara@gmail.com', '0973016908', NULL, 'เภสัชกรปฏิบัติการ', 9, 3, 'active', NULL, '2026-01-25 19:13:09', NULL);
INSERT INTO `users` VALUES (21, 'poomchana', '$2y$10$..zTOtQSywERl8q2WOpSnOTEoSoDNmcJtu4oeo.r7bqkm1okCR8XG', 'นายภูมิรพี', 'ชนะมาร', 'poomrapee.chanamarn@gmail.com', '0883335634', NULL, 'เภสัชกร', 9, 3, 'active', NULL, '2026-01-26 09:33:16', NULL);
INSERT INTO `users` VALUES (22, 'Phongham2517', '$2y$10$mJRC0H9ZrfDRFq8aHh3hm.GxJWBffHy.dCLs1yen5O2hWzxtxN3Fy', 'สมพงษ์', 'หามวงค์', 'phongham17@gmail.com', '0918623407', NULL, 'นักสาธารณสุขชำนาญการ', 13, 3, 'inactive', NULL, '2026-01-26 12:54:11', NULL);
INSERT INTO `users` VALUES (23, 'TkpTon', '$2y$10$kOnV6x76rx4jEyuW8hMOiuFHx4eITlXTC1aLa71oCIalGJjsEjzUm', 'กอบเดช', 'เพชรตะกั่ว', 'tkpton@gmail.com', '0943919694', NULL, 'นักเทคนิคการแพทย์', 4, 3, 'active', NULL, '2026-01-26 13:43:39', NULL);
INSERT INTO `users` VALUES (24, 'Wannawat', '$2y$10$6P559Kf038AIs18yLItxfehMzw.nvhXGxTuWTOkcXCVX8nhWCY6ne', 'วรรณวรรษ', 'เพิ่มพูล', 'wannawatgraph@gmail.com', '0898464893', NULL, 'นักวิชาการสาธารณสุขปฏิบัติการ', 5, 3, 'active', NULL, '2026-01-26 14:31:48', NULL);
INSERT INTO `users` VALUES (25, 'JutamasBualoy', '$2y$10$pgwyQrsitcLkz2at7DFzk.DP2ZLEV7f7qg2rdVAOnPrCBjKq5mO6W', 'จุฑามาส', 'บัวลอย', 'hmoowanbualoy@gmail.com', '0919353942', NULL, 'นักสาธารณสุขชำนาญการ', 6, 3, 'active', NULL, '2026-01-26 15:03:03', NULL);
INSERT INTO `users` VALUES (26, 'nantaporn', '$2y$10$071R4kMopxSAJu9XbHHk5u1.C8n32gxChttbeDSZTRRTnfTPXuady', 'นันทพร', 'ศรีเมฆารัตน์', 'nantaporn098@gmail.com', '0926686954', NULL, 'พยาบาลวิชาชีพชำนาญการ', 5, 3, 'active', NULL, '2026-01-26 15:19:02', NULL);
INSERT INTO `users` VALUES (27, 'arwut', '$2y$10$cVRX7QYBtLn4eg8h1GwiyOJ0XClYsIcq/om18DpoKa8iwCghiXjV2', 'อาวุธ', 'ภูผารส', 'arwutpuparod.007@gmail.com', '0845822994', NULL, 'นักวิเคราะห์นโยบายและแผน', 4, 3, 'active', NULL, '2026-01-26 15:26:03', NULL);
INSERT INTO `users` VALUES (28, 'Pmeaw1969', '$2y$10$cyt7p6njBeAMlE2fLjlRbuPVWmbBEry1Z2tNMWNOeaFUYpAgudsVK', 'ปวีณ์นุท', 'ภูนาสอน', 'pmeaw1969@gmail.com', '0823046496', NULL, 'นักวิเคราะห์นโยบายและแผนชำนาญการ', 4, 3, 'active', NULL, '2026-01-26 15:31:29', NULL);
INSERT INTO `users` VALUES (29, 'zole3500', '$2y$10$tfc0cfhGpVJbqo15s7QJ4eZiNi9uIgu7cEnJo.I.UxNJpCTqfkPsK', 'ชนะชัย', 'มาตย์คำมี', 'zole3500@gmail.com', '0917474080', NULL, 'นักวิชาการสาธารณสุข', 6, 3, 'active', NULL, '2026-01-27 09:29:23', NULL);
INSERT INTO `users` VALUES (30, 'Poontarika', '$2y$10$4PxTV6.pKLyOZrrqcu2ebeE03PwOK6dbR/YMBX27vWRxF.jPq0D1S', 'ปุณฑริกา', 'ทวะบุรี', 'noey.poontarika@gmail.com', '0856579173', NULL, 'นักวิเคราะห์นโยบายและแผน', 2, 3, 'active', NULL, '2026-01-27 10:09:00', NULL);
INSERT INTO `users` VALUES (31, 'supreeya', '$2y$10$EwhuVlajImhdGg0tB5rnj.j.JaOytVxGwKXihODZKprEYZ7fr2Xqi', 'สุปรียา', 'จรทะผา', 'supreeya.nan2@gmail.com', '0897220911', NULL, 'นักสาธารณสุขชำนาญการ', 2, 3, 'active', NULL, '2026-01-27 10:55:55', NULL);
INSERT INTO `users` VALUES (32, 'Phongham17', '$2y$10$jhgQQoXbM3oi14tuzg83Aeb8CBztG1ez2uYvAioRrlO53/VE8/Xtm', 'สมพงษ์', 'หามวงค์', 'phongham17@gmail.com', '0918623407', NULL, 'นักสาธารณสุขชำนาญการ', 13, 3, 'active', NULL, '2026-01-27 14:15:07', NULL);
INSERT INTO `users` VALUES (33, 'pcu14284', '$2y$10$Km.uQ7fc76rQVvU/Rpl/2uh18fm7z2F4SuFzPsybWG7yGQesobixC', 'แม้นมาศ', 'ภูต้องศรี', 'farm2778@gmail.com', '0884998987', NULL, 'นักวิชาการสาธารณสุขชำนาญการ', 13, 3, 'inactive', NULL, '2026-01-28 14:06:23', NULL);
INSERT INTO `users` VALUES (34, 'Noomnim95', '$2y$10$bLJEv9YLlION4ZjUwcWo0.GogrbKaEMW378nlXG2y0HfyJ9x21.ay', 'มันตา', 'มองเพชร', 'manta.mong@gmail.com', '0842025892', NULL, 'เภสัชกรปฏิบัติการ', 9, 3, 'active', NULL, '2026-01-28 16:14:31', NULL);
INSERT INTO `users` VALUES (35, 'Phetchararut', '$2y$10$Zn97cG9oIicOGH9gHSzsTOf.TTrwjNRr4L7LQMlLrmL9mVLChLXIq', 'เพชรารัตน์', 'สินธุโคตร', 'Phetchararutt@gmail.com', '0951988963', NULL, 'นักวิชาการสาธารณสุขปฏิบัติการ', 3, 3, 'active', NULL, '2026-02-09 13:49:23', NULL);
INSERT INTO `users` VALUES (36, 'bananalove', '$2y$10$MRYwewvgJV1TB32KYkPeaeV46cjCKtF0U6dda7APC5GSjCBRS9Jnq', 'อดิศักดิ์', 'บุญวุฒิ', 'ba474244343@hotmail.com', '0889925455', NULL, 'พนักงานธุรการ', 1, 3, 'inactive', NULL, '2026-02-10 07:24:51', NULL);
INSERT INTO `users` VALUES (37, 'wanis00477', '$2y$10$IWY5gGYF5dSIb9ZmznD7kejHloxodERW/91RW1GxLnObIB55hFRo6', 'เวนิส', 'เฉยฉิว', 'wanis00492@gmail.com', '0623932421', NULL, 'จพ.สาธารณสุขชำนาญงาน', 15, 3, 'inactive', NULL, '2026-02-10 11:31:54', NULL);
INSERT INTO `users` VALUES (38, 'chakkaphan', '$2y$10$pJgQRXFjMMi30iQSsqfCJejW6os1RGdJT/.IZn4LPzn2CzaKNCPq2', 'จักรพันธ์', 'โพธิ์มาตย์', 'chakkaphan1986@gmail.com', '0821206433', NULL, 'นักวิชาการคอมพิวเตอร์ชำนาญการ', 15, 3, 'active', NULL, '2026-02-10 16:01:45', NULL);
INSERT INTO `users` VALUES (39, '004800', '$2y$10$5HjWfoawI7Uq/0WfxGT.HeKvPKa6EaVtx3dnrngYKqZv/PJ/jOHbK', 'วิทยา', 'พลนาคู', 'withaya.polnakoo@gmail.com', '0878609262', NULL, 'นักวิชาการสาธารณสุขชำนาญการ', 2, 3, 'inactive', NULL, '2026-02-12 10:44:47', NULL);
INSERT INTO `users` VALUES (40, 'Pramote', '$2y$10$3ZQpGhFGFE225v2zf.rdo.Vo.89gv6sSxeZpF3hemNGFImPjBU00u', 'ปราโมทย์', 'สุริยะ', 'nunn.2013@gmail.com', '0854532921', NULL, 'เจ้าหน้าที่ธุรการ', 5, 3, 'inactive', NULL, '2026-02-13 10:59:26', NULL);
INSERT INTO `users` VALUES (41, 'envkls', '$2y$10$DmDdKN6QZNPMRy2sUoms6Oz/1VJg.anj.cLg3BuQDfbiIdwOV5/YS', 'นงลักษณ์', 'โชติมุข', 'anamai.env@gmail.com', '0833393738', NULL, 'นักสาธารณสุขชำนาญการ', 12, 3, 'active', NULL, '2026-02-17 11:44:11', NULL);
INSERT INTO `users` VALUES (42, 'Mathurin', '$2y$10$uzdjSH1E0NrQ7ZsHIhJJbuthivA3qxuh56jjKOFAcJPx/gS3He7oW', 'มธุริน', 'ไพรัตน์', 'mokun-jung19@hotmail.com', '0821956245', NULL, 'แพทย์แผนไทยชำนาญการ', 7, 3, 'inactive', NULL, '2026-02-19 09:41:46', NULL);
INSERT INTO `users` VALUES (43, 'Boombiim2778', '$2y$10$coabKBlQe51VhZTE7UVLPexSDzar1r8ywt6QaNLaCTu9VQlpR2gce', 'แม้นมาศ', 'ภูต้องศรี', 'farm2778@gmail.com', '0884998987', NULL, 'นวก.สส.ชำนาญการ', 2, 3, 'inactive', NULL, '2026-02-19 12:02:24', NULL);
INSERT INTO `users` VALUES (44, 'Arisa2006', '$2y$10$w11fY0TM3vS7nI692wMI0u4WWbH3f4SxOLKhlUnO8yJ8eVqazZAL.', 'อริศา', 'ไตรศิวะกุล', 'Arisar_tri2006@yahoo.co.th', '0897192668', NULL, 'นักสาธารณสุขชำนาญการ', 2, 3, 'active', NULL, '2026-02-19 14:28:20', NULL);
INSERT INTO `users` VALUES (45, 'thatthep', '$2y$10$OgGiRnpq.KzrXvEGI3cLnuJNm.FCQ8R7/Us0gFthqqDWfTaAm.HdG', 'ทัศน์เทพ', 'ดลโสภณ', 'thatthep.d@moph.mail.go.th', '0949322498', NULL, 'นักวิชาการคอมพิวเตอร์ชำนาญการ', 15, 3, 'active', NULL, '2026-02-19 14:54:20', NULL);
INSERT INTO `users` VALUES (46, 'Arisara', '$2y$10$lPQBK.HzWUDyyMK58V2XouJqQLijqTIZu/Slv79.lo6CRuu590j3S', 'อริศรา', 'ภูสาริ', 'Arisara.poosari@gmail.com', '0872225129', NULL, 'นักวิชาการสาธารณสุขชำนาญการ', 8, 3, 'active', NULL, '2026-02-24 09:23:26', NULL);

-- ----------------------------
-- View structure for view_province_kpi_score
-- ----------------------------
DROP VIEW IF EXISTS `view_province_kpi_score`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_province_kpi_score` AS select `kr`.`fiscal_year` AS `fiscal_year`,`kr`.`eval_round` AS `eval_round`,`kr`.`indicator_id` AS `indicator_id`,case when `i`.`unit` = 'ระดับ' then avg(`kr`.`target_amount`) else sum(`kr`.`target_amount`) end AS `province_target`,case when `i`.`unit` = 'ระดับ' then avg(`kr`.`result_amount`) else sum(`kr`.`result_amount`) end AS `province_result`,case when `i`.`unit` = 'ระดับ' then avg(`kr`.`result_amount`) when `i`.`unit` = 'อัตราลดลง' and sum(`kr`.`target_amount`) > 0 then (sum(`kr`.`target_amount`) - sum(`kr`.`result_amount`)) / sum(`kr`.`target_amount`) * 100 when sum(`kr`.`target_amount`) > 0 then sum(`kr`.`result_amount`) / sum(`kr`.`target_amount`) * ifnull(`i`.`multiplier`,1) else 0 end AS `province_rate`,avg(`kr`.`score`) AS `province_score` from (`kpi_results` `kr` join `indicators` `i` on(`kr`.`indicator_id` = `i`.`id`)) where `i`.`status` = 'ACTIVE' group by `kr`.`fiscal_year`,`kr`.`eval_round`,`kr`.`indicator_id`;

-- ----------------------------
-- View structure for view_report_district
-- ----------------------------
DROP VIEW IF EXISTS `view_report_district`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_report_district` AS select `vw_indicator_district`.`amp_code` AS `amp_code`,`vw_indicator_district`.`ampurname` AS `district_name`,sum(`vw_indicator_district`.`weighted_score`) AS `score` from `vw_indicator_district` group by `vw_indicator_district`.`amp_code` order by `vw_indicator_district`.`amp_code`;

-- ----------------------------
-- View structure for view_report_spider
-- ----------------------------
DROP VIEW IF EXISTS `view_report_spider`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_report_spider` AS select `l`.`fiscal_year` AS `fiscal_year`,`l`.`eval_round` AS `eval_round`,`l`.`ex_id` AS `ex_id`,`e`.`name` AS `ex_name`,sum(`l`.`weight`) AS `weight`,sum(`l`.`weighted_score`) AS `weighted_score`,round(sum(`l`.`weighted_score`) * 100 / sum(`l`.`weight`),2) AS `score` from (`vw_kpi_calculated_live` `l` join `cexcellence` `e` on(`l`.`ex_id` = `e`.`id`)) group by `l`.`fiscal_year`,`l`.`eval_round`,`l`.`ex_id`;

-- ----------------------------
-- View structure for vw_indicator_district
-- ----------------------------
DROP VIEW IF EXISTS `vw_indicator_district`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_indicator_district` AS select `a`.`ampurcodefull` AS `amp_code`,`a`.`ampurname` AS `ampurname`,`e`.`id` AS `ex_id`,concat('ประเด็นที่ ',cast(`e`.`id` as unsigned),' ',`e`.`name`) AS `ex_name`,`i`.`sub_ex_id` AS `sub_ex_id`,concat(`s`.`code`,' ',`s`.`name`) AS `sub_ex_name`,`i`.`id` AS `indicator_id`,`i`.`indicator_sequence` AS `indicator_sequence`,concat(`i`.`indicator_sequence`,'. ',`i`.`name`) AS `indicator_name`,`i`.`weight` AS `weight`,coalesce(`r`.`score`,1) AS `score`,round(coalesce(`r`.`score`,1) * `i`.`weight` / 5,2) AS `weighted_score` from ((((`indicators` `i` join `csub_excellence` `s` on(`i`.`sub_ex_id` = `s`.`id`)) join `cexcellence` `e` on(`s`.`ex_id` = `e`.`id`)) join `campur` `a`) left join `kpi_results` `r` on(`r`.`indicator_id` = `i`.`id` and `r`.`amp_code` = `a`.`ampurcodefull`)) where `i`.`status` = 'ACTIVE' order by `i`.`sub_ex_id`,`i`.`indicator_sequence`,`a`.`ampurcodefull`;

-- ----------------------------
-- View structure for vw_indicator_district_all
-- ----------------------------
DROP VIEW IF EXISTS `vw_indicator_district_all`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_indicator_district_all` AS select `kr`.`id` AS `result_id`,`kr`.`fiscal_year` AS `fiscal_year`,`kr`.`eval_round` AS `eval_round`,`kr`.`amp_code` AS `amp_code`,`c`.`ampurname` AS `ampurname`,`e`.`id` AS `ex_id`,`e`.`name` AS `ex_name`,`se`.`id` AS `sub_ex_id`,`se`.`name` AS `sub_ex_name`,`i`.`id` AS `indicator_id`,`i`.`indicator_sequence` AS `indicator_sequence`,`i`.`name` AS `indicator_name`,`i`.`unit` AS `unit`,`i`.`weight` AS `weight`,`kr`.`target_amount` AS `target_amount`,`kr`.`result_amount` AS `result_amount`,`kr`.`result_rate` AS `result_rate`,`kr`.`score` AS `score`,`kr`.`score` * `i`.`weight` / 5 AS `weighted_score` from ((((`kpi_results` `kr` join `indicators` `i` on(`kr`.`indicator_id` = `i`.`id`)) left join `csub_excellence` `se` on(`i`.`sub_ex_id` = `se`.`id`)) left join `cexcellence` `e` on(`se`.`ex_id` = `e`.`id`)) join `campur` `c` on(`kr`.`amp_code` = `c`.`ampurcodefull`)) where `i`.`status` = 'ACTIVE';

-- ----------------------------
-- View structure for vw_indicator_excellence_district
-- ----------------------------
DROP VIEW IF EXISTS `vw_indicator_excellence_district`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_indicator_excellence_district` AS select `v`.`amp_code` AS `amp_code`,`v`.`ampurname` AS `ampurname`,`v`.`ex_id` AS `ex_id`,`v`.`ex_name` AS `ex_name`,NULL AS `sub_ex_id`,NULL AS `sub_ex_name`,NULL AS `indicator_id`,NULL AS `indicator_sequence`,NULL AS `indicator_name`,sum(`v`.`weight`) AS `weight`,NULL AS `score`,sum(`v`.`weighted_score`) AS `weighted_score` from `vw_indicator_district` `v` group by `v`.`ex_id`,`v`.`amp_code`,`v`.`ampurname`,`v`.`ex_name` order by `v`.`amp_code`,`v`.`ex_id`;

-- ----------------------------
-- View structure for vw_indicator_province_score
-- ----------------------------
DROP VIEW IF EXISTS `vw_indicator_province_score`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_indicator_province_score` AS select `i`.`fiscal_year` AS `fiscal_year`,`i`.`eval_round` AS `eval_round`,`e`.`id` AS `ex_id`,`e`.`name` AS `ex_name`,`i`.`sub_ex_id` AS `sub_ex_id`,`i`.`weight` AS `weight`,ifnull(`v`.`province_score`,1) AS `province_score`,round(ifnull(`v`.`province_score`,1) * `i`.`weight` / 5,2) AS `weighted_score` from (((`indicators` `i` left join `view_province_kpi_score` `v` on(`i`.`fiscal_year` = `v`.`fiscal_year` and `i`.`eval_round` = `v`.`eval_round` and `i`.`id` = `v`.`indicator_id`)) join `csub_excellence` `s` on(`i`.`sub_ex_id` = `s`.`id`)) join `cexcellence` `e` on(`s`.`ex_id` = `e`.`id`));

-- ----------------------------
-- View structure for vw_kpi_calculated_live
-- ----------------------------
DROP VIEW IF EXISTS `vw_kpi_calculated_live`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_kpi_calculated_live` AS select `step2`.`fiscal_year` AS `fiscal_year`,`step2`.`eval_round` AS `eval_round`,`step2`.`indicator_id` AS `indicator_id`,`step2`.`target_amount` AS `target_amount`,`step2`.`result_amount` AS `result_amount`,`step2`.`unit` AS `unit`,`step2`.`weight` AS `weight`,`step2`.`scoring_type` AS `scoring_type`,`step2`.`criteria_1` AS `criteria_1`,`step2`.`criteria_2` AS `criteria_2`,`step2`.`criteria_3` AS `criteria_3`,`step2`.`criteria_4` AS `criteria_4`,`step2`.`criteria_5` AS `criteria_5`,`step2`.`ex_id` AS `ex_id`,`step2`.`calc_rate` AS `calc_rate`,`step2`.`calc_score` AS `calc_score`,cast(`step2`.`calc_score` * `step2`.`weight` / 5 as decimal(10,4)) AS `weighted_score` from (select `step1`.`fiscal_year` AS `fiscal_year`,`step1`.`eval_round` AS `eval_round`,`step1`.`indicator_id` AS `indicator_id`,`step1`.`target_amount` AS `target_amount`,`step1`.`result_amount` AS `result_amount`,`step1`.`unit` AS `unit`,`step1`.`weight` AS `weight`,`step1`.`scoring_type` AS `scoring_type`,`step1`.`criteria_1` AS `criteria_1`,`step1`.`criteria_2` AS `criteria_2`,`step1`.`criteria_3` AS `criteria_3`,`step1`.`criteria_4` AS `criteria_4`,`step1`.`criteria_5` AS `criteria_5`,`step1`.`ex_id` AS `ex_id`,`step1`.`calc_rate` AS `calc_rate`,greatest(case when `step1`.`calc_rate` is null then 1 when `step1`.`unit` = 'ระดับ' then floor(`step1`.`calc_rate`) when `step1`.`unit` <> 'ระดับ' and `step1`.`target_amount` = 0 and `step1`.`result_amount` = 0 then 5 when `EvaluateKPICondition`(`step1`.`calc_rate`,`step1`.`criteria_5`) = 1 then 5 when `EvaluateKPICondition`(`step1`.`calc_rate`,`step1`.`criteria_4`) = 1 then 4 when `EvaluateKPICondition`(`step1`.`calc_rate`,`step1`.`criteria_3`) = 1 then 3 when `EvaluateKPICondition`(`step1`.`calc_rate`,`step1`.`criteria_2`) = 1 then 2 when `EvaluateKPICondition`(`step1`.`calc_rate`,`step1`.`criteria_1`) = 1 then 1 else 1 end,1) AS `calc_score` from (select `i`.`fiscal_year` AS `fiscal_year`,`i`.`eval_round` AS `eval_round`,`i`.`indicator_sequence` AS `indicator_id`,`v`.`target_amount` AS `target_amount`,`v`.`result_amount` AS `result_amount`,`i`.`unit` AS `unit`,`i`.`weight` AS `weight`,`v`.`scoring_type` AS `scoring_type`,`v`.`criteria_1` AS `criteria_1`,`v`.`criteria_2` AS `criteria_2`,`v`.`criteria_3` AS `criteria_3`,`v`.`criteria_4` AS `criteria_4`,`v`.`criteria_5` AS `criteria_5`,`s`.`ex_id` AS `ex_id`,case when `i`.`unit` = 'ระดับ' then `v`.`result_amount` / 18 when `v`.`target_amount` is null or `v`.`target_amount` = 0 then 0 when `i`.`unit` = 'อัตราลดลง' then (`v`.`target_amount` - `v`.`result_amount`) / `v`.`target_amount` * 100 else `v`.`result_amount` / `v`.`target_amount` * ifnull(`i`.`multiplier`,1) end AS `calc_rate` from ((`indicators` `i` left join `vw_prov_results` `v` on(`i`.`id` = `v`.`indicator_id`)) join `csub_excellence` `s` on(`i`.`sub_ex_id` = `s`.`id`)) where `i`.`status` = 'ACTIVE') `step1`) `step2`;

-- ----------------------------
-- View structure for vw_kpi_weighted_scores
-- ----------------------------
DROP VIEW IF EXISTS `vw_kpi_weighted_scores`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_kpi_weighted_scores` AS select `kr`.`amp_code` AS `amp_code`,`kr`.`indicator_id` AS `indicator_id`,`kr`.`fiscal_year` AS `fiscal_year`,`kr`.`eval_round` AS `eval_round`,`kr`.`score` AS `score`,`i`.`weight` AS `weight`,`kr`.`score` * `i`.`weight` / 5 AS `weighted_score` from (`kpi_results` `kr` join `indicators` `i` on(`kr`.`indicator_id` = `i`.`id`));

-- ----------------------------
-- View structure for vw_prov_results
-- ----------------------------
DROP VIEW IF EXISTS `vw_prov_results`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_prov_results` AS select `r`.`fiscal_year` AS `fiscal_year`,`r`.`eval_round` AS `eval_round`,`r`.`indicator_id` AS `indicator_id`,sum(`r`.`target_amount`) AS `target_amount`,sum(`r`.`result_amount`) AS `result_amount`,`i`.`unit` AS `unit`,`ic`.`scoring_type` AS `scoring_type`,`ic`.`criteria_1` AS `criteria_1`,`ic`.`criteria_2` AS `criteria_2`,`ic`.`criteria_3` AS `criteria_3`,`ic`.`criteria_4` AS `criteria_4`,`ic`.`criteria_5` AS `criteria_5` from ((`kpi_results` `r` join `indicators` `i` on(`r`.`indicator_id` = `i`.`id` and `r`.`fiscal_year` = `i`.`fiscal_year` and `r`.`eval_round` = `i`.`eval_round`)) join `indicator_criteria` `ic` on(`i`.`id` = `ic`.`indicator_id` and `i`.`fiscal_year` = `ic`.`fiscal_year` and `i`.`eval_round` = `ic`.`eval_round`)) where `r`.`status` = 'APPROVED' group by `r`.`fiscal_year`,`r`.`eval_round`,`r`.`indicator_id`;

-- ----------------------------
-- Procedure structure for AutoCarryOverKPI
-- ----------------------------
DROP PROCEDURE IF EXISTS `AutoCarryOverKPI`;
delimiter ;;
CREATE PROCEDURE `AutoCarryOverKPI`()
BEGIN
    DECLARE _period_id INT; 
    DECLARE _year CHAR(4); 
    DECLARE _round VARCHAR(50); 
    DECLARE _auto_user_id INT;

    SELECT id INTO _auto_user_id FROM users WHERE username = 'auto_system' LIMIT 1;
    SELECT id, fiscal_year, period_name INTO _period_id, _year, _round 
    FROM system_periods 
    WHERE DATE(hosp_end_date) = DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND is_active = 'Y' LIMIT 1;

    IF _period_id IS NOT NULL THEN
        INSERT INTO kpi_results (fiscal_year, eval_round, indicator_id, amp_code, target_amount, result_amount, result_rate, score, status, created_by, note)
        WITH LatestKPI AS (
            SELECT indicator_id, amp_code, target_amount, result_amount, result_rate, score, eval_round,
            ROW_NUMBER() OVER (PARTITION BY indicator_id, amp_code ORDER BY id DESC) as rn
            FROM kpi_results WHERE fiscal_year = _year 
        )
        SELECT _year, _round, k.indicator_id, k.amp_code, k.target_amount, k.result_amount, k.result_rate, k.score, 'SUBMITTED', _auto_user_id, CONCAT('Auto Carry-over from ', k.eval_round)
        FROM indicators i
        JOIN LatestKPI k ON k.indicator_id = i.id AND k.rn = 1
        JOIN campur c ON k.amp_code = c.ampurcodefull
        WHERE i.status = 'ACTIVE' 
          AND NOT EXISTS (SELECT 1 FROM kpi_results curr WHERE curr.fiscal_year = _year AND curr.eval_round = _round AND curr.indicator_id = i.id AND curr.amp_code = c.ampurcodefull);
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for CheckKPIPass
-- ----------------------------
DROP FUNCTION IF EXISTS `CheckKPIPass`;
delimiter ;;
CREATE FUNCTION `CheckKPIPass`(_val DECIMAL(12,2), _criteria VARCHAR(100))
 RETURNS tinyint(4)
  DETERMINISTIC
BEGIN
    DECLARE _is_pass TINYINT DEFAULT 0;
    SET _criteria = TRIM(_criteria);
    
    IF _val IS NULL OR _criteria IS NULL OR _criteria = '' THEN
        RETURN 0;
    END IF;

    -- กรณีมากกว่าหรือเท่ากับ (>=)
    IF _criteria LIKE '>=%' THEN
        IF _val >= CAST(SUBSTRING(_criteria, 3) AS DECIMAL(12,2)) THEN SET _is_pass = 1; END IF;
    
    -- กรณีน้อยกว่าหรือเท่ากับ (<=)
    ELSEIF _criteria LIKE '<=%' THEN
        IF _val <= CAST(SUBSTRING(_criteria, 3) AS DECIMAL(12,2)) THEN SET _is_pass = 1; END IF;
    
    -- กรณีมากกว่า (>)
    ELSEIF _criteria LIKE '>%' THEN
        IF _val > CAST(SUBSTRING(_criteria, 2) AS DECIMAL(12,2)) THEN SET _is_pass = 1; END IF;
    
    -- กรณีน้อยกว่า (<)
    ELSEIF _criteria LIKE '<%' THEN
        IF _val < CAST(SUBSTRING(_criteria, 2) AS DECIMAL(12,2)) THEN SET _is_pass = 1; END IF;
        
    -- กรณีช่วงค่า ( - ) เช่น 20 - 30
    ELSEIF _criteria LIKE '%-%' THEN
        IF _val >= CAST(SUBSTRING_INDEX(_criteria, '-', 1) AS DECIMAL(12,2)) 
           AND _val <= CAST(SUBSTRING_INDEX(_criteria, '-', -1) AS DECIMAL(12,2)) 
        THEN SET _is_pass = 1; END IF;
        
    -- กรณีค่าคงที่ (เช่น 1, 5)
    ELSE
        IF _val = CAST(_criteria AS DECIMAL(12,2)) THEN SET _is_pass = 1; END IF;
    END IF;

    RETURN _is_pass;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for EvaluateKPICondition
-- ----------------------------
DROP FUNCTION IF EXISTS `EvaluateKPICondition`;
delimiter ;;
CREATE FUNCTION `EvaluateKPICondition`(pValue DECIMAL(10,4), pCondition VARCHAR(50))
 RETURNS tinyint(1)
  DETERMINISTIC
BEGIN
    DECLARE _cond VARCHAR(50);
    DECLARE _num_str VARCHAR(50);
    
    -- ลบ Space ปกติ และ Non-breaking space (ถ้าทำได้) หรือใช้วิธี Hex replace
    -- ใน MySQL บางเวอร์ชั่นอาจต้องใช้ REPLACE(..., CHAR(160), '') 
    SET _cond = TRIM(REPLACE(REPLACE(pCondition, '\r', ''), '\n', ''));
    SET _cond = REPLACE(_cond, ' ', ''); 

    IF _cond IS NULL OR _cond = '' OR _cond = '-' OR pValue IS NULL THEN
        RETURN 0;
    END IF;

    -- ตรวจสอบเงื่อนไข (คงเดิม แต่เพิ่มความรัดกุม)
    IF LEFT(_cond, 2) = '>=' THEN
        SET _num_str = SUBSTRING(_cond, 3);
        IF pValue >= CAST(_num_str AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    ELSEIF LEFT(_cond, 1) = '≥' THEN -- รองรับสัญลักษณ์ Unicode
        SET _num_str = SUBSTRING(_cond, 2);
        IF pValue >= CAST(_num_str AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    ELSEIF LEFT(_cond, 2) = '<=' THEN
        SET _num_str = SUBSTRING(_cond, 3);
        IF pValue <= CAST(_num_str AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    ELSEIF LEFT(_cond, 1) = '≤' THEN
        SET _num_str = SUBSTRING(_cond, 2);
        IF pValue <= CAST(_num_str AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    ELSEIF LEFT(_cond, 1) = '>' THEN
        SET _num_str = SUBSTRING(_cond, 2);
        IF pValue > CAST(_num_str AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    ELSEIF LEFT(_cond, 1) = '<' THEN
        SET _num_str = SUBSTRING(_cond, 2);
        IF pValue < CAST(_num_str AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    -- กรณีช่วงตัวเลข เช่น "80-89" หรือตัวเลขโดดๆ "100"
    ELSEIF _cond REGEXP '^[0-9]+(\.[0-9]+)?-[0-9]+(\.[0-9]+)?$' THEN
        -- แยกช่วงค่า min-max (ต้องใช้ SUBSTRING_INDEX)
        IF pValue >= CAST(SUBSTRING_INDEX(_cond, '-', 1) AS DECIMAL(10,4)) 
           AND pValue <= CAST(SUBSTRING_INDEX(_cond, '-', -1) AS DECIMAL(10,4)) THEN 
           RETURN 1; 
        END IF;
    ELSEIF _cond REGEXP '^-?[0-9]+(\.[0-9]+)?$' THEN
        IF pValue = CAST(_cond AS DECIMAL(10,4)) THEN RETURN 1; END IF;
    END IF;

    RETURN 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageDefaultAssignees
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageDefaultAssignees`;
delimiter ;;
CREATE PROCEDURE `ManageDefaultAssignees`(IN p_indicator_id INT)
BEGIN
    DECLARE _admin_role_id INT DEFAULT 1; -- กำหนด ID ของ Role Admin ที่นี่
    IF p_indicator_id IS NOT NULL THEN
        INSERT IGNORE INTO `indicator_assignees` (`indicator_id`, `user_id`)
        SELECT p_indicator_id, id FROM users WHERE role_id = _admin_role_id;
    ELSE
        INSERT IGNORE INTO `indicator_assignees` (`indicator_id`, `user_id`)
        SELECT i.id, u.id FROM `indicators` i CROSS JOIN `users` u
        WHERE i.status = 'ACTIVE' AND u.role_id = _admin_role_id;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ProcessKPIResults
-- ----------------------------
DROP PROCEDURE IF EXISTS `ProcessKPIResults`;
delimiter ;;
CREATE PROCEDURE `ProcessKPIResults`(IN p_fiscal_year CHAR(4), IN p_eval_round VARCHAR(50))
BEGIN
    -- =============================================
    -- 1. คำนวณ Result Rate (หัวใจสำคัญ)
    -- =============================================
    UPDATE kpi_results kr
    JOIN indicators i ON kr.indicator_id = i.id
    SET kr.result_rate = CASE 
        -- ✅ กรณีหน่วย "ระดับ": บังคับให้ result_rate = result_amount ทันที
        -- ใช้ CAST เพื่อแปลงค่าให้เป็นตัวเลขที่แน่นอน
        WHEN i.unit = 'ระดับ' THEN CAST(kr.result_amount AS DECIMAL(10,4))

        -- กรณีเป้าหมายเป็น 0 หรือ NULL (และไม่ใช่หน่วยระดับ) -> ให้ rate เป็น 0 ป้องกัน Error หารด้วยศูนย์
        WHEN kr.target_amount IS NULL OR kr.target_amount = 0 THEN 0
        
        -- กรณีสูตร "อัตราลดลง"
        WHEN i.unit = 'อัตราลดลง' THEN 
            ((kr.target_amount - kr.result_amount) / kr.target_amount) * 100
            
        -- กรณีสูตรปกติ (ร้อยละ, จำนวน, ฯลฯ)
        ELSE 
            (kr.result_amount / kr.target_amount) * IFNULL(i.multiplier, 1)
    END
    WHERE kr.fiscal_year = p_fiscal_year 
      AND kr.eval_round = p_eval_round
      AND kr.result_amount IS NOT NULL; -- ทำเฉพาะรายการที่มีการบันทึกแล้ว


    -- =============================================
    -- 2. คำนวณ Score (คะแนน 1-5)
    -- =============================================
    UPDATE kpi_results kr
    JOIN indicator_criteria ic ON kr.indicator_id = ic.indicator_id 
                               AND kr.fiscal_year = ic.fiscal_year 
                               AND kr.eval_round = ic.eval_round
    JOIN indicators i ON kr.indicator_id = i.id
    SET kr.score = CASE
        -- ✅ เงื่อนไขพิเศษ 0/0 ได้ 5 (ยกเว้นหน่วยระดับ)
        WHEN i.unit != 'ระดับ' AND kr.target_amount = 0 AND kr.result_amount = 0 AND kr.result_amount IS NOT NULL THEN 5

        -- เช็คตามเกณฑ์ปกติ (ไล่จาก 5 ลงไป 1)
        -- result_rate ที่คำนวณมาใน Step 1 จะถูกนำมาใช้ที่นี่
        WHEN EvaluateKPICondition(kr.result_rate, ic.criteria_5) = 1 THEN 5
        WHEN EvaluateKPICondition(kr.result_rate, ic.criteria_4) = 1 THEN 4
        WHEN EvaluateKPICondition(kr.result_rate, ic.criteria_3) = 1 THEN 3
        WHEN EvaluateKPICondition(kr.result_rate, ic.criteria_2) = 1 THEN 2
        WHEN EvaluateKPICondition(kr.result_rate, ic.criteria_1) = 1 THEN 1
        
        -- ไม่ผ่านเกณฑ์ใดเลย ให้ 1
        ELSE 1 
    END
    WHERE kr.fiscal_year = p_fiscal_year 
      AND kr.eval_round = p_eval_round
      AND kr.result_amount IS NOT NULL;

END
;;
delimiter ;

-- ----------------------------
-- Event structure for evt_daily_auto_carryover
-- ----------------------------
DROP EVENT IF EXISTS `evt_daily_auto_carryover`;
delimiter ;;
CREATE EVENT `evt_daily_auto_carryover`
ON SCHEDULE
EVERY '1' DAY STARTS '2025-10-01 01:00:00'
DO CALL AutoCarryOverKPI()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table kpi_results
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_kpi_results_before_save`;
delimiter ;;
CREATE TRIGGER `trg_kpi_results_before_save` BEFORE UPDATE ON `kpi_results` FOR EACH ROW BEGIN
    DECLARE _mult DECIMAL(10,2);
    DECLARE _unit VARCHAR(50);
    
    -- ดึงค่า Multiplier และ Unit ของตัวชี้วัดนี้
    SELECT multiplier, unit INTO _mult, _unit FROM indicators WHERE id = NEW.indicator_id LIMIT 1;
    
    -- ============================================================
    -- ✅ แก้ไข: แยกเช็คหน่วย "ระดับ" เป็นกรณีแรกสุด
    -- ============================================================
    IF _unit = 'ระดับ' THEN
        -- ถ้าเป็นระดับ ให้ result_rate = result_amount ไปเลย (ไม่ต้องหารเป้า)
        SET NEW.result_rate = NEW.result_amount;

    -- ============================================================
    -- ส่วนการคำนวณสูตรอื่นๆ (ต้องมี Target > 0)
    -- ============================================================
    ELSEIF NEW.target_amount > 0 AND NEW.result_amount IS NOT NULL THEN
        
        -- เช็คสูตร: อัตราลดลง ((เป้า-ผล)/เป้า)*100
        IF _unit = 'อัตราลดลง' THEN
            SET NEW.result_rate = ((NEW.target_amount - NEW.result_amount) / NEW.target_amount) * 100;
        ELSE
            -- สูตรปกติ (ผล/เป้า)*ตัวคูณ
            SET NEW.result_rate = (NEW.result_amount / NEW.target_amount) * COALESCE(_mult, 1);
        END IF;

    -- กรณี Target เป็น 0 หรือ NULL (และไม่ใช่หน่วยระดับ) ให้ Rate เป็น 0
    ELSE
        SET NEW.result_rate = 0;
    END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
