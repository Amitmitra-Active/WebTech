SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Demo Category'),
(3, 'Finished Goods'),
(5, 'Machinery'),
(4, 'Packing Materials'),
(2, 'Raw Materials'),
(8, 'Stationery Items'),
(6, 'Work in Progress');

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(14, 'Sample Product', '47', '100.00', '500.00', 1, 0, '2021-08-04 02:32:46'),
(15, 'Box Varieties', '12000', '55.00', '130.00', 4, 0, '2021-08-04 02:35:52'),
(16, 'Books', '100', '250.00', '400.00', 8, 0, '2021-08-04 02:38:53'),
(17, 'Pen', '50', '5.00', '20.00', 8, 0, '2021-08-04 02:39:20'),
(18, 'Rice', '69', '40.00', '75.00', 2, 0, '2021-08-04 02:40:26'),
(19, 'Oil', '82', '150.00', '200.00', 2, 0, '2021-08-04 02:43:24'),
(20, 'Food', '44', '40.00', '66.00', 4, 0, '2021-08-04 02:44:18'),
(21, 'Dairy', '10', '50.00', '70.00', 2, 0, '2021-08-04 02:44:59'),
(23, 'Breakfast', '107', '3.00', '7.00', 3, 0, '2021-08-04 02:47:48'),
(24, 'Comics', '33', '66.00', '300.00', 8, 0, '2021-08-04 02:48:36'),
(25, 'Frozen', '40', '47.00', '84.00', 2, 0, '2021-08-04 02:49:43'),
(26, 'Chicken ', '50', '250.00', '400.00', 3, 0, '2021-08-04 02:50:54'),
(27, 'Toys', '500', '800.00', '2000.00', 5, 0, '2021-08-04 02:52:00'),
(28, 'Home &amp; Cleaning', '200', '600.00', '1200.00', 6, 0, '2021-08-04 02:53:27');

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'AMIT MITRA', 'Manager', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'no_image.png', 1, '2021-08-05 02:39:32'),
(3, 'Tofael', 'User', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2021-08-05 02:13:30'),
(4, 'Diganta', 'Diganta', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'no_image.png', 1, NULL),
(5, 'Rana', 'Rana', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'no_image.png', 1, '2021-04-04 19:54:29'),
(6, 'Maruf', 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'ojt4q5h6.png', 1, '2021-08-05 02:35:34');

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'special', 2, 1),
(3, 'User', 3, 1);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`media_id`);

ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level` (`user_level`);

ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;