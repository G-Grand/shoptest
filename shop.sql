-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 04 2016 г., 19:40
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Название',
  `categor_id` int(11) DEFAULT NULL COMMENT 'Ид. Родительской категории'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Категории товара';

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `categor_id`) VALUES
(1, 'Мясная продукция', NULL),
(2, 'Молочная продукция', NULL),
(3, 'Мясо', 1),
(4, 'Колбаса', 1),
(5, 'Вареная', 3),
(6, 'Варено-копченая', 3),
(7, 'Сырокопченая', 3),
(8, 'Сыры', 2),
(9, 'Полуфабрикаты', 1),
(10, 'Сыровяленые', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Полное имя',
  `phone` varchar(30) DEFAULT NULL COMMENT 'Телефон',
  `address` varchar(100) DEFAULT NULL COMMENT 'Адрес'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Покупатель';

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `phone`, `address`) VALUES
(1, 'Иванов Иван Иванович', '050 423 22 22', NULL),
(2, 'Кузнецов Михаил', NULL, NULL),
(3, 'Степан', '(044) 472 - 23 - 42', 'Киев'),
(5, 'Дядя Вася', NULL, 'Днепр'),
(6, 'Иоан Васильевич', NULL, ''),
(7, 'Абрамович Илья Ильич', NULL, NULL),
(8, 'Вадик', NULL, NULL),
(9, 'Суслов Владислав', NULL, NULL),
(10, 'Афанасий', NULL, NULL),
(14, 'Владимир Владимирович', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `measurement`
--

CREATE TABLE IF NOT EXISTS `measurement` (
  `short_name` varchar(50) NOT NULL COMMENT 'Краткое название',
  `name` varchar(100) NOT NULL COMMENT 'Название'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Единицы измерения';

--
-- Дамп данных таблицы `measurement`
--

INSERT INTO `measurement` (`short_name`, `name`) VALUES
('кг', 'килограм'),
('л', 'литр'),
('шт', 'штука'),
('ящ', 'ящик');

-- --------------------------------------------------------

--
-- Структура таблицы `order_content`
--

CREATE TABLE IF NOT EXISTS `order_content` (
  `order_id` int(11) NOT NULL COMMENT 'Ид. заказа',
  `product_id` int(11) NOT NULL COMMENT 'Ид. товара',
  `count` int(10) unsigned NOT NULL COMMENT 'Количество',
  `fixed_price` int(10) unsigned NOT NULL COMMENT 'Фиксированная цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержание заказа';

--
-- Дамп данных таблицы `order_content`
--

INSERT INTO `order_content` (`order_id`, `product_id`, `count`, `fixed_price`) VALUES
(1, 1, 1, 2000),
(1, 3, 1, 500),
(2, 5, 1, 7000),
(3, 2, 1, 5000),
(3, 4, 5, 600),
(3, 6, 1, 10000),
(4, 9, 1, 7999),
(5, 2, 2, 5000),
(6, 3, 4, 500),
(6, 7, 2, 4500),
(6, 1, 1, 2000),
(7, 14, 1, 8600),
(7, 15, 1, 9500),
(8, 3, 2, 500),
(8, 8, 3, 2000),
(9, 13, 1, 12599),
(10, 1, 1, 2000),
(10, 5, 2, 7000),
(10, 8, 1, 2000),
(10, 6, 3, 10000);

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL COMMENT 'Статус'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Статус заказа';

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `status`) VALUES
(1, 'Новый'),
(2, 'Выполняется'),
(3, 'Выполнен'),
(4, 'Отменен');

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE IF NOT EXISTS `price` (
  `date` datetime NOT NULL COMMENT 'Дата установки цены',
  `product_id` int(11) NOT NULL COMMENT 'Ид. товара',
  `price` int(10) unsigned NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Цены';

--
-- Дамп данных таблицы `price`
--

INSERT INTO `price` (`date`, `product_id`, `price`) VALUES
('2016-01-01 00:00:00', 1, 2000),
('2016-01-01 00:00:00', 2, 7999),
('2016-01-01 00:00:00', 3, 500),
('2016-01-01 00:00:00', 4, 600),
('2016-01-01 00:00:00', 5, 7000),
('2016-01-01 00:00:00', 6, 10000),
('2016-01-01 00:00:00', 7, 4500),
('2016-01-01 00:00:00', 8, 2000),
('2016-01-01 00:00:00', 9, 5000),
('2016-01-01 00:00:00', 10, 4500),
('2016-01-01 00:00:00', 11, 4600),
('2016-01-01 00:00:00', 12, 9600),
('2016-01-01 00:00:00', 13, 12599),
('2016-01-01 00:00:00', 14, 8600),
('2016-01-01 00:00:00', 15, 9500);

-- --------------------------------------------------------

--
-- Структура таблицы `producer`
--

CREATE TABLE IF NOT EXISTS `producer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Полное имя'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Производитель';

--
-- Дамп данных таблицы `producer`
--

INSERT INTO `producer` (`id`, `name`) VALUES
(1, 'ТОВ "Кошермяс"'),
(2, 'базар на Тополе');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Название',
  `categor_id` int(11) NOT NULL COMMENT 'Ид. категории',
  `producer_id` int(11) NOT NULL COMMENT 'Ид. производитель',
  `measur_id` varchar(50) NOT NULL COMMENT 'Ид. ед. измерения',
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Товар';

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `categor_id`, `producer_id`, `measur_id`, `price`) VALUES
(1, 'Молоко Свежайшее', 2, 2, 'л', 2000),
(2, 'Фарш говяжий кошерный', 9, 1, 'кг', 7999),
(3, 'Котлета Сьедобная', 9, 2, 'шт', 500),
(4, 'Котлета Вкусная', 9, 2, 'шт', 600),
(5, 'Сыр Росийский', 8, 2, 'кг', 7000),
(6, 'Сыр Голандский', 8, 1, 'кг', 10000),
(7, 'Свинина Красивая', 3, 2, 'кг', 4500),
(8, 'Домашняя Правильная', 7, 2, 'кг', 2000),
(9, 'Фарш Асорти', 9, 2, 'кг', 5000),
(10, 'Докторская', 5, 1, 'кг', 4500),
(11, 'Молочная', 5, 1, 'кг', 4600),
(12, 'Московская', 10, 1, 'кг', 9600),
(13, 'Московская кошерная', 10, 1, 'кг', 12599),
(14, 'Столичная', 7, 1, 'кг', 8600),
(15, 'Охотничьи сосиски', 6, 1, 'кг', 9500);

-- --------------------------------------------------------

--
-- Структура таблицы `torder`
--

CREATE TABLE IF NOT EXISTS `torder` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL COMMENT 'Ид. покупателя',
  `date` datetime NOT NULL COMMENT 'Дата заказа',
  `status_id` int(11) NOT NULL COMMENT 'Статус заказа'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Заказ';

--
-- Дамп данных таблицы `torder`
--

INSERT INTO `torder` (`id`, `client_id`, `date`, `status_id`) VALUES
(1, 2, '2016-01-01 00:00:00', 3),
(2, 1, '2016-01-05 00:00:00', 3),
(3, 3, '2016-01-05 15:00:00', 3),
(4, 7, '2016-01-01 00:00:00', 4),
(5, 7, '2016-01-11 00:00:00', 3),
(6, 2, '2016-01-10 00:00:00', 3),
(7, 1, '2016-01-21 00:00:00', 2),
(8, 6, '2016-02-01 00:00:00', 2),
(9, 5, '2016-02-03 00:00:00', 1),
(10, 8, '2016-02-05 00:00:00', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categor_id` (`categor_id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`short_name`);

--
-- Индексы таблицы `order_content`
--
ALTER TABLE `order_content`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `price`
--
ALTER TABLE `price`
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categor_id` (`categor_id`),
  ADD KEY `producer_id` (`producer_id`),
  ADD KEY `measur_id` (`measur_id`);

--
-- Индексы таблицы `torder`
--
ALTER TABLE `torder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `torder`
--
ALTER TABLE `torder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`categor_id`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_content`
--
ALTER TABLE `order_content`
  ADD CONSTRAINT `order_content_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`id`),
  ADD CONSTRAINT `order_content_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categor_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`measur_id`) REFERENCES `measurement` (`short_name`);

--
-- Ограничения внешнего ключа таблицы `torder`
--
ALTER TABLE `torder`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
