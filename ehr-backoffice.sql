-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 nov. 2024 à 10:44
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ehr-backoffice`
--

-- --------------------------------------------------------

--
-- Structure de la table `bed`
--

CREATE TABLE `bed` (
  `bed_ky` bigint(20) NOT NULL,
  `bed_note` varchar(255) NOT NULL,
  `bed_number` int(11) NOT NULL,
  `bed_type` int(11) NOT NULL,
  `equipment_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipment`
--

CREATE TABLE `equipment` (
  `eqpmnt_ky` bigint(20) NOT NULL,
  `eqpmnt_ipadrs` varchar(255) DEFAULT NULL,
  `eqpmnt_macadrs` varchar(255) DEFAULT NULL,
  `eqpmnt_desc` varchar(255) DEFAULT NULL,
  `eqpmnt_label` varchar(255) NOT NULL,
  `eqpmnt_rcrd_sts` int(11) NOT NULL,
  `eqpmnt_type` varchar(255) NOT NULL,
  `eqpmnt_unx_tm_crt` datetime(6) NOT NULL,
  `eqpmnt_unx_tm_updt` datetime(6) NOT NULL,
  `room_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exploitation_unit`
--

CREATE TABLE `exploitation_unit` (
  `expl_unit_ky` bigint(20) NOT NULL,
  `expl_unit_nm` varchar(255) NOT NULL,
  `expl_unit_rcrd_sts` int(11) NOT NULL,
  `expl_unit_unx_tm_crt` datetime(6) NOT NULL,
  `expl_unit_unx_tm_updt` datetime(6) NOT NULL,
  `service_area_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `message_ky` bigint(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `sent_date` datetime(6) NOT NULL,
  `receiver_user_ky` bigint(20) DEFAULT NULL,
  `sender_user_ky` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `notification_ky` bigint(20) NOT NULL,
  `notification_color` varchar(255) NOT NULL,
  `notification_icon` varchar(255) NOT NULL,
  `notification_message` varchar(255) NOT NULL,
  `notification_status` bit(1) NOT NULL,
  `notification_unx_tm_crt` datetime(6) NOT NULL,
  `recipient_ky` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `object`
--

CREATE TABLE `object` (
  `object_ky` bigint(20) NOT NULL,
  `object_covid_result` varchar(255) DEFAULT NULL,
  `object_label` varchar(255) NOT NULL,
  `object_path` varchar(1000) NOT NULL,
  `object_rcrd_sts` int(11) NOT NULL,
  `object_tp` varchar(255) NOT NULL,
  `object_unx_tm_crt` datetime(6) NOT NULL,
  `object_unx_tm_updt` datetime(6) NOT NULL,
  `report_ref` bigint(20) DEFAULT NULL,
  `series_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `object`
--

INSERT INTO `object` (`object_ky`, `object_covid_result`, `object_label`, `object_path`, `object_rcrd_sts`, `object_tp`, `object_unx_tm_crt`, `object_unx_tm_updt`, `report_ref`, `series_ref`) VALUES
(1, NULL, 'Object 1', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115108611_52_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(2, NULL, 'Object 2', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115108623_47_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(3, NULL, 'Object 3', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115109018_72_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(4, NULL, 'Object 4', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115110416_58_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(5, NULL, 'Object 5', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115112140_60_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(6, NULL, 'Object 6', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115112215_45_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(7, NULL, 'Object 7', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115112454_73_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(8, NULL, 'Object 8', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115114340_79_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(9, NULL, 'Object 9', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115114529_88_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(10, NULL, 'Object 10', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115115192_48_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(11, NULL, 'Object 11', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115115356_69_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(12, NULL, 'Object 12', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115115864_53_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(13, NULL, 'Object 13', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115117088_71_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(14, NULL, 'Object 14', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115117207_81_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(15, NULL, 'Object 15', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118015_74_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(16, NULL, 'Object 16', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118222_54_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(17, NULL, 'Object 17', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118263_64_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(18, NULL, 'Object 18', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118575_86_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2),
(19, NULL, 'Object 19', 'iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115119407_49_S868724_I1221049.dcm', 1, 'dcm', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `report`
--

CREATE TABLE `report` (
  `report_ky` bigint(20) NOT NULL,
  `generated_by` bigint(20) DEFAULT NULL,
  `report_signed` bit(1) DEFAULT NULL,
  `report_access_nmbr` int(11) DEFAULT NULL,
  `report_comment` varchar(1000) DEFAULT NULL,
  `report_findings` varchar(1000) DEFAULT NULL,
  `report_impression` varchar(1000) DEFAULT NULL,
  `report_label` varchar(255) NOT NULL,
  `report_path` longtext DEFAULT NULL,
  `report_rcrd_sts` int(11) NOT NULL,
  `report_status` varchar(255) NOT NULL,
  `report_type` varchar(255) NOT NULL,
  `report_unx_tm_crt` datetime(6) NOT NULL,
  `report_unx_tm_sign` datetime(6) DEFAULT NULL,
  `report_unx_tm_updt` datetime(6) NOT NULL,
  `report_version` varchar(255) DEFAULT NULL,
  `study_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `report_version`
--

CREATE TABLE `report_version` (
  `report_version_ky` bigint(20) NOT NULL,
  `report_version_comment` varchar(1000) DEFAULT NULL,
  `report_version_findings` varchar(1000) DEFAULT NULL,
  `report_version_impression` varchar(1000) DEFAULT NULL,
  `report_version_label` varchar(255) NOT NULL,
  `report_version_path` varchar(255) DEFAULT NULL,
  `report_version_rcrd_sts` int(11) NOT NULL,
  `report_version_signed` bit(1) DEFAULT NULL,
  `report_version_status` varchar(255) NOT NULL,
  `report_version_type` varchar(255) NOT NULL,
  `report_version_unx_tm_crt` datetime(6) NOT NULL,
  `report_version_unx_tm_sign` datetime(6) DEFAULT NULL,
  `report_version_unx_tm_updt` datetime(6) NOT NULL,
  `report_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `room_ky` bigint(20) NOT NULL,
  `room_class` varchar(255) DEFAULT NULL,
  `room_label` varchar(255) NOT NULL,
  `room_rcrd_sts` int(11) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `room_unx_tm_crt` datetime(6) NOT NULL,
  `room_unx_tm_updt` datetime(6) NOT NULL,
  `room_grp_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `room_group`
--

CREATE TABLE `room_group` (
  `room_grp_ky` bigint(20) NOT NULL,
  `room_grp_nm` varchar(255) NOT NULL,
  `room_grp_rcrd_sts` int(11) NOT NULL,
  `room_grp_unx_tm_crt` datetime(6) NOT NULL,
  `room_grp_unx_tm_updt` datetime(6) NOT NULL,
  `exploitation_unit_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

CREATE TABLE `series` (
  `series_ky` bigint(20) NOT NULL,
  `series_body_part` varchar(255) NOT NULL,
  `series_dcm_modality` varchar(255) NOT NULL,
  `series_desc` varchar(255) DEFAULT NULL,
  `series_dlp` varchar(255) NOT NULL,
  `series_label` varchar(255) NOT NULL,
  `series_rcrd_sts` int(11) NOT NULL,
  `series_unx_tm_crt` datetime(6) NOT NULL,
  `series_unx_tm_updt` datetime(6) NOT NULL,
  `study_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `series`
--

INSERT INTO `series` (`series_ky`, `series_body_part`, `series_dcm_modality`, `series_desc`, `series_dlp`, `series_label`, `series_rcrd_sts`, `series_unx_tm_crt`, `series_unx_tm_updt`, `study_ref`) VALUES
(1, 'hyena', 'CT', 'Id iusto quia iusto est.', '422 mGy/cm', 'Series 1', 1, '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', 2),
(2, 'duck', 'MRI', 'Voluptatem et qui sapiente qui sed pariatur molestias.', '339 mGy/cm', 'Series 2', 1, '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', 28),
(3, 'mosquito', 'CT', 'Et repudiandae inventore reprehenderit.', '912 mGy/cm', 'Series 3', 0, '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', 13),
(4, 'yak', 'CT', 'Voluptas non recusandae aut fuga enim ut eum.', '602 mGy/cm', 'Series 4', 1, '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', 50),
(5, 'frog', 'CT', 'Voluptate ratione suscipit.', '776 mGy/cm', 'Series 5', 0, '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', 6);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `service_ky` bigint(20) NOT NULL,
  `service_nm` varchar(255) NOT NULL,
  `service_rcrd_sts` int(11) NOT NULL,
  `service_unx_tm_crt` datetime(6) NOT NULL,
  `service_unx_tm_updt` datetime(6) NOT NULL,
  `site_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service_area`
--

CREATE TABLE `service_area` (
  `serv_area_ky` bigint(20) NOT NULL,
  `serv_area_nm` varchar(255) NOT NULL,
  `serv_area_rcrd_sts` int(11) NOT NULL,
  `serv_area_unx_tm_crt` datetime(6) NOT NULL,
  `serv_area_unx_tm_updt` datetime(6) NOT NULL,
  `service_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shared_exam_link`
--

CREATE TABLE `shared_exam_link` (
  `shared_exam_ky` bigint(20) NOT NULL,
  `rfrntphysic_id` bigint(20) DEFAULT NULL,
  `exam_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `site_ky` bigint(20) NOT NULL,
  `site_country` varchar(255) DEFAULT NULL,
  `site_nm` varchar(255) NOT NULL,
  `site_rcrd_sts` int(11) NOT NULL,
  `site_unx_tm_crt` datetime(6) NOT NULL,
  `site_unx_tm_updt` datetime(6) NOT NULL,
  `site_grp_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_group`
--

CREATE TABLE `site_group` (
  `site_grp_ky` bigint(20) NOT NULL,
  `site_grp_nm` varchar(255) NOT NULL,
  `site_grp_rcrd_sts` int(11) NOT NULL,
  `site_grp_unx_tm_crt` datetime(6) NOT NULL,
  `site_grp_unx_tm_updt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `study`
--

CREATE TABLE `study` (
  `study_ky` bigint(20) NOT NULL,
  `study_aetitle` varchar(255) NOT NULL,
  `study_comment` varchar(255) NOT NULL,
  `study_date` datetime(6) DEFAULT NULL,
  `study_desc` varchar(255) NOT NULL,
  `study_label` varchar(255) NOT NULL,
  `study_note` text DEFAULT NULL,
  `study_priority` varchar(255) NOT NULL,
  `study_rcrd_sts` int(11) NOT NULL,
  `study_status` varchar(255) NOT NULL,
  `study_type` varchar(255) NOT NULL,
  `study_unx_tm_crt` datetime(6) NOT NULL,
  `study_unx_tm_updt` datetime(6) NOT NULL,
  `patient_ref` bigint(20) DEFAULT NULL,
  `prfrmng_physic_ref` bigint(20) DEFAULT NULL,
  `rfrnt_physic_ref` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `study`
--

INSERT INTO `study` (`study_ky`, `study_aetitle`, `study_comment`, `study_date`, `study_desc`, `study_label`, `study_note`, `study_priority`, `study_rcrd_sts`, `study_status`, `study_type`, `study_unx_tm_crt`, `study_unx_tm_updt`, `patient_ref`, `prfrmng_physic_ref`, `rfrnt_physic_ref`) VALUES
(1, 'AETitle0', 'Nemo est facilis doloribus vel veniam quis reiciendis facilis ad.', '2022-01-12 12:09:05.000000', 'Autem non voluptatem in sint et dicta.', 'Exam 1 - PET_SCAN - Dagny Abernathy (22)', NULL, 'High', 0, 'Archived', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 22, 34, 28),
(2, 'AETitle1', 'Nam assumenda fugit qui maxime enim tenetur ipsa eligendi ad ut aliquam tempore quis voluptas.', '2022-08-05 19:03:30.000000', 'Ut inventore temporibus velit.', 'Exam 2 - CT_SCAN - Clair Hagenes (8)', NULL, 'Normal', 0, 'Archived', 'CT_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 8, 34, 28),
(3, 'AETitle2', 'Rem blanditiis laborum quibusdam alias vero aut quis deserunt assumenda.', '2022-03-23 23:17:50.000000', 'Rerum tempora ullam.', 'Exam 3 - XRAY - Alina Ledner (9)', NULL, 'Normal', 1, 'Report Sent', 'XRAY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 9, 33, 29),
(4, 'AETitle3', 'Accusamus ut voluptatem aut voluptatibus asperiores molestiae et laudantium est voluptas.', '2022-11-29 01:43:36.000000', 'Sapiente error eaque deserunt adipisci doloremque ut.', 'Exam 4 - ULTRASOUND - Rena Bode (11)', NULL, 'Normal', 1, 'In Progress', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 11, 31, 28),
(5, 'AETitle4', 'Harum iure earum vel dicta ex totam aliquid ut numquam sunt.', '2022-03-02 22:53:24.000000', 'Et rerum ut possimus.', 'Exam 5 - XRAY - Ricarda Morar (15)', NULL, 'Normal', 1, 'In Progress', 'XRAY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 15, 31, 28),
(6, 'AETitle5', 'Quia laborum odio sit rerum ducimus in quisquam sequi cumque cumque est sit.', '2022-09-11 06:29:40.000000', 'Architecto ullam fugit.', 'Exam 6 - MAMMOGRAPHY - Lanny Harvey (19)', NULL, 'Low', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 19, 32, 27),
(7, 'AETitle6', 'Dolores et sed dolorem repellat praesentium suscipit commodi cupiditate esse quis officiis reprehenderit.', '2022-10-22 16:08:50.000000', 'Qui suscipit esse.', 'Exam 7 - PET_SCAN - Dagny Abernathy (22)', NULL, 'Low', 1, 'Report Sent', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 22, 32, 29),
(8, 'AETitle7', 'Consectetur labore in earum consequatur qui itaque dolor nisi cumque non.', '2022-03-29 20:08:33.000000', 'Laudantium non voluptates saepe illo.', 'Exam 8 - MAMMOGRAPHY - Willy Koepp (10)', NULL, 'Normal', 1, 'Pending Interpretation', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 10, 33, 28),
(9, 'AETitle8', 'Provident optio placeat sapiente distinctio nemo quia amet ut itaque possimus placeat.', '2022-03-24 19:08:49.000000', 'Quam perspiciatis blanditiis dolor reprehenderit et delectus quia.', 'Exam 9 - MAMMOGRAPHY - Darren Predovic (7)', NULL, 'High', 1, 'Pending Interpretation', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 7, 32, 29),
(10, 'AETitle9', 'Aut repellendus ut enim aperiam placeat praesentium aspernatur quisquam nemo.', '2022-07-17 14:40:36.000000', 'Voluptatem architecto iste sed nihil eum nihil.', 'Exam 10 - MRI - Raelene Weissnat (6)', NULL, 'Normal', 1, 'Pending Interpretation', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 6, 33, 29),
(11, 'AETitle10', 'Doloribus temporibus velit totam quas quis recusandae unde delectus molestias nostrum occaecati distinctio dolor sapiente.', '2022-12-13 04:31:32.000000', 'Sit libero autem quibusdam ratione.', 'Exam 11 - MRI - Katelyn Collier (17)', NULL, 'High', 1, 'Pending Review', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 17, 34, 29),
(12, 'AETitle11', 'Accusamus fugit quis molestias deleniti porro possimus maxime reprehenderit quia facere dicta quisquam.', '2022-10-18 10:18:22.000000', 'Soluta et omnis ut molestias nostrum consequatur.', 'Exam 12 - MAMMOGRAPHY - Ricarda Morar (15)', NULL, 'Normal', 1, 'Report Sent', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 15, 33, 28),
(13, 'AETitle12', 'Nobis aperiam quod ut culpa dolore assumenda ipsam quidem aspernatur omnis sed.', '2022-09-19 20:11:34.000000', 'Sint earum officiis dolorem fugit.', 'Exam 13 - CT_SCAN - Cody Leffler (23)', NULL, 'Normal', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 23, 31, 28),
(14, 'AETitle13', 'Accusamus accusantium reprehenderit atque minima earum expedita maiores sit voluptatibus et voluptate.', '2022-10-02 13:05:14.000000', 'Qui non maiores sed.', 'Exam 14 - PET_SCAN - Willy Koepp (10)', NULL, 'High', 1, 'Pending Interpretation', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 10, 33, 28),
(15, 'AETitle14', 'Modi aliquam odio saepe voluptatem dolor iure repellendus voluptates eum sit adipisci praesentium possimus.', '2022-03-12 19:31:57.000000', 'Eos sequi voluptatem est et.', 'Exam 15 - ULTRASOUND - Hortense Jakubowski (16)', NULL, 'Low', 1, 'Report Sent', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 16, 32, 29),
(16, 'AETitle15', 'Sit eaque fugit ut dolores saepe corporis quo corrupti veritatis odio accusantium a itaque.', '2022-03-21 19:47:46.000000', 'Perferendis eaque illum nobis.', 'Exam 16 - PET_SCAN - Katelyn Collier (17)', NULL, 'High', 1, 'Pending Interpretation', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 17, 33, 29),
(17, 'AETitle16', 'Hic quaerat ea veritatis ab ut laudantium natus quia pariatur culpa quis.', '2022-08-07 11:53:57.000000', 'Possimus qui cumque.', 'Exam 17 - XRAY - Dagny Abernathy (22)', NULL, 'Low', 1, 'Pending Interpretation', 'XRAY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 22, 32, 29),
(18, 'AETitle17', 'Aut ex neque sed nulla sint ut minus expedita facilis aperiam nesciunt.', '2022-02-20 21:53:11.000000', 'Nihil quas blanditiis.', 'Exam 18 - CT_SCAN - Darren Predovic (7)', NULL, 'Normal', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 7, 31, 27),
(19, 'AETitle18', 'A eius eum aut quae reprehenderit aut itaque cum hic.', '2022-09-05 23:46:55.000000', 'Maxime vero soluta error dolorum eius.', 'Exam 19 - ULTRASOUND - Alina Ledner (9)', NULL, 'Normal', 1, 'Pending Interpretation', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 9, 32, 29),
(20, 'AETitle19', 'Praesentium vel ex reiciendis culpa ipsa perspiciatis quod id fugiat.', '2022-01-06 12:01:02.000000', 'Voluptatem eum eaque enim esse.', 'Exam 20 - MAMMOGRAPHY - Rena Bode (11)', NULL, 'Low', 1, 'In Progress', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 11, 32, 27),
(21, 'AETitle20', 'A aliquam optio iste est eius sed est sit voluptas omnis aut placeat.', '2024-11-10 12:21:46.000000', 'Voluptatibus velit enim et officiis voluptatibus.', 'Exam 21 - ULTRASOUND - Ronny Rempel (12)', NULL, 'High', 1, 'Pending Review', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 12, 33, 28),
(22, 'AETitle21', 'Ad exercitationem ipsum et vero eveniet reprehenderit ad quia non sint.', '2024-11-10 12:21:46.000000', 'Voluptas voluptas aliquam dolorem eligendi repudiandae.', 'Exam 22 - PET_SCAN - Cody Leffler (23)', NULL, 'Low', 1, 'Pending Interpretation', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 23, 34, 29),
(23, 'AETitle22', 'Enim ut aspernatur harum ea qui officia aperiam illum libero aliquid laborum.', '2024-11-10 12:21:46.000000', 'Quis exercitationem sunt voluptas ut commodi laborum.', 'Exam 23 - CT_SCAN - Willy Koepp (10)', NULL, 'Normal', 1, 'In Progress', 'CT_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 10, 32, 29),
(24, 'AETitle23', 'Incidunt nesciunt quisquam non sed et laborum expedita molestiae nostrum eius quaerat deserunt.', '2024-11-10 12:21:46.000000', 'Voluptatem rem qui est.', 'Exam 24 - XRAY - Stormy Herman (20)', NULL, 'Normal', 1, 'Pending Review', 'XRAY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 20, 33, 28),
(25, 'AETitle24', 'Eius itaque qui perferendis sit aliquid ratione deleniti dignissimos est quos et vero.', '2024-11-10 12:21:46.000000', 'Est dolorem sed non consequatur voluptas vel.', 'Exam 25 - MAMMOGRAPHY - Lanny Harvey (19)', NULL, 'Low', 1, 'Pending Interpretation', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 19, 32, 28),
(26, 'AETitle25', 'Repudiandae in hic ut dolorum ea occaecati eveniet vitae nemo consequatur et.', '2024-11-10 12:21:46.000000', 'Doloribus quia vel quia et.', 'Exam 26 - PET_SCAN - Rena Bode (11)', NULL, 'High', 1, 'Pending Interpretation', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 11, 32, 28),
(27, 'AETitle26', 'At exercitationem tempore animi tempore dolor aut sapiente eligendi aliquam est officia non quidem.', '2024-11-10 12:21:46.000000', 'Consequuntur saepe voluptate quidem velit explicabo ullam illum.', 'Exam 27 - MAMMOGRAPHY - Mikki Berge (18)', NULL, 'Low', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 18, 32, 27),
(28, 'AETitle27', 'Quae ipsam explicabo enim eaque repudiandae harum rerum consequuntur exercitationem quia aut distinctio adipisci.', '2024-11-10 12:21:46.000000', 'Et consectetur officiis.', 'Exam 28 - PET_SCAN - Stormy Herman (20)', NULL, 'Normal', 1, 'In Progress', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 20, 34, 29),
(29, 'AETitle28', 'Reprehenderit iusto expedita voluptatem expedita adipisci non et ut autem qui suscipit.', '2024-11-10 12:21:46.000000', 'Eos maxime consequatur.', 'Exam 29 - CT_SCAN - Rena Bode (11)', NULL, 'High', 0, 'Archived', 'CT_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 11, 32, 27),
(30, 'AETitle29', 'Omnis voluptatum labore aut ut natus numquam quia aut numquam molestias aspernatur sit enim.', '2024-11-10 12:21:46.000000', 'Occaecati sunt vel.', 'Exam 30 - ULTRASOUND - Katelyn Collier (17)', NULL, 'Normal', 1, 'Pending Review', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 17, 33, 29),
(31, 'AETitle30', 'Excepturi numquam ducimus qui quaerat culpa aut quas eveniet amet voluptatibus sequi non quibusdam.', '2024-11-10 12:21:46.000000', 'Quo magni beatae rem quia sit natus corrupti.', 'Exam 31 - MRI - Lanny Harvey (19)', NULL, 'High', 1, 'Pending Review', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 19, 34, 27),
(32, 'AETitle31', 'Repellendus dolor nesciunt voluptatem deserunt temporibus laborum suscipit nihil similique dolorem dolores quo.', '2022-11-08 15:21:31.000000', 'In qui voluptatum ut facere.', 'Exam 32 - MRI - Rena Bode (11)', NULL, 'High', 0, 'Archived', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 11, 31, 28),
(33, 'AETitle32', 'Voluptatum quis aut vero a et fugit et optio voluptatibus ut mollitia aut omnis.', '2022-10-22 20:34:41.000000', 'Reprehenderit ea ut ipsam enim accusamus et.', 'Exam 33 - MAMMOGRAPHY - Clorinda Beatty (14)', NULL, 'Normal', 1, 'Report Sent', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 14, 32, 27),
(34, 'AETitle33', 'Amet voluptas voluptates aut et sint voluptatem iure qui et rerum velit perspiciatis aut.', '2022-09-25 16:09:28.000000', 'Nulla numquam et.', 'Exam 34 - MRI - Hortense Jakubowski (16)', NULL, 'Normal', 0, 'Archived', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 16, 32, 27),
(35, 'AETitle34', 'Maiores et sed id magni ipsam esse asperiores non accusamus et.', '2022-12-15 07:10:24.000000', 'Voluptatibus consequatur fugit iusto consequatur rem.', 'Exam 35 - PET_SCAN - Katelyn Collier (17)', NULL, 'Normal', 0, 'Archived', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 17, 34, 27),
(36, 'AETitle35', 'Tempora adipisci voluptatum est corrupti eaque quos quo cum voluptatem ad.', '2022-10-22 11:29:57.000000', 'Eos quis consectetur ut suscipit qui ut.', 'Exam 36 - MAMMOGRAPHY - Jonas Swift (13)', NULL, 'High', 1, 'Pending Review', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 13, 33, 28),
(37, 'AETitle36', 'Expedita eaque eveniet similique sit perspiciatis minus quis eos nesciunt amet corrupti non.', '2022-07-09 15:57:18.000000', 'Corporis sed dicta voluptatum voluptates reiciendis.', 'Exam 37 - ULTRASOUND - Clorinda Beatty (14)', NULL, 'Low', 0, 'Archived', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 14, 32, 29),
(38, 'AETitle37', 'Repellendus et nihil nostrum quae aperiam fugit neque a dolor molestiae libero itaque vero.', '2021-12-19 02:54:42.000000', 'Reprehenderit vitae illo est quaerat.', 'Exam 38 - ULTRASOUND - Raelene Weissnat (6)', NULL, 'Normal', 0, 'Archived', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 6, 32, 29),
(39, 'AETitle38', 'Odit repellat earum enim aut consectetur harum ut soluta modi amet omnis quia.', '2022-08-29 23:59:40.000000', 'Nemo eveniet optio vitae expedita accusamus dolorum voluptates.', 'Exam 39 - ULTRASOUND - Mikki Berge (18)', NULL, 'High', 0, 'Archived', 'ULTRASOUND', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 18, 32, 28),
(40, 'AETitle39', 'Architecto aut non repudiandae blanditiis quae nihil et omnis fugiat.', '2022-01-12 03:51:59.000000', 'Voluptas amet cum ratione qui qui deserunt at.', 'Exam 40 - MRI - Raelene Weissnat (6)', NULL, 'High', 0, 'Archived', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 6, 31, 27),
(41, 'AETitle40', 'In et porro placeat dignissimos ea aliquid impedit fugiat vel tempora qui.', '2022-05-20 22:06:48.000000', 'Dolor ut tenetur suscipit veniam qui.', 'Exam 41 - XRAY - Hortense Jakubowski (16)', NULL, 'Normal', 1, 'Pending Interpretation', 'XRAY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 16, 32, 27),
(42, 'AETitle41', 'Tempora alias mollitia minus assumenda non ut aliquam accusantium distinctio repudiandae.', '2022-01-24 22:19:26.000000', 'Dolorem voluptatibus maiores error libero enim minus magnam.', 'Exam 42 - CT_SCAN - Clair Hagenes (8)', NULL, 'High', 1, 'Pending Review', 'CT_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 8, 33, 26),
(43, 'AETitle42', 'Consequatur voluptatum excepturi perferendis consequuntur vitae voluptatem et quibusdam soluta veritatis aspernatur qui accusamus qui.', '2022-07-21 02:31:45.000000', 'Reprehenderit eum rerum et.', 'Exam 43 - PET_SCAN - Lanny Harvey (19)', NULL, 'Low', 1, 'Interpreted', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 19, 31, 28),
(44, 'AETitle43', 'Excepturi cum dolores architecto ullam sint natus optio ex est nesciunt sint occaecati ea fugiat.', '2022-01-26 13:31:08.000000', 'Sit eum vitae est voluptatum.', 'Exam 44 - MAMMOGRAPHY - Ronny Rempel (12)', NULL, 'High', 1, 'Pending Interpretation', 'MAMMOGRAPHY', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 12, 34, 26),
(45, 'AETitle44', 'Enim voluptates atque rerum hic dolores labore inventore sint architecto ratione qui dolorum eveniet suscipit.', '2022-04-20 05:32:33.000000', 'Et pariatur et.', 'Exam 45 - MRI - Alina Ledner (9)', NULL, 'Normal', 1, 'Pending Review', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 9, 33, 28),
(46, 'AETitle45', 'Ipsum molestiae aliquam omnis nihil numquam veritatis nisi sit sed maxime repellat et commodi labore.', '2022-10-09 00:16:48.000000', 'Voluptatem quos ab unde.', 'Exam 46 - MRI - Lanny Harvey (19)', NULL, 'Low', 1, 'Pending Interpretation', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 19, 34, 29),
(47, 'AETitle46', 'Repellat est temporibus perspiciatis enim nisi aut et perspiciatis quia sed recusandae eum quod.', '2022-08-17 17:53:21.000000', 'A possimus nam illo.', 'Exam 47 - PET_SCAN - Alina Ledner (9)', NULL, 'High', 1, 'Report Sent', 'PET_SCAN', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 9, 34, 29),
(48, 'AETitle47', 'Reiciendis ullam et ullam ut necessitatibus molestiae assumenda illo exercitationem voluptas sed rerum.', '2022-06-28 02:29:57.000000', 'Earum cum nihil quo.', 'Exam 48 - MRI - Ronny Rempel (12)', NULL, 'Normal', 0, 'Archived', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 12, 31, 28),
(49, 'AETitle48', 'Iusto delectus sint omnis beatae velit quia voluptate officiis nam voluptatem amet occaecati temporibus sunt.', '2022-02-22 05:15:33.000000', 'Quia nostrum dolor in autem perferendis.', 'Exam 49 - MRI - Katelyn Collier (17)', NULL, 'Normal', 1, 'Pending Interpretation', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 17, 31, 29),
(50, 'AETitle49', 'Quis in est et qui excepturi ut ex porro eius quia dolorem.', '2022-01-09 11:01:56.000000', 'Beatae fugiat repellat rerum omnis.', 'Exam 50 - MRI - Ronny Rempel (12)', NULL, 'High', 1, 'Pending Review', 'MRI', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 12, 32, 28),
(51, 'AETitle0', 'Molestias vel aut ut optio esse ab voluptatum dolorem alias sunt.', '2022-03-14 01:16:42.000000', 'Voluptate sit laborum eveniet corporis.', 'Exam 1 - ULTRASOUND - Jude Walter (64)', NULL, 'Normal', 1, 'Pending Interpretation', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 64, 75, 68),
(52, 'AETitle1', 'Error ut sunt distinctio voluptatem harum facilis et quia aut eius velit dolores distinctio deserunt.', '2022-12-07 15:09:23.000000', 'Qui voluptas corporis.', 'Exam 2 - MRI - Jude Walter (64)', NULL, 'High', 0, 'Archived', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 64, 75, 70),
(53, 'AETitle2', 'Aut sit asperiores vel voluptatem quia totam voluptas laborum est qui.', '2022-07-12 12:29:13.000000', 'Eum nemo accusamus aut beatae omnis quas.', 'Exam 3 - PET_SCAN - Bert Swaniawski (52)', NULL, 'Low', 0, 'Archived', 'PET_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 52, 75, 70),
(54, 'AETitle3', 'Ducimus soluta fugiat et quas blanditiis eum voluptatem reprehenderit animi molestias velit qui.', '2022-04-20 12:49:15.000000', 'Quia inventore deserunt doloribus.', 'Exam 4 - MRI - Margarito Rippin (53)', NULL, 'Low', 1, 'Interpreted', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 53, 74, 67),
(55, 'AETitle4', 'Voluptas maiores cupiditate minima ea voluptatem necessitatibus et voluptas quisquam accusantium et.', '2022-10-31 14:22:10.000000', 'Sit ad id eum deleniti et totam.', 'Exam 5 - ULTRASOUND - Madge Witting (58)', NULL, 'High', 1, 'Pending Interpretation', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 58, 73, 69),
(56, 'AETitle5', 'Facere fugit quos ratione aliquam placeat et minima illum iusto provident.', '2022-07-18 08:02:05.000000', 'Quia omnis et omnis magnam provident animi occaecati.', 'Exam 6 - ULTRASOUND - Luigi Herman (61)', NULL, 'Low', 0, 'Archived', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 61, 73, 70),
(57, 'AETitle6', 'Est quia ipsam sit quisquam quibusdam assumenda est quos repellendus.', '2022-03-26 07:14:29.000000', 'Illum quo ab ut est odio.', 'Exam 7 - MRI - Bert Swaniawski (52)', NULL, 'Normal', 1, 'Pending Review', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 52, 74, 69),
(58, 'AETitle7', 'Quia enim et recusandae eos quas quidem est est labore aut eius repudiandae doloribus cumque.', '2022-04-22 03:20:09.000000', 'Provident temporibus corporis eos ut non commodi vel.', 'Exam 8 - MRI - Nelle Bechtelar (54)', NULL, 'High', 1, 'In Progress', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 54, 74, 70),
(59, 'AETitle8', 'Sint sint labore dicta animi qui consectetur sit perspiciatis quis nesciunt voluptatem consectetur voluptate.', '2022-09-11 14:36:57.000000', 'Maiores quibusdam iusto voluptas quos repellendus debitis.', 'Exam 9 - CT_SCAN - Jude Walter (64)', NULL, 'High', 1, 'In Progress', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 64, 73, 70),
(60, 'AETitle9', 'Neque veritatis porro tempore dicta voluptas ipsum consectetur itaque odit consequatur corrupti est quo.', '2022-07-22 06:23:17.000000', 'Porro eum blanditiis vel et dicta vitae dignissimos.', 'Exam 10 - MAMMOGRAPHY - Bennie Paucek (56)', NULL, 'High', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 56, 74, 69),
(61, 'AETitle10', 'Voluptate numquam quisquam consectetur dicta sed enim sint quae vero doloremque.', '2022-06-24 18:19:38.000000', 'Tempora esse reiciendis accusamus veritatis illo laborum aut.', 'Exam 11 - MRI - Renay Labadie (49)', NULL, 'Low', 0, 'Archived', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 49, 73, 68),
(62, 'AETitle11', 'Quod vitae sed debitis quisquam inventore blanditiis et ratione voluptatem eligendi nihil ratione.', '2022-12-19 00:04:59.000000', 'Deserunt commodi ut libero.', 'Exam 12 - CT_SCAN - Lavern Friesen (55)', NULL, 'Low', 0, 'Archived', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 55, 73, 69),
(63, 'AETitle12', 'Sed at omnis consequatur maxime explicabo sint temporibus sunt et laudantium consequatur aut.', '2022-06-18 19:45:13.000000', 'Saepe quaerat officia consequatur dolor at iste.', 'Exam 13 - MRI - Nelle Bechtelar (54)', NULL, 'High', 1, 'Interpreted', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 54, 73, 70),
(64, 'AETitle13', 'Ipsa blanditiis mollitia sequi inventore dolorum dignissimos voluptatem cumque mollitia accusamus molestias voluptatibus.', '2022-05-19 23:13:29.000000', 'Eveniet commodi ipsam at impedit.', 'Exam 14 - ULTRASOUND - Nelle Bechtelar (54)', NULL, 'High', 1, 'Report Sent', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 54, 74, 70),
(65, 'AETitle14', 'Praesentium quos sed possimus non nostrum sequi libero quasi saepe numquam aut.', '2022-08-14 08:44:34.000000', 'Dolores eos possimus harum placeat qui aut voluptatem.', 'Exam 15 - MRI - Dave Dickens (47)', NULL, 'Low', 1, 'Interpreted', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 47, 75, 68),
(66, 'AETitle15', 'Sunt quidem harum excepturi distinctio animi id enim ducimus exercitationem vel et et similique exercitationem.', '2022-03-07 06:43:30.000000', 'Architecto molestiae aperiam assumenda enim.', 'Exam 16 - CT_SCAN - Jude Walter (64)', NULL, 'Low', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 64, 73, 70),
(67, 'AETitle16', 'Dicta consequatur nesciunt est voluptatem est fuga aut et inventore et ea qui aut est.', '2022-10-18 10:58:31.000000', 'Adipisci culpa et excepturi saepe minima.', 'Exam 17 - ULTRASOUND - Dave Dickens (47)', NULL, 'Low', 0, 'Archived', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 47, 75, 69),
(68, 'AETitle17', 'Sed eligendi aut molestias ut exercitationem sequi quae dolor neque dolorem magnam reiciendis qui.', '2022-12-07 20:21:54.000000', 'Et et aut.', 'Exam 18 - ULTRASOUND - Yi Kuhn (62)', NULL, 'Normal', 0, 'Archived', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 62, 73, 70),
(69, 'AETitle18', 'Accusantium facere dolore est placeat enim incidunt vero quia eaque a nulla omnis corrupti.', '2022-07-02 02:43:35.000000', 'Autem beatae natus qui natus.', 'Exam 19 - XRAY - Renay Labadie (49)', NULL, 'High', 1, 'Pending Interpretation', 'XRAY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 49, 72, 70),
(70, 'AETitle19', 'Voluptatibus reiciendis reiciendis at nostrum sed dolorem vel fugit rerum quaerat et delectus vel veniam.', '2022-09-27 22:24:49.000000', 'Dolorem possimus est in atque consectetur.', 'Exam 20 - PET_SCAN - Nelle Bechtelar (54)', NULL, 'High', 1, 'Report Sent', 'PET_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 54, 74, 68),
(71, 'AETitle20', 'Iusto sequi at voluptatem ut et laboriosam aliquam vitae non cupiditate.', '2024-11-11 12:34:57.000000', 'Quod magnam quisquam laudantium dolore aut repellendus aut.', 'Exam 21 - MAMMOGRAPHY - Bert Swaniawski (52)', NULL, 'Normal', 1, 'Interpreted', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 52, 75, 70),
(72, 'AETitle21', 'Consequatur facere omnis harum voluptatem porro ratione veritatis veniam minus aut provident.', '2024-11-11 12:34:57.000000', 'Ad eos reiciendis.', 'Exam 22 - ULTRASOUND - Drew Frami (48)', NULL, 'High', 1, 'Pending Interpretation', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 48, 75, 69),
(73, 'AETitle22', 'Deserunt dolor architecto laudantium molestiae et deserunt repellat harum placeat assumenda unde provident.', '2024-11-11 12:34:57.000000', 'Qui qui ipsum ullam quibusdam ut officia.', 'Exam 23 - MRI - Jude Walter (64)', NULL, 'Normal', 1, 'Pending Review', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 64, 73, 70),
(74, 'AETitle23', 'Vitae enim tempora animi eaque quasi in ea consequatur reprehenderit.', '2024-11-11 12:34:57.000000', 'Quidem debitis asperiores doloremque quis exercitationem optio amet.', 'Exam 24 - MAMMOGRAPHY - Madge Witting (58)', NULL, 'Normal', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 58, 75, 70),
(75, 'AETitle24', 'Veritatis est sint reprehenderit minus deserunt nulla ut asperiores voluptatem necessitatibus.', '2024-11-11 12:34:57.000000', 'Esse saepe est repellendus vel qui maiores.', 'Exam 25 - ULTRASOUND - Bennie Paucek (56)', NULL, 'Low', 1, 'Report Sent', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 56, 75, 69),
(76, 'AETitle25', 'Quibusdam eos corrupti quasi earum mollitia hic autem atque consequatur.', '2024-11-11 12:34:57.000000', 'Est error fugiat magni non.', 'Exam 26 - XRAY - Nelle Bechtelar (54)', NULL, 'Low', 0, 'Archived', 'XRAY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 54, 73, 68),
(77, 'AETitle26', 'Magnam sed consequuntur reiciendis facilis vel enim sint quidem fuga.', '2024-11-11 12:34:57.000000', 'Omnis dolor ipsum enim.', 'Exam 27 - ULTRASOUND - John Haag (57)', NULL, 'Normal', 1, 'Pending Interpretation', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 57, 75, 67),
(78, 'AETitle27', 'Veritatis eum et beatae provident fugiat repellat minima sed numquam voluptas consequuntur suscipit ut laudantium.', '2024-11-11 12:34:57.000000', 'Et dolor iste vitae fugit.', 'Exam 28 - PET_SCAN - Madge Witting (58)', NULL, 'Low', 1, 'Pending Interpretation', 'PET_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 58, 75, 68),
(79, 'AETitle28', 'Ullam in quia porro saepe corrupti magni unde qui quis non qui.', '2024-11-11 12:34:57.000000', 'Corrupti illo non dolor explicabo in natus vel.', 'Exam 29 - MAMMOGRAPHY - Renay Labadie (49)', NULL, 'Low', 1, 'Interpreted', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 49, 74, 70),
(80, 'AETitle29', 'Et eaque ea nobis possimus vero voluptas ut expedita ea aut voluptatem.', '2024-11-11 12:34:57.000000', 'Aperiam deleniti labore.', 'Exam 30 - ULTRASOUND - Damaris Schowalter (50)', NULL, 'Normal', 1, 'Interpreted', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 50, 74, 70),
(81, 'AETitle30', 'Officia nesciunt ut et doloribus libero quos nam sed ut et neque asperiores nesciunt alias.', '2024-11-11 12:34:57.000000', 'Quia nostrum itaque eos.', 'Exam 31 - PET_SCAN - Damaris Schowalter (50)', NULL, 'Low', 1, 'Pending Review', 'PET_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 50, 73, 70),
(82, 'AETitle31', 'Aut excepturi sit consequatur sed sit perferendis magnam impedit ab assumenda.', '2022-07-02 23:51:01.000000', 'Ad voluptatum aut pariatur suscipit alias.', 'Exam 32 - XRAY - Renay Labadie (49)', NULL, 'Low', 0, 'Archived', 'XRAY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 49, 74, 69),
(83, 'AETitle32', 'Dolores molestiae ab voluptatem consectetur quibusdam dolorem consequuntur molestias quis eaque porro ab molestiae.', '2022-07-18 01:01:48.000000', 'Omnis facilis dolorem amet et voluptates.', 'Exam 33 - CT_SCAN - Cyndy Hettinger (51)', NULL, 'High', 1, 'In Progress', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 51, 72, 69),
(84, 'AETitle33', 'Laudantium sit esse omnis sit et asperiores aut perferendis nobis ducimus quidem possimus.', '2022-03-12 06:45:16.000000', 'Minus repellat nobis aut quia.', 'Exam 34 - CT_SCAN - Jude Walter (64)', NULL, 'High', 0, 'Archived', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 64, 73, 67),
(85, 'AETitle34', 'Vel tempora possimus at id dolores vel fuga blanditiis eos libero doloribus facere nulla.', '2022-03-30 18:29:15.000000', 'Maiores veniam laboriosam pariatur voluptas nobis.', 'Exam 35 - PET_SCAN - Delbert Feil (60)', NULL, 'Normal', 0, 'Archived', 'PET_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 60, 75, 68),
(86, 'AETitle35', 'Est aut eveniet sit aperiam ut vel qui et dolor itaque doloribus.', '2022-04-16 01:27:30.000000', 'Et doloribus velit non ipsam.', 'Exam 36 - MAMMOGRAPHY - Bert Swaniawski (52)', NULL, 'Low', 1, 'In Progress', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 52, 75, 68),
(87, 'AETitle36', 'Saepe sed quos illo id dolor eum exercitationem ipsa nihil labore.', '2022-12-13 02:51:15.000000', 'Minima dolorem cumque sint cumque.', 'Exam 37 - MRI - Drew Frami (48)', NULL, 'Low', 0, 'Archived', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 48, 75, 70),
(88, 'AETitle37', 'Quia nobis sapiente maxime et alias odit sed dolores officia totam ut.', '2022-06-11 23:41:21.000000', 'Facere voluptatem doloribus.', 'Exam 38 - PET_SCAN - Margarito Rippin (53)', NULL, 'Normal', 0, 'Archived', 'PET_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 53, 75, 68),
(89, 'AETitle38', 'Sint nemo autem voluptate sunt odit facilis architecto hic perspiciatis temporibus iste consequuntur modi laboriosam.', '2022-05-31 16:43:09.000000', 'Sit quia est quos quo architecto.', 'Exam 39 - MRI - Dave Dickens (47)', NULL, 'Low', 0, 'Archived', 'MRI', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 47, 74, 70),
(90, 'AETitle39', 'Delectus nostrum consequatur error mollitia est illo qui eaque saepe est.', '2022-02-11 10:28:53.000000', 'Autem qui qui omnis ab.', 'Exam 40 - MAMMOGRAPHY - John Haag (57)', NULL, 'Normal', 1, 'Pending Interpretation', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 57, 75, 70),
(91, 'AETitle40', 'Aspernatur et velit dolor et quidem esse sunt repellat voluptas soluta dignissimos nisi odio.', '2022-04-18 00:36:04.000000', 'Iusto rem architecto corporis.', 'Exam 41 - XRAY - Margarito Rippin (53)', NULL, 'Low', 1, 'In Progress', 'XRAY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 53, 75, 68),
(92, 'AETitle41', 'Fugit minus ut fuga occaecati est sed sit totam consequatur ut non ipsa.', '2022-04-08 00:45:46.000000', 'Dolores enim est minus unde nulla rerum.', 'Exam 42 - XRAY - Delbert Feil (60)', NULL, 'High', 0, 'Archived', 'XRAY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 60, 75, 69),
(93, 'AETitle42', 'Et amet officia voluptatem ea veniam exercitationem minima labore quo consequatur.', '2022-08-29 13:24:54.000000', 'Et quia optio consequuntur.', 'Exam 43 - ULTRASOUND - Cyndy Hettinger (51)', NULL, 'Low', 1, 'Pending Review', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 51, 74, 67),
(94, 'AETitle43', 'Nisi rerum odit magnam quidem ut praesentium perferendis ut id sapiente commodi illum ut.', '2021-12-20 12:47:40.000000', 'Consectetur neque exercitationem.', 'Exam 44 - CT_SCAN - Madge Witting (58)', NULL, 'High', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 58, 73, 69),
(95, 'AETitle44', 'Omnis sit soluta aut excepturi sunt magnam ducimus voluptates officiis voluptas.', '2022-03-24 07:21:15.000000', 'Necessitatibus ipsum a aliquid nesciunt.', 'Exam 45 - ULTRASOUND - Lavern Friesen (55)', NULL, 'Normal', 1, 'Interpreted', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 55, 74, 67),
(96, 'AETitle45', 'Similique inventore natus perspiciatis sit sed eveniet ratione aut nisi.', '2022-02-27 14:44:46.000000', 'Labore debitis amet.', 'Exam 46 - MAMMOGRAPHY - Luigi Herman (61)', NULL, 'Normal', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 61, 75, 70),
(97, 'AETitle46', 'Perferendis minima sed voluptatem dolorum amet et assumenda atque sunt.', '2022-10-19 15:02:42.000000', 'Asperiores sed saepe voluptatum saepe quia rem maiores.', 'Exam 47 - MAMMOGRAPHY - Dave Dickens (47)', NULL, 'High', 1, 'In Progress', 'MAMMOGRAPHY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 47, 75, 70),
(98, 'AETitle47', 'Blanditiis molestias dignissimos magni totam delectus aut cupiditate asperiores corporis dolor qui delectus magni.', '2022-07-24 04:39:47.000000', 'Magni nam ducimus quia non et.', 'Exam 48 - XRAY - Drew Frami (48)', NULL, 'High', 1, 'In Progress', 'XRAY', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 48, 73, 67),
(99, 'AETitle48', 'Ipsa repudiandae delectus est qui ullam et laboriosam corrupti eum velit eum aliquid ea qui.', '2022-06-20 16:11:35.000000', 'Voluptates velit placeat omnis.', 'Exam 49 - ULTRASOUND - Drew Frami (48)', NULL, 'Normal', 1, 'Pending Interpretation', 'ULTRASOUND', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 48, 75, 67),
(100, 'AETitle49', 'Cum ut sapiente blanditiis itaque ullam nulla dignissimos odio et.', '2022-11-02 12:05:32.000000', 'Quam dolore odit vitae illo natus tenetur.', 'Exam 50 - CT_SCAN - Drew Frami (48)', NULL, 'High', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', 48, 75, 70),
(101, 'AETitle0', 'Enim vero asperiores eum in error libero accusamus eum dolorem a voluptatum.', '2022-08-21 06:53:53.000000', 'Dolorem ut eum iure incidunt consequatur.', 'Exam 1 - XRAY - Pierre Raynor (84)', NULL, 'Low', 1, 'Pending Interpretation', 'XRAY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 84, 109, 105),
(102, 'AETitle1', 'Culpa quia et illum debitis aliquam in ut sint ipsam numquam maiores atque aut.', '2022-05-06 12:45:11.000000', 'Voluptate quos ut est beatae.', 'Exam 2 - MAMMOGRAPHY - Lakesha Wiza (85)', NULL, 'High', 1, 'In Progress', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 85, 107, 105),
(103, 'AETitle2', 'Totam voluptas architecto aut ratione facilis quia placeat vero et non.', '2022-10-02 06:41:14.000000', 'Harum minus magni quo sed tenetur non.', 'Exam 3 - CT_SCAN - Emmaline Fadel (97)', NULL, 'High', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 97, 107, 102),
(104, 'AETitle3', 'Natus ipsam voluptate facere fuga consequatur nisi quasi autem facere doloremque.', '2022-12-08 02:38:27.000000', 'Qui a in porro vero voluptatibus.', 'Exam 4 - MRI - Shirley Morissette (87)', NULL, 'Normal', 0, 'Archived', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 87, 107, 104),
(105, 'AETitle4', 'Ab nesciunt error quia temporibus dolorum sunt sequi velit est aut expedita.', '2022-09-10 07:20:35.000000', 'Libero molestias pariatur.', 'Exam 5 - MAMMOGRAPHY - Kristle Hilpert (96)', NULL, 'Normal', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 96, 110, 104),
(106, 'AETitle5', 'Reiciendis veniam minima sunt dolor vitae nesciunt quaerat qui occaecati recusandae temporibus commodi minus quidem.', '2022-03-23 06:39:03.000000', 'Eos vitae excepturi atque in et.', 'Exam 6 - MRI - Leo Okuneva (92)', NULL, 'Low', 1, 'Pending Interpretation', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 92, 109, 103),
(107, 'AETitle6', 'Saepe fugiat illum earum voluptatibus porro sint distinctio ut eos sapiente dolores enim consequatur earum.', '2022-09-26 08:41:19.000000', 'Et omnis dignissimos assumenda et provident praesentium.', 'Exam 7 - MRI - Emmaline Fadel (97)', NULL, 'High', 1, 'Pending Interpretation', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 97, 109, 102),
(108, 'AETitle7', 'Omnis sunt temporibus impedit est est autem veniam impedit ipsa.', '2022-08-31 21:08:09.000000', 'Facere deserunt distinctio dolor rem maxime eos soluta.', 'Exam 8 - XRAY - Shirley Morissette (87)', NULL, 'Normal', 1, 'Report Sent', 'XRAY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 87, 107, 105),
(109, 'AETitle8', 'Praesentium molestiae qui occaecati voluptatem in doloremque qui quaerat autem.', '2022-11-13 19:58:00.000000', 'Aut ipsa molestiae.', 'Exam 9 - PET_SCAN - Emmaline Fadel (97)', NULL, 'Normal', 1, 'Interpreted', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 97, 108, 104),
(110, 'AETitle9', 'Non dignissimos veritatis nisi labore sunt dolores voluptatem ex aut tenetur odit doloribus recusandae quis.', '2022-07-22 17:23:03.000000', 'Labore aut quod aliquam.', 'Exam 10 - PET_SCAN - Audrea West (95)', NULL, 'Low', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 95, 110, 103),
(111, 'AETitle10', 'Blanditiis aut in aspernatur mollitia laboriosam omnis sed aut ea voluptatem omnis sapiente.', '2021-12-28 10:06:01.000000', 'Quo repellendus voluptate voluptatem error aspernatur accusantium.', 'Exam 11 - CT_SCAN - Rosario Conroy (98)', NULL, 'Normal', 1, 'Pending Review', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 98, 110, 105),
(112, 'AETitle11', 'Sapiente suscipit nihil hic quibusdam magni velit omnis repellendus ipsum iste.', '2022-05-23 13:39:16.000000', 'Accusamus et facere minus dolor sunt ipsa.', 'Exam 12 - XRAY - Lakesha Wiza (85)', NULL, 'High', 1, 'Report Sent', 'XRAY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 85, 108, 104),
(113, 'AETitle12', 'Et fuga et aut expedita blanditiis dolore iure quasi atque ad itaque ut modi.', '2022-06-01 19:16:04.000000', 'Quo qui iste.', 'Exam 13 - MAMMOGRAPHY - Clement Howell (83)', NULL, 'High', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 83, 110, 103),
(114, 'AETitle13', 'Pariatur quam aut et temporibus commodi consequatur quis illo ut beatae fugit.', '2022-06-13 08:45:27.000000', 'Dolorem odit et nihil animi aut.', 'Exam 14 - MRI - Shirley Morissette (87)', NULL, 'High', 1, 'In Progress', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 87, 108, 103),
(115, 'AETitle14', 'Est expedita officia ut aut ipsum quia consequuntur nisi quia nihil asperiores omnis ipsa voluptates.', '2022-09-15 01:24:53.000000', 'Debitis labore deserunt et suscipit et.', 'Exam 15 - MAMMOGRAPHY - Jared Labadie (82)', NULL, 'Low', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 82, 110, 105),
(116, 'AETitle15', 'Ullam officiis provident quidem est blanditiis necessitatibus consectetur pariatur suscipit.', '2022-09-04 14:42:45.000000', 'Velit totam illo consectetur ipsum sed.', 'Exam 16 - CT_SCAN - Rosario Conroy (98)', NULL, 'High', 0, 'Archived', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 98, 110, 105),
(117, 'AETitle16', 'Quos asperiores consequatur odit sunt qui consequatur autem ea quasi sit.', '2022-07-13 05:45:25.000000', 'Ex deserunt amet assumenda.', 'Exam 17 - XRAY - Lakesha Wiza (85)', NULL, 'High', 1, 'Report Sent', 'XRAY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 85, 110, 105),
(118, 'AETitle17', 'A tempora pariatur neque enim quisquam ducimus impedit omnis reprehenderit adipisci minus quam eveniet.', '2022-04-25 11:10:36.000000', 'Culpa reiciendis corrupti.', 'Exam 18 - PET_SCAN - Rosario Conroy (98)', NULL, 'High', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 98, 107, 104),
(119, 'AETitle18', 'Aliquid laboriosam adipisci vitae ut nihil quia adipisci dolor rerum doloribus accusamus aut.', '2022-07-25 02:24:46.000000', 'Facilis ut similique impedit eos aliquid tenetur.', 'Exam 19 - MAMMOGRAPHY - Jared Labadie (82)', NULL, 'Normal', 1, 'In Progress', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 82, 110, 105),
(120, 'AETitle19', 'Est quasi voluptatem quod et quibusdam odit totam nostrum delectus dignissimos.', '2022-01-23 13:32:52.000000', 'Qui fuga excepturi odio.', 'Exam 20 - MAMMOGRAPHY - Maire Legros (89)', NULL, 'Low', 1, 'Report Sent', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 89, 108, 102),
(121, 'AETitle20', 'Corporis ab doloribus similique quos fugit cupiditate sed maxime eum dolore consequatur repellat et quae.', '2024-11-13 10:12:18.000000', 'Aspernatur nesciunt repellat.', 'Exam 21 - CT_SCAN - Clement Howell (83)', NULL, 'Low', 0, 'Archived', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 83, 109, 104),
(122, 'AETitle21', 'Debitis id libero quasi nisi molestias aperiam voluptatum ea et consequatur optio perferendis.', '2024-11-13 10:12:18.000000', 'Rerum ducimus dolor.', 'Exam 22 - CT_SCAN - Kristle Hilpert (96)', NULL, 'Normal', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 96, 109, 105),
(123, 'AETitle22', 'Aliquid alias officia accusamus aut quia explicabo dolor ipsum quis qui.', '2024-11-13 10:12:18.000000', 'Animi quas recusandae iure voluptas et.', 'Exam 23 - PET_SCAN - Maire Legros (89)', NULL, 'High', 1, 'In Progress', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 89, 108, 105),
(124, 'AETitle23', 'Voluptatem id unde non est magnam dolor id sit ipsam autem aut nihil vel nam.', '2024-11-13 10:12:18.000000', 'Officiis expedita distinctio.', 'Exam 24 - MRI - Emmaline Fadel (97)', NULL, 'High', 1, 'Interpreted', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 97, 108, 105),
(125, 'AETitle24', 'Est voluptatum laboriosam amet temporibus nemo laborum porro ab nesciunt et et tempora sunt.', '2024-11-13 10:12:18.000000', 'Et odio aut dolor nesciunt.', 'Exam 25 - PET_SCAN - Pete Marks (90)', NULL, 'High', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 90, 108, 104),
(126, 'AETitle25', 'Placeat magnam unde nisi ea neque amet est voluptas qui.', '2024-11-13 10:12:18.000000', 'Est ut neque.', 'Exam 26 - MRI - Jared Labadie (82)', NULL, 'Normal', 0, 'Archived', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 82, 108, 103),
(127, 'AETitle26', 'Qui odit quaerat at officia ea libero molestiae dolores et dolores consequatur tenetur sit maxime.', '2024-11-13 10:12:18.000000', 'Quia repellendus id.', 'Exam 27 - ULTRASOUND - Shirley Morissette (87)', NULL, 'Low', 0, 'Archived', 'ULTRASOUND', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 87, 107, 103),
(128, 'AETitle27', 'Iusto sint quod quia rerum aut quisquam modi quidem dolores.', '2024-11-13 10:12:18.000000', 'Mollitia ut sit dolor at.', 'Exam 28 - MAMMOGRAPHY - Marlana Corwin (94)', NULL, 'Normal', 1, 'Pending Review', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 94, 108, 102),
(129, 'AETitle28', 'Laudantium et aut repudiandae soluta ex magni earum nisi dignissimos velit sed culpa omnis.', '2024-11-13 10:12:18.000000', 'Est qui a praesentium autem voluptatem nam architecto.', 'Exam 29 - PET_SCAN - Pete Marks (90)', NULL, 'Normal', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 90, 108, 105),
(130, 'AETitle29', 'Assumenda exercitationem illo et suscipit laudantium ea ipsum officia eos modi repellendus.', '2024-11-13 10:12:18.000000', 'Repudiandae corporis et blanditiis.', 'Exam 30 - MRI - Shirley Morissette (87)', NULL, 'Normal', 1, 'Pending Review', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 87, 110, 105),
(131, 'AETitle30', 'Quis laudantium minima voluptatem omnis mollitia officia soluta est ipsa possimus.', '2024-11-13 10:12:18.000000', 'Qui consequatur praesentium laboriosam.', 'Exam 31 - CT_SCAN - Isidro Terry (86)', NULL, 'High', 1, 'Pending Review', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 86, 109, 104),
(132, 'AETitle31', 'Id ea voluptatem repellendus sed quaerat tempore voluptatem quia saepe voluptas.', '2022-06-13 02:43:50.000000', 'Necessitatibus fugiat voluptatibus.', 'Exam 32 - MAMMOGRAPHY - Harry Kertzmann (93)', NULL, 'High', 1, 'Interpreted', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 93, 110, 103),
(133, 'AETitle32', 'Hic molestiae unde optio ut aliquid et omnis incidunt nemo illum non quia.', '2022-06-08 00:12:43.000000', 'Sed qui pariatur et sapiente est ut.', 'Exam 33 - PET_SCAN - Britany Tillman (91)', NULL, 'Normal', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 91, 110, 103),
(134, 'AETitle33', 'Odit enim quaerat voluptatum rem dolor aliquam omnis cupiditate doloribus ut assumenda iusto.', '2022-09-03 09:11:41.000000', 'Cumque ex dolores rerum nulla itaque deserunt.', 'Exam 34 - CT_SCAN - Leo Okuneva (92)', NULL, 'Low', 1, 'Interpreted', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 92, 107, 102),
(135, 'AETitle34', 'Porro magni id ipsa quod optio praesentium ad fugiat quo vel quisquam.', '2022-05-28 22:37:01.000000', 'Deleniti et odio atque praesentium consequuntur dolores.', 'Exam 35 - PET_SCAN - Audrea West (95)', NULL, 'Low', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 95, 108, 105),
(136, 'AETitle35', 'Temporibus facere consequatur velit dolore sed natus omnis explicabo voluptas reiciendis quaerat.', '2022-12-10 14:26:51.000000', 'Excepturi unde quo.', 'Exam 36 - CT_SCAN - Maire Legros (89)', NULL, 'High', 0, 'Archived', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 89, 109, 105),
(137, 'AETitle36', 'Minus aut magni sed saepe eos expedita cumque deserunt ab mollitia dolorem non rem.', '2022-06-18 06:47:20.000000', 'Odit asperiores fugiat et ut assumenda earum officiis.', 'Exam 37 - CT_SCAN - Britany Tillman (91)', NULL, 'High', 1, 'In Progress', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 91, 109, 105),
(138, 'AETitle37', 'Eos cupiditate autem nam illum totam esse sit reprehenderit sit dicta libero soluta commodi corrupti.', '2022-02-17 00:13:17.000000', 'Error voluptatum ad illo cum.', 'Exam 38 - PET_SCAN - Harry Kertzmann (93)', NULL, 'High', 1, 'Pending Interpretation', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 93, 109, 103),
(139, 'AETitle38', 'Tempora voluptatem accusantium iusto sed odio fugiat nulla praesentium inventore.', '2022-11-19 04:35:41.000000', 'Voluptatibus ullam itaque voluptatem saepe distinctio fuga.', 'Exam 39 - CT_SCAN - Britany Tillman (91)', NULL, 'Low', 1, 'Pending Interpretation', 'CT_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 91, 109, 105),
(140, 'AETitle39', 'Et dolor et molestiae beatae porro et provident consequatur provident doloribus.', '2022-10-22 14:04:20.000000', 'Porro dolore eligendi vero atque molestiae cum.', 'Exam 40 - PET_SCAN - Kristle Hilpert (96)', NULL, 'Low', 0, 'Archived', 'PET_SCAN', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 96, 110, 105),
(141, 'AETitle40', 'Rerum magnam itaque magni voluptatem quisquam magni cum vero non et qui nesciunt et.', '2022-02-04 03:19:21.000000', 'Similique dolor natus nostrum at quia.', 'Exam 41 - ULTRASOUND - Pete Marks (90)', NULL, 'Low', 1, 'Report Sent', 'ULTRASOUND', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 90, 109, 102),
(142, 'AETitle41', 'Error illo asperiores illum quia officiis aut sapiente beatae fugiat.', '2021-12-29 22:44:20.000000', 'Dolor quia iste voluptates et explicabo enim recusandae.', 'Exam 42 - MRI - Lakesha Wiza (85)', NULL, 'High', 1, 'Report Sent', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 85, 107, 105),
(143, 'AETitle42', 'Quasi omnis tenetur nobis at distinctio ut voluptatem distinctio non minus aperiam consectetur labore consequuntur.', '2022-04-05 08:47:07.000000', 'Ea voluptates aut vel modi iure.', 'Exam 43 - ULTRASOUND - Britany Tillman (91)', NULL, 'Normal', 1, 'Report Sent', 'ULTRASOUND', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 91, 110, 102),
(144, 'AETitle43', 'Exercitationem nesciunt unde impedit alias non voluptates molestiae nulla laborum atque ipsum iusto ut id.', '2022-04-10 08:41:23.000000', 'Officia odio reprehenderit eos fugit soluta id.', 'Exam 44 - MRI - Rosario Conroy (98)', NULL, 'Normal', 0, 'Archived', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 98, 107, 105),
(145, 'AETitle44', 'Labore facilis eius deserunt natus tempore nam mollitia laboriosam eligendi assumenda et ratione.', '2022-02-19 05:43:32.000000', 'Architecto pariatur voluptas quia temporibus accusantium assumenda omnis.', 'Exam 45 - MRI - Shirley Morissette (87)', NULL, 'High', 1, 'In Progress', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 87, 108, 103),
(146, 'AETitle45', 'Officiis et et velit similique nostrum dicta consectetur harum consequuntur earum dicta dolores sed quis.', '2022-11-07 16:45:30.000000', 'Labore quia totam aliquam cum quia quia.', 'Exam 46 - XRAY - Kristle Hilpert (96)', NULL, 'High', 1, 'Pending Review', 'XRAY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 96, 110, 102);
INSERT INTO `study` (`study_ky`, `study_aetitle`, `study_comment`, `study_date`, `study_desc`, `study_label`, `study_note`, `study_priority`, `study_rcrd_sts`, `study_status`, `study_type`, `study_unx_tm_crt`, `study_unx_tm_updt`, `patient_ref`, `prfrmng_physic_ref`, `rfrnt_physic_ref`) VALUES
(147, 'AETitle46', 'Distinctio sint sed non voluptatem corrupti dignissimos optio consequatur impedit repellat blanditiis voluptas accusantium.', '2022-09-16 07:20:22.000000', 'Aut qui illo enim eius.', 'Exam 47 - MAMMOGRAPHY - Harry Kertzmann (93)', NULL, 'Low', 0, 'Archived', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 93, 109, 105),
(148, 'AETitle47', 'Eveniet impedit alias sed autem aliquid eos quo consectetur expedita velit.', '2022-11-18 07:22:14.000000', 'Libero aliquam dolorum.', 'Exam 48 - MAMMOGRAPHY - Pierre Raynor (84)', NULL, 'High', 1, 'In Progress', 'MAMMOGRAPHY', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 84, 109, 102),
(149, 'AETitle48', 'Sed cum ad vero eos assumenda adipisci non similique nulla magnam unde quae iste.', '2022-10-24 20:35:31.000000', 'Ipsa iure vel nostrum.', 'Exam 49 - MRI - Jared Labadie (82)', NULL, 'High', 1, 'Pending Review', 'MRI', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 82, 109, 104),
(150, 'AETitle49', 'Tempora eum atque quo natus ratione fugit quo asperiores a accusamus voluptatem vel.', '2022-03-07 17:18:45.000000', 'Beatae accusamus ipsum placeat eaque quod dolorem aspernatur.', 'Exam 50 - ULTRASOUND - Rosario Conroy (98)', NULL, 'Normal', 1, 'In Progress', 'ULTRASOUND', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', 98, 108, 104);

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE `task` (
  `task_ky` bigint(20) NOT NULL,
  `due_date` varchar(255) NOT NULL,
  `event_details` varchar(255) DEFAULT NULL,
  `is_complete` bit(1) NOT NULL,
  `task_priority` varchar(255) NOT NULL,
  `task_title` varchar(255) NOT NULL,
  `assigned_to_ky` bigint(20) DEFAULT NULL,
  `owner_ky` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `user_ky` bigint(20) NOT NULL,
  `birth_date` datetime(6) NOT NULL,
  `civil_status` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `maiden_name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_image` longtext DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_rcrd_sts` int(11) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_unx_tm_crt` datetime(6) NOT NULL,
  `user_unx_tm_updt` datetime(6) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `date_of_hire` datetime(6) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`dtype`, `user_ky`, `birth_date`, `civil_status`, `first_name`, `gender`, `last_name`, `maiden_name`, `nationality`, `user_id`, `user_image`, `user_name`, `user_password`, `user_rcrd_sts`, `user_role`, `user_unx_tm_crt`, `user_unx_tm_updt`, `signature`, `date_of_hire`, `employee_id`, `qualification`, `specialization`) VALUES
('Staff', 1, '1982-11-07 00:14:40.000000', 'Domestic Partnership', 'Isaias', 'Female', 'Schimmel', 'Aufderhar', 'Chinese', '4782-10-07-0', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'dario.witting@gmail.com', '$2a$10$8SFB7Tbi/HQMXngT9nj88.tqh.VmOSzSHGfKlQN/mfTj58rFxtNKW', 1, 'Physician', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 2, '1994-09-19 22:48:49.000000', 'Married', 'Parker', 'Female', 'Strosin', 'Durgan', 'Chinese', '4794-08-19-1', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'kimberely.franecki@yahoo.com', '$2a$10$WMGV4Apwo0lZH0O3/qscVuv5E.GRVTKqxn6NgoMsCBpwUsEFR3LKS', 1, 'Physician', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 3, '1978-05-09 22:56:10.000000', 'Widowed', 'Shelia', 'Male', 'Kihn', 'Flatley', 'French', '4678-04-09-2', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'ward.spencer@gmail.com', '$2a$10$ieb8Vr25xvPOfnXWUf9VPeUt4f.tpV5Z1e.OVIqYNEf3TM9AdupW.', 1, 'Physician', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 4, '1962-07-17 11:48:20.000000', 'Divorced', 'Rima', 'Male', 'Murazik', 'Bosco', 'American', '4662-06-17-3', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'bruno.heathcote@gmail.com', '$2a$10$KYJhn6qike3yXvzf5h6EvOmsptq4PrblErt7u4Z5s.oZqOuiaeU3u', 1, 'Physician', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 5, '2006-03-29 11:27:19.000000', 'Separated', 'Ellis', 'Female', 'Cremin', 'Willms', 'British', '47106-02-29-4', 'https://www.upgradebox.info/img/business-woman.png', 'jack.ruecker@gmail.com', '$2a$10$q7930Ejq.5QuZ4O35PJax.e6tq8Ja2S6ApIUrK.zP7i5jIayoJnAe', 1, 'Physician', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 6, '2004-01-12 21:40:44.000000', 'Married', 'Raelene', 'Female', 'Weissnat', 'Pfannerstill', 'French', '2-04-00-12-0', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'dante.toy@hotmail.com', '$2a$10$riXQ4BdG3QXS.eeRPdU4s.5iUHtUq3JhbAd53ihuBu.LaCAdR1bkS', 1, 'Patient', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 7, '1961-07-05 15:57:05.000000', 'Single', 'Darren', 'Female', 'Predovic', 'Wiegand', 'Canadian', '2-61-06-05-1', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'jeneva.walker@gmail.com', '$2a$10$GFUj0lc.QBkbKphYmcYHt.6UF9JWcRqXt13vQcOfFjgIcwGemrrOm', 1, 'Patient', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 8, '1982-11-19 04:55:19.000000', 'Widowed', 'Clair', 'Male', 'Hagenes', 'Bins', 'German', '1-82-10-19-2', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'raymond.cassin@gmail.com', '$2a$10$A/kydSi6EK.Ga/AA/MT3j.JHjKxxqjIEvauCdn/NBy7hB.PH1D3Cy', 1, 'Patient', '2024-11-10 12:21:43.000000', '2024-11-10 12:21:43.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 9, '1961-02-21 10:42:41.000000', 'Domestic Partnership', 'Alina', 'Female', 'Ledner', 'Purdy', 'Chinese', '2-61-01-21-3', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'antonio.barton@yahoo.com', '$2a$10$e0C8hU7XqIfgIZkjmpZbnuDWU2kL56qAwg.zs6n9pZsf1xFSBZkKq', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 10, '1991-12-14 22:52:01.000000', 'Married', 'Willy', 'Male', 'Koepp', 'Kassulke', 'Japanese', '1-91-11-14-4', 'https://w7.pngwing.com/pngs/902/963/png-transparent-business-automobile-salesperson-human-resource-management-xing-business-blue-human-resource-management-people-thumbnail.png', 'stefanie.ward@gmail.com', '$2a$10$j86ZS8v4E61jG9DwIjriuurGtaWduxBU82N06P/RTpraeCrNY9JJK', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 11, '1974-10-14 09:51:49.000000', 'Domestic Partnership', 'Rena', 'Female', 'Bode', 'Lang', 'British', '2-74-09-14-5', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'colby.johnson@gmail.com', '$2a$10$1fxS.Co7OURjMbBukAjEkOc4T8vpSV1IHe5s9QN1Ez2JLxRhtPe0m', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 12, '1999-08-14 09:08:26.000000', 'Married', 'Ronny', 'Male', 'Rempel', 'Grimes', 'American', '1-99-07-14-6', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'neoma.okuneva@hotmail.com', '$2a$10$RW9pMCWUPvTFJts4YvWHAeijBsSMcSFqx.EUvfDuRjy1ANWIbSowK', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 13, '1984-07-27 11:30:06.000000', 'Separated', 'Jonas', 'Male', 'Swift', 'Bradtke', 'Chinese', '1-84-06-27-7', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'mac.bailey@yahoo.com', '$2a$10$XoiXDXbQpLCBg3wgL6nSfu4HprRFLxjA0UyHmo5NUuzOwQJ3d/XCC', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 14, '1972-11-24 15:52:15.000000', 'Separated', 'Clorinda', 'Female', 'Beatty', 'Schneider', 'French', '2-72-10-24-8', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'dayna.macejkovic@gmail.com', '$2a$10$tckLfKFBSGUF6mz8LCAGt.rNYidZtSIIkw3ZluMQMCvoAKBCCVcvG', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 15, '1985-10-26 13:03:23.000000', 'Married', 'Ricarda', 'Male', 'Morar', 'Schumm', 'Canadian', '1-85-09-26-9', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'blair.treutel@hotmail.com', '$2a$10$WvLUb2MrhbfPrnYTP8/GOudcTGtO54sbi1x.nSXvAJ1slFUO/eMzC', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 16, '1977-09-08 08:45:49.000000', 'Married', 'Hortense', 'Female', 'Jakubowski', 'McKenzie', 'Chinese', '2-77-08-08-10', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'marth.witting@yahoo.com', '$2a$10$0CwA0F4tqihb8tuHuy4AeOAkzCK4ib4bTg/xWVx2L8OW6Mm4uhNCi', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 17, '1970-10-28 16:37:26.000000', 'Divorced', 'Katelyn', 'Male', 'Collier', 'Heaney', 'Italian', '1-70-09-28-11', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'emil.graham@yahoo.com', '$2a$10$DmdvXjwQzM7EqjHbdXyLB.2ulbc0omfpVD8zAr7dvj2daJJ6qiUOm', 1, 'Patient', '2024-11-10 12:21:44.000000', '2024-11-10 12:21:44.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 18, '1992-10-11 19:41:07.000000', 'Married', 'Mikki', 'Female', 'Berge', 'Becker', 'American', '2-92-09-11-12', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'felton.sporer@yahoo.com', '$2a$10$T0gHBZ0mwK.8eJ4Ir5ZzDuQRCmtzRiJqk3n9FFCGlmA2XBAiIpOk2', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 19, '1975-07-26 14:57:16.000000', 'Widowed', 'Lanny', 'Male', 'Harvey', 'Kozey', 'American', '1-75-06-26-13', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'benedict.spencer@gmail.com', '$2a$10$mgh08fhqjW0YtUZ7esVpHuEeGOz3/Fm.pwsVGprNAdsniM44NxFDK', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 20, '1965-07-28 00:24:46.000000', 'Domestic Partnership', 'Stormy', 'Male', 'Herman', 'Langworth', 'French', '1-65-06-28-14', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'stefany.medhurst@gmail.com', '$2a$10$kpNEAiiVFup7naKyna67/eRF0CcUlEY5g24ubVpen67/YgHPfP/nS', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 21, '1996-01-11 20:28:25.000000', 'Widowed', 'Jovan', 'Female', 'Bailey', 'Greenfelder', 'German', '2-96-00-11-15', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'bryce.watsica@yahoo.com', '$2a$10$TRKabzik4QVpIMA/OWvgFOE8jP5ZsY4QQQhz3DC3iFFK7Hbw0.nfW', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 22, '1970-04-22 03:26:28.000000', 'Divorced', 'Dagny', 'Male', 'Abernathy', 'Kemmer', 'British', '1-70-03-22-16', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'dillon.klein@hotmail.com', '$2a$10$PqKuRaJ9TRPdfVLW52itBe4CR8Yw7DKKeEhie4P/SrSwlp.BzfecG', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 23, '2002-12-22 05:41:30.000000', 'Married', 'Cody', 'Female', 'Leffler', 'Kassulke', 'French', '2-02-11-22-17', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'sheron.swaniawski@yahoo.com', '$2a$10$3R/lFPkwreVU8EdczGZlCOrvcNfXk/kesfk4IIsvhu7YdLCv7xcSi', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 24, '1983-10-04 06:24:24.000000', 'Widowed', 'Lashon', 'Female', 'Kulas', 'Hessel', 'Canadian', '2-83-09-04-18', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'irena.ward@hotmail.com', '$2a$10$ypJ/dqN.ZMf7hlIC8/Kuy.H2Eva9N4ckqZWOswoPQFVGQVCgl91TS', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 25, '1960-05-12 03:45:06.000000', 'Annulled', 'Aubrey', 'Male', 'Pagac', 'Stracke', 'Chinese', '1-60-04-12-19', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'anton.hilpert@yahoo.com', '$2a$10$4cYVOA3OoIc.6ItgytIddOTlDpYNhlBVSRFyiTjt4V7yJvboQXFte', 1, 'Patient', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', NULL, NULL, NULL, NULL, NULL),
('RfrntPhysic', 26, '1993-10-17 13:35:49.000000', 'Divorced', 'Bobbie', 'Female', 'Dickinson', 'Nikolaus', 'British', '2-93-09-17-0', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'devon.green@hotmail.com', '$2a$10$ED/Fo6kAl4aHbDHAbiuK9uPytD4Hu.MKPg8iwiBF.Jy6HYNmnRpX.', 1, 'Radiologist', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', 'https://www.freepnglogos.com/uploads/signature-png/signature-mohammad-png-19.png', '1977-07-21 09:13:49.000000', 'EMP-RAD0', 'Doctor of Osteopathic Medicine (D.O.)', 'Emergency'),
('RfrntPhysic', 27, '1999-12-29 14:49:24.000000', 'Divorced', 'Stephane', 'Female', 'Kirlin', 'Nikolaus', 'German', '2-99-11-29-1', 'https://www.upgradebox.info/img/business-woman.png', 'josette.emard@hotmail.com', '$2a$10$ImyxbDqEiSu391C.e0fzvuDeG7Trcu1dFvsl7eSbfqVV9bTHKVDWW', 1, 'Radiologist', '2024-11-10 12:21:45.000000', '2024-11-10 12:21:45.000000', 'https://2.bp.blogspot.com/-eh9Y_rw1oxs/WHvBWrFQeGI/AAAAAAAAAI4/ozizwcWAzakKIg1i6bbbXF8GRQiVODAMwCLcB/s1600/Screenshot_59.png', '1997-10-01 01:47:44.000000', 'EMP-RAD1', 'Doctor of Osteopathic Medicine (D.O.)', 'Genitourinary'),
('RfrntPhysic', 28, '2004-03-09 10:29:41.000000', 'Separated', 'Arnulfo', 'Female', 'Hyatt', 'Bruen', 'Chinese', '2-04-02-09-2', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'laurence.sporer@gmail.com', '$2a$10$MsSWIRjL1Tfm2OFm/DV7MO.a5soCa5kPyh62xMynRfkgEDwkQ6dDC', 1, 'Radiologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 'https://th.bing.com/th/id/OIP.PxLLLFR_tGzPnZ9ChYEVqwAAAA?pid=ImgDet&rs=1', '2004-01-09 16:51:49.000000', 'EMP-RAD2', 'Continuing Medical Education (CME)', 'Interventional'),
('RfrntPhysic', 29, '2005-07-05 23:26:29.000000', 'Married', 'Lavern', 'Female', 'Langosh', 'Friesen', 'German', '2-05-06-05-3', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'alona.gusikowski@hotmail.com', '$2a$10$RDIYJqJLRXRAIsOcU.J2nuWxy1hzkUfxX4nH3Q3NTmTFqkH5Jcrhi', 1, 'Radiologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 'https://th.bing.com/th/id/OIP.LFMIOeZxCqIrIYYkbv9LEQHaHA?pid=ImgDet&rs=1', '1996-03-12 01:15:09.000000', 'EMP-RAD3', 'Fellowship in Neuroradiology', 'Cardiovascular'),
('RfrntPhysic', 30, '1962-02-08 07:37:06.000000', 'Divorced', 'Migdalia', 'Female', 'Murray', 'Kerluke', 'Spanish', '2-62-01-08-4', 'https://www.upgradebox.info/img/business-woman.png', 'chadwick.stanton@gmail.com', '$2a$10$gg8EDYvijEOUW18ZKiziUu9nJQKhu1ZODjlciN/DDGxzMFtNa9CcW', 1, 'Radiologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', 'https://editorial-adarve.com/wp-content/uploads/2020/05/firma-1024x733.jpg', '2002-01-25 12:41:30.000000', 'EMP-RAD4', 'Doctor of Medicine (M.D.)', 'Genitourinary'),
('PrfrmngPhysic', 31, '1960-03-19 10:41:56.000000', 'Separated', 'Ned', 'Female', 'Lockman', 'King', 'Chinese', '2-60-02-19-0', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'giovanna.doyle@hotmail.com', '$2a$10$hU4i7lIUgk.694XJ1/3YWOfDxpGdeUmXuBmPgIWaaC30h34zluxmK', 1, 'Technologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', NULL, '2004-07-11 07:30:10.000000', 'EMP-RAD-TECH0', 'Certified Radiologic Technologist (CRT)', 'X-ray Technologist'),
('PrfrmngPhysic', 32, '1977-12-16 13:40:43.000000', 'Single', 'Luba', 'Female', 'Bergstrom', 'Rosenbaum', 'British', '2-77-11-16-1', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'alfredo.macgyver@yahoo.com', '$2a$10$0vjdMc6XchxDR5nk4YXuOuB6hwMOhjH/ZQbZ86n6kgvlkGVaNNGAu', 1, 'Technologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', NULL, '1975-06-28 09:34:14.000000', 'EMP-RAD-TECH1', 'Certified Radiologic Technologist (CRT)', 'MRI Technologist'),
('PrfrmngPhysic', 33, '1994-10-17 06:10:44.000000', 'Divorced', 'Teodoro', 'Female', 'D\'Amore', 'Kiehn', 'American', '2-94-09-17-2', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'quinn.wisozk@gmail.com', '$2a$10$PHZln2kPmRC48lLNe5OaNOoSQ9JtAlTAl2rAjy2T2N0u6kgeaifbq', 1, 'Technologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', NULL, '1989-02-01 08:32:53.000000', 'EMP-RAD-TECH2', 'Associate\'s Degree in Radiologic Technology', 'X-ray Technologist'),
('PrfrmngPhysic', 34, '1993-08-17 05:59:42.000000', 'Separated', 'Hilary', 'Male', 'Armstrong', 'Jakubowski', 'Italian', '1-93-07-17-3', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'samual.howe@hotmail.com', '$2a$10$.lMGqp7a9Ww/vHkWasm5I.H/uI12qtuTmODjcJRtyP0hlYo0F/BHq', 1, 'Technologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', NULL, '1996-10-14 13:36:05.000000', 'EMP-RAD-TECH3', 'Associate\'s Degree in Radiologic Technology', 'MRI Technologist'),
('PrfrmngPhysic', 35, '1996-06-23 22:12:27.000000', 'Married', 'Celine', 'Female', 'Ritchie', 'Greenfelder', 'German', '2-96-05-23-4', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'myron.blanda@hotmail.com', '$2a$10$x5RABuTq3Fxy6dD3./NPZOW9SdCr8Jmx4fxmPfkNONx4XY8bp7Miq', 1, 'Technologist', '2024-11-10 12:21:46.000000', '2024-11-10 12:21:46.000000', NULL, '1972-08-14 20:19:28.000000', 'EMP-RAD-TECH4', 'Certified Radiologic Technologist (CRT)', 'X-ray Technologist'),
('Secretary', 36, '1993-11-15 15:29:25.000000', 'Divorced', 'Nestor', 'Female', 'Wiza', 'Klein', 'German', '2-93-10-15-0', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'delois.rath@yahoo.com', '$2a$10$Vk18mpzqAXmEx3rPeWZYAOLoPhgkj/jSg2t8UmbqIE0yQZMTdvsx2', 1, 'Secretary', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, NULL, NULL, NULL, NULL),
('Secretary', 37, '1977-02-28 16:37:45.000000', 'Separated', 'Joette', 'Female', 'Hilll', 'Ryan', 'French', '2-77-01-28-1', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'mee.morar@hotmail.com', '$2a$10$Xdc.aA1.1oZRKjMof7UXpuGjbRoAyEPYkFoPa.4WTurdbqZD82AeC', 1, 'Secretary', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, NULL, NULL, NULL, NULL),
('Secretary', 38, '2005-01-19 08:48:09.000000', 'Widowed', 'Huey', 'Female', 'Gutmann', 'Hudson', 'Chinese', '2-05-00-19-2', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'sylvester.rath@yahoo.com', '$2a$10$e.oqFK7s/.w3i7wyLrXVPOr7.BmeFzc95yICa166eH2mShVIFuAj6', 1, 'Secretary', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, NULL, NULL, NULL, NULL),
('Secretary', 39, '1992-08-07 20:29:58.000000', 'Separated', 'Jude', 'Female', 'Crona', 'Hagenes', 'British', '2-92-07-07-3', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'lianne.walter@gmail.com', '$2a$10$E/mmQzsmcuaU0CFvRDKMS.lvWMWWljT8KlrzT8n/sncAmfWZ4WdwC', 1, 'Secretary', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, NULL, NULL, NULL, NULL),
('Secretary', 40, '1974-05-17 17:53:29.000000', 'Widowed', 'Anya', 'Male', 'West', 'Franecki', 'British', '1-74-04-17-4', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'wilfred.greenholt@gmail.com', '$2a$10$1.uxNWNCB3eAzOXvmatymO1pCeo5nyn8P3l2ywKK8yOkQTlZRQ5xe', 1, 'Secretary', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, NULL, NULL, NULL, NULL),
('Administrator', 41, '1997-03-04 16:48:11.000000', 'Domestic Partnership', 'Jasmine', 'Female', 'Wiegand', 'Jacobi', 'American', '2-97-02-04-1', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'brett.hudson@hotmail.com', '$2a$10$9iZpgFZx/rc79x/MgApgyezjC9zjD4U3wkBGQwzTmpn1rWD5267Z6', 1, 'Admin', '2024-11-10 12:21:47.000000', '2024-11-10 12:21:47.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 42, '1974-06-24 19:11:30.000000', 'Separated', 'Brittani', 'Female', 'Yundt', 'Skiles', 'Italian', '4774-05-24-0', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'mabel.miller@yahoo.com', '$2a$10$6u8Dh5ZSpVvyU2IH3xszz.8uUQBu44V7bedxVIJanrckFCvnF0EB2', 1, 'Physician', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 43, '1988-02-22 03:31:52.000000', 'Divorced', 'Lorenzo', 'Male', 'Smith', 'Gerlach', 'British', '4688-01-22-1', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'dannie.tillman@yahoo.com', '$2a$10$PN6YDzZu3DAIY01Pn6ztuuNMcmKbcIWxVpbPjwDZxmJoInUZzuAUi', 1, 'Physician', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 44, '1960-04-17 20:43:34.000000', 'Widowed', 'Lonnie', 'Female', 'Stracke', 'Wiegand', 'German', '4760-03-17-2', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'daron.smitham@hotmail.com', '$2a$10$iUDIF1EKxx8d.hYTdDuu4ORQXsSwe0CxtSUTN.xvTQlJjLuoj/9EC', 1, 'Physician', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 45, '1964-04-29 23:11:57.000000', 'Divorced', 'Wes', 'Female', 'Steuber', 'Reynolds', 'British', '4764-03-29-3', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'brigitte.osinski@gmail.com', '$2a$10$bBn4.OPUWFNIdGnrKm5NSeAKmi.UudpqIn929x1JyqG3FilVnXhw6', 1, 'Physician', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 46, '1986-08-07 05:13:20.000000', 'Separated', 'Christopher', 'Female', 'West', 'Kutch', 'German', '4786-07-07-4', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'bridgett.schmidt@hotmail.com', '$2a$10$U0Jm1ksJfpJiSVwvebLAGuGuFqLYy3WwgaOyHLIgpTfjHvsZdqvaa', 1, 'Physician', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 47, '1975-01-02 02:08:17.000000', 'Domestic Partnership', 'Dave', 'Female', 'Dickens', 'Hauck', 'Japanese', '2-75-00-02-0', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'galen.wisozk@gmail.com', '$2a$10$ISGC8Hsc/lOz7bHjoiPIwONKt8hG.yX7Q9LIp/opdoDpJFJFrRatq', 1, 'Patient', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 48, '1997-02-20 07:13:35.000000', 'Married', 'Drew', 'Male', 'Frami', 'Hills', 'Japanese', '1-97-01-20-1', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'archie.waelchi@hotmail.com', '$2a$10$JU/2lwKrS2rw3Wshz9dzRuKT5/rrtwGRp8bTzjnpBKoA1SQSJpoLa', 1, 'Patient', '2024-11-11 12:34:53.000000', '2024-11-11 12:34:53.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 49, '2005-06-27 17:19:32.000000', 'Divorced', 'Renay', 'Female', 'Labadie', 'Connelly', 'Chinese', '2-05-05-27-2', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'cherlyn.denesik@yahoo.com', '$2a$10$y2UlUmM9CMIrBTZyYgzKT.YA9IrI7KKQ/ZYQ6AgXT4wq0lLngnPeG', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 50, '1964-07-15 07:23:00.000000', 'Married', 'Damaris', 'Female', 'Schowalter', 'Toy', 'Italian', '2-64-06-15-3', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'kenneth.west@yahoo.com', '$2a$10$q76MuKlBUIjzIkO85Hf4Z.QFnf2P0jzSNoKPn3gyA8pVppxtjqcna', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 51, '1961-10-27 19:10:35.000000', 'Divorced', 'Cyndy', 'Male', 'Hettinger', 'Jacobs', 'Spanish', '1-61-09-27-4', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'lizbeth.ryan@yahoo.com', '$2a$10$ga4SEnmt4vMRgOLlO35B7u5E/YMo1zB/9CDTfGlhmFr2wVrwM9Wou', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 52, '1972-08-30 14:14:40.000000', 'Domestic Partnership', 'Bert', 'Female', 'Swaniawski', 'Keebler', 'Japanese', '2-72-07-30-5', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'elvera.runolfsdottir@hotmail.com', '$2a$10$qoQ7VDNtBlgQR6Sc5tt/GeaPbsLfLWRrzPA9AIBy62sklTAFaUf2S', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 53, '2000-09-08 00:12:38.000000', 'Domestic Partnership', 'Margarito', 'Female', 'Rippin', 'Durgan', 'Chinese', '2-00-08-08-6', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'mack.mante@gmail.com', '$2a$10$B4BJRfO62t6hZV5WcInqde48SbEh6Uc8o.GfXVOJsH29S6hM7J.0i', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 54, '2003-06-02 05:52:47.000000', 'Domestic Partnership', 'Nelle', 'Female', 'Bechtelar', 'Grady', 'Japanese', '2-03-05-02-7', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'cortez.klein@yahoo.com', '$2a$10$ineXNFztDp55gZ1fW6YwMeUFx/LXXiFZXN.JkXOpnm2l7UlIGi4.K', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 55, '1982-03-13 05:12:05.000000', 'Divorced', 'Lavern', 'Female', 'Friesen', 'Boyle', 'American', '2-82-02-13-8', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'minh.kutch@yahoo.com', '$2a$10$eX6VIIslKRce5d4YFam/N.Udb1URyGr4HHH5cNyHjzudYP99xARDa', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 56, '1985-12-01 18:54:14.000000', 'Widowed', 'Bennie', 'Male', 'Paucek', 'Glover', 'German', '1-85-11-01-9', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'mabel.mcglynn@yahoo.com', '$2a$10$yapR7MslZ5dDwryl9aGU.e1M4CvhTC897v6t7qWkVks8WF9wi.MnS', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 57, '1972-02-18 11:10:31.000000', 'Widowed', 'John', 'Female', 'Haag', 'Stroman', 'Spanish', '2-72-01-18-10', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'basilia.thompson@gmail.com', '$2a$10$0Pmdka5CEc9EFAlinilfW.lAf6CdlIvmz.8bFESXWau5aO/bESVTC', 1, 'Patient', '2024-11-11 12:34:54.000000', '2024-11-11 12:34:54.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 58, '1987-04-19 10:47:57.000000', 'Separated', 'Madge', 'Female', 'Witting', 'Legros', 'Spanish', '2-87-03-19-11', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'luetta.koepp@gmail.com', '$2a$10$8Uyd1kYvhBX1yyZciAwxBuWykkLRTMv7/bb4LP//AWNN3gMFqYm7K', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 59, '1991-11-14 11:41:03.000000', 'Domestic Partnership', 'Irwin', 'Female', 'Kertzmann', 'Roob', 'French', '2-91-10-14-12', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'daren.stark@gmail.com', '$2a$10$IRQBNG0kAtSKfO9ZmZ8YU.I7Zw9YorGIAweFZStVK7hO73RRJ8c8e', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 60, '2001-05-16 06:14:21.000000', 'Separated', 'Delbert', 'Male', 'Feil', 'Dicki', 'Chinese', '1-01-04-16-13', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'shelton.gorczany@gmail.com', '$2a$10$J0IgSItA6OqgF5gP7fS/4OeDpaDlSd4yifmRFx.rzqZsH8NMGD8K.', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 61, '1967-10-09 17:43:13.000000', 'Domestic Partnership', 'Luigi', 'Female', 'Herman', 'Jerde', 'British', '2-67-09-09-14', 'https://www.upgradebox.info/img/business-woman.png', 'phuong.carroll@gmail.com', '$2a$10$Zs3Ifz154GEh67MiauL2JOwbp5TJrTYUd8RDYpU7iaqGKNtjhJcFa', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 62, '1967-10-10 22:17:53.000000', 'Married', 'Yi', 'Male', 'Kuhn', 'Nolan', 'Italian', '1-67-09-10-15', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'lesli.bruen@gmail.com', '$2a$10$BOFMV66ktUih3hm4AEkPr.tz6QI5EOGrBJ0umbLvBOswGjLMZSP96', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 63, '2005-06-29 17:48:08.000000', 'Widowed', 'Terrell', 'Female', 'Kerluke', 'Lang', 'German', '2-05-05-29-16', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'cruz.corkery@gmail.com', '$2a$10$3u7E16j2nZKPzs2xvorbteuIhZ2K4jxqmdIUHjh5qnzIsygmlpgFO', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 64, '1969-12-25 07:46:36.000000', 'Widowed', 'Jude', 'Male', 'Walter', 'Ziemann', 'Spanish', '1-69-11-25-17', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'steve.little@hotmail.com', '$2a$10$i6/rZVIavLq7cpqg/eUFReRSx4VbjMEm2Y8YSR3vHc/xI0.mvMu3a', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 65, '1993-06-12 16:43:06.000000', 'Domestic Partnership', 'Myron', 'Male', 'Nitzsche', 'Ernser', 'American', '1-93-05-12-18', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'shenika.huel@hotmail.com', '$2a$10$jMf3rRApwOHNQEv.y9qc/OhwNYAEI8.xkpYj.NKXpsZwx5/FCiywy', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 66, '1995-01-02 11:09:27.000000', 'Married', 'Darren', 'Male', 'Morissette', 'Gusikowski', 'Chinese', '1-95-00-02-19', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'delena.kihn@yahoo.com', '$2a$10$ApMa5EFJM9zodOTzC2FyCe56nb/8Ek02MDlnGCoGm3nd9gmq4cRga', 1, 'Patient', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', NULL, NULL, NULL, NULL, NULL),
('RfrntPhysic', 67, '1971-04-18 21:36:01.000000', 'Domestic Partnership', 'Carlos', 'Male', 'Reinger', 'Marvin', 'German', '1-71-03-18-0', 'https://w7.pngwing.com/pngs/902/963/png-transparent-business-automobile-salesperson-human-resource-management-xing-business-blue-human-resource-management-people-thumbnail.png', 'kraig.funk@gmail.com', '$2a$10$mJ9YzcT1.Kb4B15ggcXBg.YiLJfh6ug0kpi6x4ThMB7HVCSyeDKCO', 1, 'Radiologist', '2024-11-11 12:34:55.000000', '2024-11-11 12:34:55.000000', 'https://www.freepnglogos.com/uploads/signature-png/signature-mohammad-png-19.png', '2002-05-08 07:26:05.000000', 'EMP-RAD0', 'Fellowship in Pediatric Radiology', 'Body Imaging'),
('RfrntPhysic', 68, '1976-04-24 10:43:22.000000', 'Domestic Partnership', 'Babette', 'Female', 'Powlowski', 'Boehm', 'Canadian', '2-76-03-24-1', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'eduardo.glover@yahoo.com', '$2a$10$kV07B5hV7orrBc7kHqH/HuYyOCdbSxnpvqdFmSE9NexqcVQLlyAtq', 1, 'Radiologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', 'https://2.bp.blogspot.com/-eh9Y_rw1oxs/WHvBWrFQeGI/AAAAAAAAAI4/ozizwcWAzakKIg1i6bbbXF8GRQiVODAMwCLcB/s1600/Screenshot_59.png', '1979-12-09 11:41:23.000000', 'EMP-RAD1', 'Fellowship in Musculoskeletal Radiology', 'Abdominal'),
('RfrntPhysic', 69, '2004-09-20 22:00:04.000000', 'Married', 'Yelena', 'Male', 'Bernhard', 'Purdy', 'Chinese', '1-04-08-20-2', 'https://w7.pngwing.com/pngs/902/963/png-transparent-business-automobile-salesperson-human-resource-management-xing-business-blue-human-resource-management-people-thumbnail.png', 'bryant.kirlin@hotmail.com', '$2a$10$Pg7czrMvM6NK6rSpXOXJEurq8Gdc/XI7AUN0C.PDKRgTgDMGXUdn2', 1, 'Radiologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', 'https://th.bing.com/th/id/OIP.PxLLLFR_tGzPnZ9ChYEVqwAAAA?pid=ImgDet&rs=1', '1974-02-19 08:58:10.000000', 'EMP-RAD2', 'Board Certified in Radiology', 'Interventional'),
('RfrntPhysic', 70, '2003-06-11 22:11:15.000000', 'Single', 'Ellena', 'Female', 'Wilderman', 'Connelly', 'French', '2-03-05-11-3', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'clemente.wisozk@hotmail.com', '$2a$10$dHx1KT/4dAVFjWm5sNMgsuyrSFLpxNo9EduQrRCaw8uk.25UrqEMa', 1, 'Radiologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', 'https://th.bing.com/th/id/OIP.LFMIOeZxCqIrIYYkbv9LEQHaHA?pid=ImgDet&rs=1', '1986-03-31 15:19:21.000000', 'EMP-RAD3', 'Fellowship in Nuclear Medicine', 'Interventional'),
('RfrntPhysic', 71, '2006-10-18 13:43:42.000000', 'Widowed', 'Stephani', 'Female', 'McGlynn', 'Quigley', 'German', '2-06-09-18-4', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'latrice.watsica@gmail.com', '$2a$10$5kWJtgXIXbHMNFV7nChExePvuagJLS5Max.4pgre9GqzjRuSahCDa', 1, 'Radiologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', 'https://editorial-adarve.com/wp-content/uploads/2020/05/firma-1024x733.jpg', '1973-06-13 09:59:33.000000', 'EMP-RAD4', 'Continuing Medical Education (CME)', 'Musculoskeletal'),
('PrfrmngPhysic', 72, '1980-02-09 17:08:53.000000', 'Divorced', 'Elmira', 'Male', 'Sauer', 'Gislason', 'German', '1-80-01-09-0', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'don.bergstrom@hotmail.com', '$2a$10$b06sh6ITSLeyGC0Ya5szd.ig9OPJxXkbzrThqBQ11PZPPpkvVjXtK', 1, 'Technologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', NULL, '1986-11-26 07:37:54.000000', 'EMP-RAD-TECH0', 'Associate\'s Degree in Radiologic Technology', 'MRI Technologist'),
('PrfrmngPhysic', 73, '1987-05-06 12:24:26.000000', 'Separated', 'Shoshana', 'Female', 'Kuhlman', 'Kuvalis', 'Spanish', '2-87-04-06-1', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'deb.okeefe@yahoo.com', '$2a$10$TxTda0qKo7zb44HSI.agiOlktGxii7Gz8QuXb7y1dhv7CqMcT6w0q', 1, 'Technologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', NULL, '2001-01-24 07:12:32.000000', 'EMP-RAD-TECH1', 'Certified Radiologic Technologist (CRT)', 'MRI Technologist'),
('PrfrmngPhysic', 74, '2003-11-05 11:40:05.000000', 'Married', 'Lu', 'Female', 'Durgan', 'Labadie', 'German', '2-03-10-05-2', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'zachary.koch@yahoo.com', '$2a$10$B4/u1tjP34xMWJyK5.FOB.eoYd6kal5YiMQ2/dsQ9DFrg8g7T1y6y', 1, 'Technologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', NULL, '1983-11-16 10:04:20.000000', 'EMP-RAD-TECH2', 'Associate\'s Degree in Radiologic Technology', 'MRI Technologist'),
('PrfrmngPhysic', 75, '1989-10-22 18:12:02.000000', 'Separated', 'Maxwell', 'Male', 'Torp', 'Hahn', 'Spanish', '1-89-09-22-3', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'michaele.koelpin@gmail.com', '$2a$10$n0QWxMhQSQE6ebVs9tzAWu92U.y5WmO2oUsjuMcMe7NvlMBSqD/Ie', 1, 'Technologist', '2024-11-11 12:34:56.000000', '2024-11-11 12:34:56.000000', NULL, '1968-06-27 14:21:37.000000', 'EMP-RAD-TECH3', 'Associate\'s Degree in Radiologic Technology', 'MRI Technologist'),
('PrfrmngPhysic', 76, '1968-07-21 15:28:28.000000', 'Divorced', 'Otha', 'Female', 'Mante', 'Schultz', 'Italian', '2-68-06-21-4', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'nathan.tillman@yahoo.com', '$2a$10$bJ51AFOvH26NVsQ8MPDa/.209brr2Ubvbe3gMXVE1tU0VIx7TqWRq', 1, 'Technologist', '2024-11-11 12:34:57.000000', '2024-11-11 12:34:57.000000', NULL, '1965-07-17 01:30:29.000000', 'EMP-RAD-TECH4', 'Associate\'s Degree in Radiologic Technology', 'MRI Technologist'),
('Staff', 77, '1973-05-13 18:10:08.000000', 'Separated', 'Mason', 'Male', 'Leuschke', 'O\'Hara', 'British', '4673-04-13-0', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'kendall.jones@gmail.com', '$2a$10$rDKaMj5qiNBg6TKtZeMtqOpEy66TCJi1HrKW7EBvkSJ6PzcmuTxay', 1, 'Physician', '2024-11-13 10:12:14.000000', '2024-11-13 10:12:14.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 78, '1979-10-19 03:52:18.000000', 'Married', 'Krissy', 'Male', 'Hartmann', 'Pfannerstill', 'French', '4679-09-19-1', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'caren.abshire@yahoo.com', '$2a$10$UYv36OizFD6VG/3qGKWWMuyZezYcHBJmR18riAt/8b4NJnGUWoi3.', 1, 'Physician', '2024-11-13 10:12:14.000000', '2024-11-13 10:12:14.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 79, '1962-02-01 21:38:31.000000', 'Annulled', 'Samatha', 'Female', 'Spencer', 'Rohan', 'British', '4762-01-01-2', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'penni.hintz@yahoo.com', '$2a$10$TwRd.5wUW8n8.g4PY4kvk.pz.8q5Gnv4p5k3AGEf2taiaDJMVD0TS', 1, 'Physician', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 80, '2005-10-15 08:08:11.000000', 'Separated', 'Boris', 'Male', 'Altenwerth', 'Braun', 'Italian', '46105-09-15-3', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'mazie.weimann@yahoo.com', '$2a$10$YS09FcyJshXwKf5KtH40LePaxOxWn2MWtz3AoYcxeaf87nZ5H3O4i', 1, 'Physician', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Staff', 81, '1977-08-18 04:45:29.000000', 'Single', 'Russell', 'Male', 'Beer', 'Treutel', 'French', '4677-07-18-4', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'claud.harber@hotmail.com', '$2a$10$8CMZU6dDNp73g4YPtLCFQOYiCKCBw//6625ijA0EPZASw8HGsbH9a', 1, 'Physician', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 82, '1972-05-06 04:28:14.000000', 'Divorced', 'Jared', 'Female', 'Labadie', 'Hermann', 'German', '2-72-04-06-0', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'mee.tromp@hotmail.com', '$2a$10$V.5dxLld4AbsNDIb8n7fc.HUfTk8v0O66il78phMEh67vo.re98Qi', 1, 'Patient', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 83, '1977-02-16 00:07:23.000000', 'Separated', 'Clement', 'Male', 'Howell', 'Armstrong', 'Chinese', '1-77-01-16-1', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'heath.robel@gmail.com', '$2a$10$9zG6FbN0T62kma0uOCgn1e1bmAwO1tpgljVtObYJ.gEBbKuAJH296', 1, 'Patient', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 84, '1960-08-03 17:51:22.000000', 'Separated', 'Pierre', 'Female', 'Raynor', 'Johns', 'Italian', '2-60-07-03-2', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'vicky.dach@hotmail.com', '$2a$10$uLZFtHMMrAuur8WSHacebe5h5QCU1RAlzCxI7BVIFLeZExhkivvMK', 1, 'Patient', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 85, '1976-10-05 11:10:21.000000', 'Married', 'Lakesha', 'Male', 'Wiza', 'Flatley', 'British', '1-76-09-05-3', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'merlin.legros@yahoo.com', '$2a$10$wGNQ2yFSJnfXts422TcTDe1iA2wEOdiGL8QZx7oSTuomUt85CQtFG', 1, 'Patient', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 86, '1998-08-12 06:44:08.000000', 'Married', 'Isidro', 'Male', 'Terry', 'Gislason', 'Spanish', '1-98-07-12-4', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'flo.torphy@hotmail.com', '$2a$10$egpJEwIBIfER20DpA4dOguy6MbGMasCRaBsBqVXa/zcpb/Vd8Ncru', 1, 'Patient', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 87, '1967-10-13 07:19:12.000000', 'Widowed', 'Shirley', 'Female', 'Morissette', 'Lakin', 'Spanish', '2-67-09-13-5', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'lili.torphy@hotmail.com', '$2a$10$z1WZC53WBgOONjBxZmw0QOUhp8fEW.W2JN1.L9nbOxyw2ft0Iadve', 1, 'Patient', '2024-11-13 10:12:15.000000', '2024-11-13 10:12:15.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 88, '1964-06-13 03:28:32.000000', 'Divorced', 'Gabriele', 'Male', 'Green', 'Turcotte', 'Japanese', '1-64-05-13-6', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'zachary.wilkinson@yahoo.com', '$2a$10$Yon94040EMPVsdbgLCpRq.MQyRQSymDy047vUZ3o/jukSbB2f4XSy', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 89, '2004-08-20 09:17:50.000000', 'Annulled', 'Maire', 'Male', 'Legros', 'Reichert', 'French', '1-04-07-20-7', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'newton.nicolas@hotmail.com', '$2a$10$PRmbsdGVcK5Vn0EuCphEseOYl.dcSfoJZ7rLR21FGvwqbuI82z5dq', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 90, '1984-02-20 15:33:04.000000', 'Divorced', 'Pete', 'Male', 'Marks', 'Wisozk', 'Chinese', '1-84-01-20-8', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'joey.frami@gmail.com', '$2a$10$UtVxqKz/L01uU99GHyGls.wriZ4Ujal/RVa52xi908f1TtxMqttuy', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 91, '1965-05-29 02:43:44.000000', 'Separated', 'Britany', 'Female', 'Tillman', 'Rogahn', 'Japanese', '2-65-04-29-9', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'terrance.ward@gmail.com', '$2a$10$W36SXvdhbhzaKHS6zqCHEO09bytPt47dhbtdRNnSzQ63pNQwy1qru', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 92, '1993-06-11 06:27:43.000000', 'Divorced', 'Leo', 'Male', 'Okuneva', 'Kovacek', 'American', '1-93-05-11-10', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'stewart.stamm@gmail.com', '$2a$10$x/BiczJ6UM18GGpguSbjje8I2b0yIHFQfiP3BfWBVmsz59CSWDHwm', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 93, '1976-07-13 03:01:31.000000', 'Widowed', 'Harry', 'Female', 'Kertzmann', 'Roob', 'Japanese', '2-76-06-13-11', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'dorthey.halvorson@gmail.com', '$2a$10$5Vnb01A5IEnCUfD6EMNW4OHLEwzQr2SMBzmpEP4n4b52idgMX/Gie', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 94, '1984-01-08 22:08:12.000000', 'Domestic Partnership', 'Marlana', 'Female', 'Corwin', 'Yost', 'French', '2-84-00-08-12', 'https://www.upgradebox.info/img/business-woman.png', 'bettina.hahn@gmail.com', '$2a$10$YUsPzHoneyUENgWuJTxDr.wyXfqPCIu7LGPGxFZhcSmIc8gFvNPl6', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 95, '1994-11-03 00:59:25.000000', 'Single', 'Audrea', 'Male', 'West', 'Hills', 'Japanese', '1-94-10-03-13', 'https://w7.pngwing.com/pngs/902/963/png-transparent-business-automobile-salesperson-human-resource-management-xing-business-blue-human-resource-management-people-thumbnail.png', 'errol.lockman@gmail.com', '$2a$10$QBxLaufoXVumVVbN0faoT.5L4VuP2th5aCspbXWi7qXnR4i3iAmjC', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 96, '1973-10-28 02:11:37.000000', 'Married', 'Kristle', 'Male', 'Hilpert', 'Heidenreich', 'Spanish', '1-73-09-28-14', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'miriam.brakus@gmail.com', '$2a$10$v.2Ae0wk/F4SLFYeDehtReHw/UApakIZwE8YL0MrD9g0z9yeJOXqy', 1, 'Patient', '2024-11-13 10:12:16.000000', '2024-11-13 10:12:16.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 97, '1981-09-29 10:35:11.000000', 'Single', 'Emmaline', 'Female', 'Fadel', 'Shields', 'French', '2-81-08-29-15', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'carol.stanton@hotmail.com', '$2a$10$WmjNKryPCJKjSnYH/BA16uG.fPqM9Szpq4ZPC4DiU5ZJXTSNjv.72', 1, 'Patient', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 98, '1998-01-22 01:51:05.000000', 'Single', 'Rosario', 'Male', 'Conroy', 'Daniel', 'Italian', '1-98-00-22-16', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'mark.grady@gmail.com', '$2a$10$J5c89563H5NDuJeI5SOSoun9N4S4E6MyofXrkmowG7WRVmM5ZEez.', 1, 'Patient', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 99, '1966-08-31 02:31:53.000000', 'Single', 'Jesse', 'Male', 'Nienow', 'Breitenberg', 'American', '1-66-07-31-17', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'margherita.rodriguez@gmail.com', '$2a$10$8/Q00beb0/FDrzxKQRIC5OxdDw6akIpAP2v.46TGp5QtkGu7lbu3m', 1, 'Patient', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 100, '1992-11-21 23:50:25.000000', 'Separated', 'Christiana', 'Female', 'Murphy', 'Rowe', 'American', '2-92-10-21-18', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'aron.auer@gmail.com', '$2a$10$VplDagAIRjZUJSrWf3Bike80/LO8Q/gk39eYL.ua10/kZaa2pcaJe', 1, 'Patient', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', NULL, NULL, NULL, NULL, NULL),
('Patient', 101, '1981-06-15 23:40:15.000000', 'Domestic Partnership', 'Ray', 'Male', 'Mohr', 'Waelchi', 'French', '1-81-05-15-19', 'https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg', 'bobbie.christiansen@gmail.com', '$2a$10$8BhGgl1IEKm8oVjHRLBFuORStUApvAtLyWwCFEjGDlFY7Y/WL2y8W', 1, 'Patient', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', NULL, NULL, NULL, NULL, NULL),
('RfrntPhysic', 102, '1982-10-13 23:45:33.000000', 'Widowed', 'Cameron', 'Female', 'Dickinson', 'Fay', 'Italian', '2-82-09-13-0', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'jason.reinger@yahoo.com', '$2a$10$1Mr/YGN4QDgW9IM.xwcAw.9A4GxyYHmUHHNDe/ua45NtetcEVLJzy', 1, 'Radiologist', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', 'https://www.freepnglogos.com/uploads/signature-png/signature-mohammad-png-19.png', '1988-09-07 10:12:57.000000', 'EMP-RAD0', 'Fellowship in Musculoskeletal Radiology', 'Interventional'),
('RfrntPhysic', 103, '2005-10-16 23:43:30.000000', 'Domestic Partnership', 'Rachael', 'Male', 'Rempel', 'Heaney', 'British', '1-05-09-16-1', 'https://w7.pngwing.com/pngs/902/963/png-transparent-business-automobile-salesperson-human-resource-management-xing-business-blue-human-resource-management-people-thumbnail.png', 'chance.marquardt@hotmail.com', '$2a$10$f08c3gnfXNn47eQOX6wUeezD/KAmZ.iWLkMPLXpMIYPbcL3yTXC4K', 1, 'Radiologist', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', 'https://2.bp.blogspot.com/-eh9Y_rw1oxs/WHvBWrFQeGI/AAAAAAAAAI4/ozizwcWAzakKIg1i6bbbXF8GRQiVODAMwCLcB/s1600/Screenshot_59.png', '1967-04-16 23:25:39.000000', 'EMP-RAD1', 'Fellowship in Musculoskeletal Radiology', 'Breast Imaging'),
('RfrntPhysic', 104, '2002-09-10 04:06:48.000000', 'Married', 'Oda', 'Male', 'Lang', 'Murazik', 'French', '1-02-08-10-2', 'https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg', 'angelo.windler@yahoo.com', '$2a$10$4SH6Mvfg3GQEQylo1r/ILOuDXGozeU.BHzSk/g/EnAiTdlmzZHo.2', 1, 'Radiologist', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', 'https://th.bing.com/th/id/OIP.PxLLLFR_tGzPnZ9ChYEVqwAAAA?pid=ImgDet&rs=1', '2001-05-23 20:07:33.000000', 'EMP-RAD2', 'Fellowship in Nuclear Medicine', 'Nuclear Medicine'),
('RfrntPhysic', 105, '1980-12-09 19:00:25.000000', 'Divorced', 'Stephan', 'Female', 'Corwin', 'Russel', 'French', '2-80-11-09-3', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'chelsea.kreiger@gmail.com', '$2a$10$zaFfeRJ39Yv5707xTpSZbOGA6rqB.JWEpXO40/hcpZlvqdIqWr3ie', 1, 'Radiologist', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', 'https://th.bing.com/th/id/OIP.LFMIOeZxCqIrIYYkbv9LEQHaHA?pid=ImgDet&rs=1', '1979-01-23 07:01:57.000000', 'EMP-RAD3', 'Fellowship in Pediatric Radiology', 'Pediatric'),
('RfrntPhysic', 106, '1995-02-22 11:35:05.000000', 'Married', 'Marlon', 'Female', 'Cassin', 'Volkman', 'French', '2-95-01-22-4', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'judson.lebsack@gmail.com', '$2a$10$RQP5G06O5ctnEQP2VCFKu.1KeaaH6.ea36nfp0GI6JeBeWOrIg6re', 1, 'Radiologist', '2024-11-13 10:12:17.000000', '2024-11-13 10:12:17.000000', 'https://editorial-adarve.com/wp-content/uploads/2020/05/firma-1024x733.jpg', '1982-10-11 09:15:09.000000', 'EMP-RAD4', 'Fellowship in Pediatric Radiology', 'Body Imaging'),
('PrfrmngPhysic', 107, '1997-03-08 05:38:32.000000', 'Separated', 'Elke', 'Female', 'Weissnat', 'Tromp', 'Canadian', '2-97-02-08-0', 'https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1', 'noble.schultz@gmail.com', '$2a$10$YKi6M0//BS7SmLBL89S63eYRdoIaQvuEogds5OSfwkOiiunkhhkYe', 1, 'Technologist', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', NULL, '1992-05-11 05:06:44.000000', 'EMP-RAD-TECH0', 'Certified Radiologic Technologist (CRT)', 'X-ray Technologist'),
('PrfrmngPhysic', 108, '1999-10-11 14:46:44.000000', 'Single', 'Keenan', 'Male', 'Streich', 'Glover', 'German', '1-99-09-11-1', 'https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png', 'bernetta.treutel@gmail.com', '$2a$10$XVkVDvwcLXZDFVxnn4fixORkfLS5bPgDZlFrEWOs5fmsh2fLvxChu', 1, 'Technologist', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', NULL, '2001-01-29 12:10:58.000000', 'EMP-RAD-TECH1', 'Certified Radiologic Technologist (CRT)', 'MRI Technologist');
INSERT INTO `user` (`dtype`, `user_ky`, `birth_date`, `civil_status`, `first_name`, `gender`, `last_name`, `maiden_name`, `nationality`, `user_id`, `user_image`, `user_name`, `user_password`, `user_rcrd_sts`, `user_role`, `user_unx_tm_crt`, `user_unx_tm_updt`, `signature`, `date_of_hire`, `employee_id`, `qualification`, `specialization`) VALUES
('PrfrmngPhysic', 109, '1971-06-16 14:08:29.000000', 'Widowed', 'Colleen', 'Female', 'Borer', 'Schaefer', 'Spanish', '2-71-05-16-2', 'https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1', 'tyron.okuneva@yahoo.com', '$2a$10$Zq/qycbrVt5crORZ.kmom.bWyQp8M2c0DFFprx2QsKKHSJu9trQNK', 1, 'Technologist', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', NULL, '1970-12-22 11:47:41.000000', 'EMP-RAD-TECH2', 'Certified Radiologic Technologist (CRT)', 'X-ray Technologist'),
('PrfrmngPhysic', 110, '1997-11-20 22:39:22.000000', 'Separated', 'Lera', 'Female', 'Kulas', 'Hoeger', 'Japanese', '2-97-10-20-3', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'gianna.schowalter@gmail.com', '$2a$10$bWmQ0E6eawheCChQpFH8T.scu/ZumFbdCvY1TQhYlbMyf8rJsDQeW', 1, 'Technologist', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', NULL, '1969-07-11 10:15:59.000000', 'EMP-RAD-TECH3', 'Certified Radiologic Technologist (CRT)', 'MRI Technologist'),
('PrfrmngPhysic', 111, '1998-01-05 01:51:03.000000', 'Annulled', 'Anglea', 'Female', 'Nienow', 'Jerde', 'British', '2-98-00-05-4', 'https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1', 'margarito.kassulke@hotmail.com', '$2a$10$vKYESWhuTFpAgW9N.UW4z.nohqtrraCAH7aOK9n995u3imuOmVTxi', 1, 'Technologist', '2024-11-13 10:12:18.000000', '2024-11-13 10:12:18.000000', NULL, '2004-03-16 20:57:41.000000', 'EMP-RAD-TECH4', 'Certified Radiologic Technologist (CRT)', 'X-ray Technologist');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_ky`),
  ADD KEY `FKov8ll95jwj150j1s9kkcc5yrg` (`equipment_ref`);

--
-- Index pour la table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`eqpmnt_ky`),
  ADD KEY `FKlypijuotjchj7k58jxpxl7owy` (`room_ref`);

--
-- Index pour la table `exploitation_unit`
--
ALTER TABLE `exploitation_unit`
  ADD PRIMARY KEY (`expl_unit_ky`),
  ADD KEY `FKj3hiyiv5yprey0fxyip1v7hu4` (`service_area_ref`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_ky`),
  ADD KEY `FKen7cr9nj1nqu23ymbk95wkd2l` (`receiver_user_ky`),
  ADD KEY `FKictdiiq71x1j5w2020vpy6c4i` (`sender_user_ky`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_ky`),
  ADD KEY `FK5nw51f23fo7gw5kwru78jg8ax` (`recipient_ky`);

--
-- Index pour la table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`object_ky`),
  ADD KEY `FKcuoagxlcyh2lpdsykmlmwhr2g` (`report_ref`),
  ADD KEY `FKti21dxrocrp4sdpjheomklv6r` (`series_ref`);

--
-- Index pour la table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_ky`),
  ADD KEY `FKpij6y299eb84n7efky01dfgyf` (`study_ref`);

--
-- Index pour la table `report_version`
--
ALTER TABLE `report_version`
  ADD PRIMARY KEY (`report_version_ky`),
  ADD KEY `FK5ds8gn19g4889jjyxj679dk1m` (`report_ref`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_ky`),
  ADD KEY `FKlbx47q3e6enxlcmselvws5pqe` (`room_grp_ref`);

--
-- Index pour la table `room_group`
--
ALTER TABLE `room_group`
  ADD PRIMARY KEY (`room_grp_ky`),
  ADD KEY `FKp1hhsdd6iameh73wbi1rvmcod` (`exploitation_unit_ref`);

--
-- Index pour la table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`series_ky`),
  ADD UNIQUE KEY `UK_9ji8ke8qvv8pbc1bxvohf7kdp` (`series_label`),
  ADD KEY `FKqkblkufj991lrwpjub5ttbf4l` (`study_ref`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_ky`),
  ADD KEY `FK5am7q68ya1wfm9wd7gdywpvpp` (`site_ref`);

--
-- Index pour la table `service_area`
--
ALTER TABLE `service_area`
  ADD PRIMARY KEY (`serv_area_ky`),
  ADD KEY `FKl5c2slcaxxdiqdm7knp8vlb1g` (`service_ref`);

--
-- Index pour la table `shared_exam_link`
--
ALTER TABLE `shared_exam_link`
  ADD PRIMARY KEY (`shared_exam_ky`),
  ADD KEY `FK8ude4up2h940jfx2y49kssswo` (`rfrntphysic_id`),
  ADD KEY `FKd4evt3wdvshw551x8ex6s2kvh` (`exam_id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`site_ky`),
  ADD KEY `FKtjcdt4h7rv78lshxmp43y0gqc` (`site_grp_ref`);

--
-- Index pour la table `site_group`
--
ALTER TABLE `site_group`
  ADD PRIMARY KEY (`site_grp_ky`),
  ADD UNIQUE KEY `UK_6lye9ktgtrkj527yb79j6kx4g` (`site_grp_nm`);

--
-- Index pour la table `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`study_ky`),
  ADD UNIQUE KEY `UK_og2i2yak79pglqof71clglsa9` (`study_label`),
  ADD KEY `FKpwp68t8l767c197sihj6unje1` (`patient_ref`),
  ADD KEY `FKfirb2syhs7cv9h8terrrtx352` (`prfrmng_physic_ref`),
  ADD KEY `FKpcq5wghx1boogn8nrh8p23yx7` (`rfrnt_physic_ref`);

--
-- Index pour la table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_ky`),
  ADD KEY `FK2jjep53f79vfo9vp0iarsq2n9` (`assigned_to_ky`),
  ADD KEY `FKt6h8oehxxdl4xxt837pun8xwa` (`owner_ky`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_ky`),
  ADD UNIQUE KEY `UK_a3imlf41l37utmxiquukk8ajc` (`user_id`),
  ADD UNIQUE KEY `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bed`
--
ALTER TABLE `bed`
  MODIFY `bed_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `eqpmnt_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exploitation_unit`
--
ALTER TABLE `exploitation_unit`
  MODIFY `expl_unit_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `message_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `object`
--
ALTER TABLE `object`
  MODIFY `object_ky` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `report`
--
ALTER TABLE `report`
  MODIFY `report_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `report_version`
--
ALTER TABLE `report_version`
  MODIFY `report_version_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `room_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `room_group`
--
ALTER TABLE `room_group`
  MODIFY `room_grp_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `series`
--
ALTER TABLE `series`
  MODIFY `series_ky` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `service_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `service_area`
--
ALTER TABLE `service_area`
  MODIFY `serv_area_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `shared_exam_link`
--
ALTER TABLE `shared_exam_link`
  MODIFY `shared_exam_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `site_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_group`
--
ALTER TABLE `site_group`
  MODIFY `site_grp_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `study`
--
ALTER TABLE `study`
  MODIFY `study_ky` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pour la table `task`
--
ALTER TABLE `task`
  MODIFY `task_ky` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_ky` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `FKov8ll95jwj150j1s9kkcc5yrg` FOREIGN KEY (`equipment_ref`) REFERENCES `equipment` (`eqpmnt_ky`);

--
-- Contraintes pour la table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `FKlypijuotjchj7k58jxpxl7owy` FOREIGN KEY (`room_ref`) REFERENCES `room` (`room_ky`);

--
-- Contraintes pour la table `exploitation_unit`
--
ALTER TABLE `exploitation_unit`
  ADD CONSTRAINT `FKj3hiyiv5yprey0fxyip1v7hu4` FOREIGN KEY (`service_area_ref`) REFERENCES `service_area` (`serv_area_ky`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FKen7cr9nj1nqu23ymbk95wkd2l` FOREIGN KEY (`receiver_user_ky`) REFERENCES `user` (`user_ky`),
  ADD CONSTRAINT `FKictdiiq71x1j5w2020vpy6c4i` FOREIGN KEY (`sender_user_ky`) REFERENCES `user` (`user_ky`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK5nw51f23fo7gw5kwru78jg8ax` FOREIGN KEY (`recipient_ky`) REFERENCES `user` (`user_ky`);

--
-- Contraintes pour la table `object`
--
ALTER TABLE `object`
  ADD CONSTRAINT `FKcuoagxlcyh2lpdsykmlmwhr2g` FOREIGN KEY (`report_ref`) REFERENCES `report` (`report_ky`),
  ADD CONSTRAINT `FKti21dxrocrp4sdpjheomklv6r` FOREIGN KEY (`series_ref`) REFERENCES `series` (`series_ky`);

--
-- Contraintes pour la table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `FKpij6y299eb84n7efky01dfgyf` FOREIGN KEY (`study_ref`) REFERENCES `study` (`study_ky`);

--
-- Contraintes pour la table `report_version`
--
ALTER TABLE `report_version`
  ADD CONSTRAINT `FK5ds8gn19g4889jjyxj679dk1m` FOREIGN KEY (`report_ref`) REFERENCES `report` (`report_ky`);

--
-- Contraintes pour la table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FKlbx47q3e6enxlcmselvws5pqe` FOREIGN KEY (`room_grp_ref`) REFERENCES `room_group` (`room_grp_ky`);

--
-- Contraintes pour la table `room_group`
--
ALTER TABLE `room_group`
  ADD CONSTRAINT `FKp1hhsdd6iameh73wbi1rvmcod` FOREIGN KEY (`exploitation_unit_ref`) REFERENCES `exploitation_unit` (`expl_unit_ky`);

--
-- Contraintes pour la table `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `FKqkblkufj991lrwpjub5ttbf4l` FOREIGN KEY (`study_ref`) REFERENCES `study` (`study_ky`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK5am7q68ya1wfm9wd7gdywpvpp` FOREIGN KEY (`site_ref`) REFERENCES `site` (`site_ky`);

--
-- Contraintes pour la table `service_area`
--
ALTER TABLE `service_area`
  ADD CONSTRAINT `FKl5c2slcaxxdiqdm7knp8vlb1g` FOREIGN KEY (`service_ref`) REFERENCES `service` (`service_ky`);

--
-- Contraintes pour la table `shared_exam_link`
--
ALTER TABLE `shared_exam_link`
  ADD CONSTRAINT `FK8ude4up2h940jfx2y49kssswo` FOREIGN KEY (`rfrntphysic_id`) REFERENCES `user` (`user_ky`),
  ADD CONSTRAINT `FKd4evt3wdvshw551x8ex6s2kvh` FOREIGN KEY (`exam_id`) REFERENCES `study` (`study_ky`);

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FKtjcdt4h7rv78lshxmp43y0gqc` FOREIGN KEY (`site_grp_ref`) REFERENCES `site_group` (`site_grp_ky`);

--
-- Contraintes pour la table `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `FKfirb2syhs7cv9h8terrrtx352` FOREIGN KEY (`prfrmng_physic_ref`) REFERENCES `user` (`user_ky`),
  ADD CONSTRAINT `FKpcq5wghx1boogn8nrh8p23yx7` FOREIGN KEY (`rfrnt_physic_ref`) REFERENCES `user` (`user_ky`),
  ADD CONSTRAINT `FKpwp68t8l767c197sihj6unje1` FOREIGN KEY (`patient_ref`) REFERENCES `user` (`user_ky`);

--
-- Contraintes pour la table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK2jjep53f79vfo9vp0iarsq2n9` FOREIGN KEY (`assigned_to_ky`) REFERENCES `user` (`user_ky`),
  ADD CONSTRAINT `FKt6h8oehxxdl4xxt837pun8xwa` FOREIGN KEY (`owner_ky`) REFERENCES `user` (`user_ky`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
