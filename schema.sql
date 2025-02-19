CREATE DATABASE IF NOT EXISTS `testing`


USE `testing`;


CREATE TABLE `api_key_workspace_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `hashed_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `workspace_id` int DEFAULT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `category_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `example` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `category_info_logger` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_suite_id` int NOT NULL,
  `key` text,
  `value` text,
  `mapped_category` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `collections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint DEFAULT '1',
  `name` varchar(115) DEFAULT NULL,
  `description` text,
  `user_id` int DEFAULT NULL,
  `workspace_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `conversations_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `test_suite_id` int DEFAULT NULL,
  `conversation` json NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `domain_feature_flags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_all` tinyint DEFAULT '1',
  `groups` tinyint DEFAULT '0',
  `workspaces` tinyint DEFAULT '0',
  `import_tests` tinyint DEFAULT '1',
  `block_everything` tinyint DEFAULT '0',
  `cicd` tinyint DEFAULT '0',
  `domain` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `domain_limits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_all_per_day` int DEFAULT '-1',
  `test_suites_total` int DEFAULT '-1',
  `workspaces_total` int DEFAULT '-1',
  `domain` varchar(100) NOT NULL,
  `test_suites_limit_crossed` tinyint DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `environment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workspace_id` int DEFAULT NULL,
  `environment_name` varchar(255) DEFAULT NULL,
  `environment_description` text,
  `created_by` int DEFAULT NULL,
  `default_env` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `proxy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `env` varchar(20) NOT NULL,
  `additional_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sent_to_mp` tinyint DEFAULT '0',
  `sent_to_ph` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=428534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `feature_flags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `run_all` tinyint DEFAULT '1',
  `groups` tinyint DEFAULT '0',
  `workspaces` tinyint DEFAULT '0',
  `import_tests` tinyint DEFAULT '1',
  `block_everything` tinyint DEFAULT '0',
  `cicd` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4655 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `feedback` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `import_raw_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(25) NOT NULL,
  `source_id` text,
  `raw_data` longtext,
  `user_id` int NOT NULL,
  `workspace_id` int NOT NULL,
  `generated` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `limits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `run_all_per_day` int DEFAULT '-1',
  `test_suites_total` tinyint DEFAULT '-1',
  `workspaces_total` tinyint DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workspace_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `description` longtext,
  `ip_addr` varchar(64) DEFAULT NULL,
  `meta_data` json DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27888 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `payment_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `stripe_customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `plan` varchar(100) NOT NULL,
  `checkout_session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `trial_start_date` date NOT NULL,
  `trial_end_date` date NOT NULL,
  `credits` bigint DEFAULT '0',
  `billing_model` varchar(20) DEFAULT 'usage',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2890 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `pre_run_script` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `script` text NOT NULL,
  `test_suite_id` int NOT NULL,
  `workspace_id` int NOT NULL,
  `run_on_every_test_case` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `public_test_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_suite_id` int DEFAULT NULL,
  `test_case_desc` varchar(200) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `http_method` varchar(15) DEFAULT 'GET',
  `url` varchar(500) NOT NULL,
  `headers` json DEFAULT NULL,
  `path_params` json DEFAULT NULL,
  `query_params` json DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `categories` varchar(105) DEFAULT NULL,
  `test_types` varchar(105) DEFAULT NULL,
  `fields` varchar(105) DEFAULT NULL,
  `test_scenario_type` varchar(55) DEFAULT NULL,
  `generated_by` varchar(15) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `placeholder` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `public_test_suite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_suite_name` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `method` varchar(15) DEFAULT 'GET',
  `url` varchar(500) NOT NULL,
  `api_desc` varchar(100) DEFAULT NULL,
  `headers` json DEFAULT NULL,
  `path_params` json DEFAULT NULL,
  `query_params` json DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `saved` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `json_url` varchar(100) DEFAULT NULL,
  `workspace_id` int DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `tags` text,
  `placeholder` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4606 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `public_workspace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `featured` tinyint(1) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `categories` text,
  `source` varchar(50) DEFAULT NULL,
  `source_url` varchar(200) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `display_name` varchar(100) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `generation_status` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `referral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `report_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `test_suite_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2713 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `run_logs` (
  `run_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `test_case_uuid` varchar(255) NOT NULL,
  `test_suite_id` int NOT NULL,
  `workspace_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `total_test_cases` int DEFAULT NULL,
  `total_test_suites` int DEFAULT NULL,
  `run_type` enum('TEST_CASE','TEST_SUITE','GROUP') NOT NULL,
  `runner_type` enum('USER','API') NOT NULL,
  `status` enum('PASSED','FAILED','N/A') NOT NULL,
  `idempotent_key` varchar(255) NOT NULL,
  `response` text,
  `headers` text,
  `status_code` varchar(255) DEFAULT NULL,
  `error_is_network_error` tinyint(1) DEFAULT NULL,
  `error_message` text,
  `elapsed_time` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request` text,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4034 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `sample_api_test_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_suite_id` int DEFAULT NULL,
  `test_case_desc` varchar(500) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `http_method` varchar(15) DEFAULT 'GET',
  `url` varchar(500) DEFAULT NULL,
  `headers` json DEFAULT NULL,
  `path_params` json DEFAULT NULL,
  `query_params` json DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `categories` varchar(105) DEFAULT NULL,
  `test_types` varchar(105) DEFAULT NULL,
  `fields` varchar(105) DEFAULT NULL,
  `test_scenario_type` varchar(55) DEFAULT NULL,
  `generated_by` varchar(15) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assertion` text,
  `edited` tinyint(1) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tags` text,
  PRIMARY KEY (`id`),
  KEY `test_case_test_suite_id` (`test_suite_id`),
  KEY `test_case_test_case_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=38737 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `sample_apis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `request` json DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `security_test_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_suite_id` int DEFAULT NULL,
  `test_case_desc` varchar(500) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `http_method` varchar(15) DEFAULT 'GET',
  `url` varchar(500) DEFAULT NULL,
  `headers` json DEFAULT NULL,
  `path_params` json DEFAULT NULL,
  `query_params` json DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `categories` varchar(105) DEFAULT NULL,
  `test_types` varchar(105) DEFAULT NULL,
  `fields` varchar(105) DEFAULT NULL,
  `test_scenario_type` varchar(55) DEFAULT NULL,
  `generated_by` varchar(15) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assertion` text,
  `edited` tinyint(1) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tags` varchar(255) NOT NULL DEFAULT 'security',
  PRIMARY KEY (`id`),
  KEY `test_case_test_suite_id` (`test_suite_id`),
  KEY `test_case_test_case_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=23393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `survey_answer_metadata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `test_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_suite_id` int DEFAULT NULL,
  `test_case_desc` varchar(500) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `http_method` varchar(15) DEFAULT 'GET',
  `url` varchar(500) DEFAULT NULL,
  `headers` json DEFAULT NULL,
  `path_params` json DEFAULT NULL,
  `query_params` json DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `categories` varchar(105) DEFAULT NULL,
  `test_types` varchar(105) DEFAULT NULL,
  `fields` varchar(105) DEFAULT NULL,
  `test_scenario_type` varchar(55) DEFAULT NULL,
  `generated_by` varchar(15) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assertion` text,
  `edited` tinyint(1) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tags` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_case_test_suite_id` (`test_suite_id`),
  KEY `test_case_test_case_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1917373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `test_case_generation_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `user_id` int NOT NULL,
  `request` text NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `source` varchar(25) NOT NULL,
  `import_raw_data_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `workspace_id` int DEFAULT NULL,
  `display_name` varchar(85) DEFAULT NULL,
  `email_sent` tinyint DEFAULT '0',
  `analysis` text,
  `collection_id` int DEFAULT NULL,
  `env` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `test_case_run` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_case_id` int DEFAULT NULL,
  `status_code` int DEFAULT NULL,
  `response_data` varchar(105) DEFAULT NULL,
  `response_headers` varchar(45) DEFAULT NULL,
  `test_run_status` varchar(15) DEFAULT NULL,
  `test_run_analysis` varchar(105) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `test_case_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workspace_id` int NOT NULL,
  `tag_name` text NOT NULL,
  `tag_description` text,
  `meta_data` text,
  `deleted` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `test_suite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) DEFAULT NULL,
  `test_suite_name` text,
  `user_id` int DEFAULT NULL,
  `method` varchar(15) DEFAULT 'GET',
  `url` varchar(500) NOT NULL,
  `api_desc` varchar(100) DEFAULT NULL,
  `headers` json DEFAULT NULL,
  `path_params` json DEFAULT NULL,
  `query_params` json DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `saved` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `json_url` varchar(100) DEFAULT NULL,
  `workspace_id` int DEFAULT NULL,
  `tags` text,
  `test_case_generation_task_id` int DEFAULT NULL,
  `generation_status` varchar(55) DEFAULT 'pending',
  `total_count` int DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  `wait_time` int DEFAULT '1000',
  `parallel_execution` int DEFAULT '1',
  `error_message` text,
  `workflow_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `test_suite_collection_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workspace_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `collection_id` int DEFAULT NULL,
  `test_suite_id` int DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `ui_test_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL DEFAULT (uuid()),
  `ui_test_suite_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(1024) NOT NULL,
  `file_content` text NOT NULL,
  `last_file_sha` char(40) NOT NULL COMMENT 'SHA-1 hash of the last saved file content',
  `file_type` varchar(50) NOT NULL DEFAULT 'test',
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `ui_test_generation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL DEFAULT (uuid()),
  `ui_test_suite_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `generated_test_s3_url` text,
  `converted_setup_teardown_script` text,
  `converted_tests_file` text,
  `scenarios` text,
  `user_scenarios` text,
  `extra_user_info_about_fields` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  `test_suite_type` enum('playwright','cypress','selenium') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `ui_test_suite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL DEFAULT (uuid()),
  `workspace_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `ui_test_suite_name` varchar(255) NOT NULL,
  `test_suite_type` enum('playwright','cypress','selenium') NOT NULL DEFAULT 'playwright',
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `user_scenarios` text,
  `latest_generated_id` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `machine_id` varchar(128) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tags` varchar(200) DEFAULT '',
  `is_blocked` tinyint DEFAULT '0',
  `attribution` varchar(200) DEFAULT NULL,
  `enterprise_email_sent` tinyint DEFAULT '0',
  `shown_product_tour` tinyint DEFAULT '0',
  `source` varchar(64) DEFAULT NULL,
  `login_token` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5654 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `user_prompt_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `prompt` text NOT NULL,
  `test_suite_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=646 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `user_survey_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `last_shown` timestamp NOT NULL,
  `survey_filled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `user_workspace_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `workspace_id` int DEFAULT NULL,
  `role` enum('ADMIN','USER') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5934 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `variable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workspace_id` int DEFAULT NULL,
  `environment_id` int DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `variable_value` varchar(2000) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2886 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `workflow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `workspace_id` int DEFAULT NULL,
  `selected_environment` int DEFAULT NULL,
  `generation_status` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `workflow_node_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` json DEFAULT NULL,
  `workflow_id` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_workflow_id` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1786 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `workflow_test_suite_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workflow_id` int DEFAULT NULL,
  `test_suite_id` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `node_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `workspace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5750 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `workspace_on_signup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(75) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `workspace_id` int DEFAULT NULL,
  `added` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `workspace_variable_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workspace_id` int NOT NULL,
  `variable_name` varchar(75) NOT NULL,
  `variable_value` text,
  `user_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
