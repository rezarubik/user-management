-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Jun 2022 pada 06.20
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user-management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_06_10_112011_add_is_verify_to_users_table', 2),
(6, '2022_06_10_192152_create_permission_tables', 4),
(7, '2022_03_28_090711_create_user_role_table', 5),
(10, '2022_06_11_034408_add_validation_code_in_users_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 4),
(2, 'App\\User', 4),
(2, 'App\\User', 7),
(2, 'App\\User', 8),
(2, 'App\\User', 9),
(2, 'App\\User', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view settings menus', 'web', '2022-06-10 12:41:46', '2022-06-10 12:41:46'),
(2, 'view form create user', 'web', '2022-06-10 12:41:58', '2022-06-10 12:41:58'),
(3, 'view users', 'web', '2022-06-10 12:42:11', '2022-06-10 12:42:11'),
(4, 'view roles', 'web', '2022-06-10 12:42:16', '2022-06-10 12:42:16'),
(5, 'view permissions', 'web', '2022-06-10 12:42:22', '2022-06-10 12:42:22'),
(6, 'view operationals', 'web', '2022-06-10 12:58:43', '2022-06-10 12:58:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2022-06-10 12:38:47', '2022-06-10 12:38:47'),
(2, 'Operational', 'web', '2022-06-10 12:56:23', '2022-06-10 12:56:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verify` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `validation_code`, `is_verify`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Reza', 'Pahlevi', 'reza@gmail.com', NULL, '12345678', NULL, 0, NULL, '2022-06-10 04:18:50', '2022-06-10 04:18:50'),
(2, 'Reza', 'Pahlevi', 'rezaa@gmail.com', NULL, '12345678', NULL, 0, NULL, '2022-06-10 04:22:32', '2022-06-10 04:22:32'),
(3, 'Reza', 'Phaasd', 'test@gmail.com', NULL, '$2y$10$NqLUQ.akSjf7lC94A81e2u05qyyLKwmXHAFGp9cYsHtiifcoFqFK.', NULL, 1, NULL, '2022-06-10 04:24:47', '2022-06-10 04:24:47'),
(4, 'Super', 'Admin', 'superadmin@gmail.com', NULL, '$2y$10$wd7EgDZZi.6r4CDE0oxdR.XGq4rinGfYHvY5K2lBi4gtYrFzKn5yK', NULL, 1, NULL, '2022-06-10 04:54:25', '2022-06-10 04:54:25'),
(5, 'firstname', 'lastname', 'testing@gmail.com', NULL, '$2y$10$R9ZkJLWOH6ldkn4gZAP.h.sNNB5FKSxsM3OU.J.d9Lats1HktHfDW', NULL, 0, NULL, '2022-06-10 05:29:36', '2022-06-10 05:29:36'),
(7, 'Muhammad Reza', 'Pahlevi Y', 'rezarubik@gmail.com', NULL, '$2y$10$bueQrb/mWq6Wty0hjA5N0e3xD1VGdatGtrXYSmYJpqnj4tQ0Bvqza', NULL, 1, NULL, '2022-06-10 12:00:33', '2022-06-10 12:00:33'),
(8, 'Operationals 1', 'Test', 'operational@gmail.com', NULL, '$2y$10$5eQ9uK5lsMjJu3N2UUQzx.2.cbUgm5DhWLViUA.LQ.lXa27vT3XsK', NULL, 0, NULL, '2022-06-10 13:02:58', '2022-06-10 13:02:58'),
(9, 'Opr 2', 'Test', 'opr2@gmail.com', NULL, '$2y$10$dPdhUJpg8dNHf/dqBAl1yuBkgjdgaBTtXkcOzlT/qm23fK0nrw7.K', NULL, 0, NULL, '2022-06-10 13:09:44', '2022-06-10 13:09:44'),
(10, 'Opr 3', 'opr3@gmail.com', 'opr3@gmail.com', NULL, '$2y$10$AtK5nSA8Bo.j9qVcBXMl2eBf3VqEf5iueS6DgxPasqtVG6vJKE4Su', NULL, 0, NULL, '2022-06-10 13:11:02', '2022-06-10 13:11:02'),
(11, 'Reza', 'Pahlevi', 'rezapahlevi@gmail.com', NULL, '$2y$10$AabB5tB/nEvo1EtIcjwyJ.jBmYT3eiGJDgYFg.HaFZexm.54M/dTi', NULL, 0, NULL, '2022-06-10 20:29:08', '2022-06-10 20:29:08'),
(12, 'Reza', 'Pahlevi', 'asd@gmail.com', NULL, '$2y$10$lE0tQm5EPVNijCBsJuw12O2UjBR9iDw536EuFo.//6z1e9ecJ0I3G', NULL, 0, NULL, '2022-06-10 20:37:16', '2022-06-10 20:37:16'),
(13, 'Reza', 'Pahlevi', 'qwe@gmail.com', NULL, '$2y$10$Ugg9rRFJ.rguZVzXxtSyJ.0QiQFjnyG1IEzE8SJq3PKVpa.J3.ipO', NULL, 0, NULL, '2022-06-10 20:39:50', '2022-06-10 20:39:50'),
(15, 'Reza', 'Pahlevi', 'john@gmail.com', NULL, '$2y$10$150vltZRo0aSXyRfnVlKE.mKsN7zH4NalGtSB7AFr.IsgGYBPPQkG', 't9pMtqFnBTZFa0HSMr4GaFaRoABg4aCaCJ45ZWmzvUnmn1vIQUKcJHHc6ML5GY5kf0p9uGwrkOXqmZNDr05XXqXEuGQFZIDSd3oYguvqqHdUnyax3P7EYTn1FP8BiJt4qx3P6qcCQcHNjFMxnl4cTxgnrcyzHE6fc8SaWsi2DaDTFDkoHTBDGHoo68TVt0ntTn6pbyV24J2awdECJzmqYMvPL3aCTLD4ziLO8O7x0BDSr30F22Tw1AmJqdwjPbh', 0, NULL, '2022-06-10 20:46:57', '2022-06-10 20:46:57'),
(21, 'Muhammad Reza', 'Pahlevi Y', 'rezarubik17@gmail.com', '2022-06-10 21:10:10', '$2y$10$YbiqFi1kPGzapFpRGi6W5.1Jtv07sB6rng/9W7YlKm7A7u4tO6LO6', 'PSXF4uMzpkLuxxr9XgbEHSOogGGHyG8VAdKYLYUPKrr9ECRyspWRt4zdVXSQyLN5W29yjHrR5Y2OHkPkpuYF24bSP3IcQvtTwcMkCLXnf69Oh543xwBlcPfWqtcj0BinFUg5ZmeonnoZ1GOBJcRTnZmwiDYh2lEpd6qhqMhuaSIkUOBo4faUEF0k0S8CFV3hndUgTOCMhEmTgtPPcUy4m3uJgRKqAM4zM96RtW75CG5dbjL3VzIqCxKE0j7gBFp', 1, NULL, '2022-06-10 21:09:17', '2022-06-10 21:10:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
