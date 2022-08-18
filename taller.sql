-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2022 a las 21:59:47
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `usuario` varchar(60) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login_attempts`
--

INSERT INTO `login_attempts` (`usuario`, `cantidad`, `fecha`) VALUES
('fabian', 0, '2022-08-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `title` varchar(100) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`title`, `value`, `discount`) VALUES
('$2b$12$.dYXcsrUj6d7w9Dfa2YU/OS5F0wnGpAi.pnWMfMd.WBGa7bn9AL3a', 200, 10),
('$2b$12$.pzHUeLRIaJrvE3qYAw0QullO6Gkmcy.GxbGWKsc5qodyJtRkZbzW', 222, 222),
('$2b$12$.s8kRil4PCiXseicbrgAIepntPQBQvN5QAz4XuG8rycJK4QmZKVXO', 200, 10),
('$2b$12$/Tlw3sWd6rOYDKBEoJsHfuN4CXKiV79MufiCCVFxzTEf4zsCPZf32', 200, 10),
('$2b$12$0gSoOZ.AU6P4Cmy1I28Z2u/xJF0.KqXp35/kAkAQMX7zpb4yjUFwS', 22, 22),
('$2b$12$0kT2gI8UwfjRtt8GQY2udeCcRCaT.rQ3Q040nORAu0kuDpszeQx1S', 200, 10),
('$2b$12$1.IjYojVqcJ3BXakIKzSPOdbBE5sShnbLHnOcvT/c3GDuT55Vop/2', 200, 10),
('$2b$12$2FUzbRbl17AqcXt3mvlTcuisb23aESNb.CJnbNbPNSxFuApeNez5O', 200, 10),
('$2b$12$35U0s8/mKJihpJj9bPQ86Ok2DCadfZYK/xFh62gfzQzMuAYlQzJH.', 200, 10),
('$2b$12$3JLKHBlJLiXOdH3MevMznO4w9SmPbWa.TnlVLEAvcHJYugrJ6iUeS', 200, 10),
('$2b$12$3p9G81Rv9o2XgiLtbwMgEe67AhV13aZbETLMSPM2AfqbI0kQ/xzC6', 343434, 34343),
('$2b$12$51FYvxMKqhgNB4hsFREkbeXnQ5RFkRNsyNLj.1QfJGDNBQ/YNh..G', 200, 10),
('$2b$12$5BmhzDZAfsr8FHaAvGE0.OE4ZKoNXzDVWAtK9BIGzx3.AKCJxOOb6', 200, 10),
('$2b$12$6TgFKPpblpBe35LiwyBwz.WsWz6L3g1wAr.qXgHrcnba7HyjVrSEy', 444, 444),
('$2b$12$71/0nZmLke6Hu3D1fYQ9B.HzzoNwcqmiAKv.8xk7oYbRVnZnkAbiW', 22, 22),
('$2b$12$7KeJFmGWGAjcdTvfIVDRoOs0D.vkf8ltslUIzHj1tVdAGJF4QkDvy', 200, 20),
('$2b$12$7oFNfv0GlvsOSWpPi3GcuOOURCPjhCkwvAipDhzTRwfO/tc9XKREu', 200, 10),
('$2b$12$8dtvhXs4i/iQFR7U74eW0OSY.9zLrDY66k7ZvNlqVyUuPlgmjPZ.K', 22, 22),
('$2b$12$9WJt.REWmM.5Mra6/EzXLuzo5Uu1Pp7ciKg3ouEuodm8qabPiKDEu', 200, 10),
('$2b$12$AH0c7FCkLwFqsq6HkVP/..VZACnh3qg2TiyeJ/uo4g7sPUZGwgnF.', 200, 10),
('$2b$12$CIBfjz/cZ9OC5BBbm9Tyb.8u1R/TjTQgJbM0SRkwXkFDd/zu.1oqG', 200, 10),
('$2b$12$CpakzWO4dg7eQ46XCX.6DOLtA/qWiD66tSpbsggSj2mmHwCKbNUpa', 22, 22),
('$2b$12$dg4ADdzeohm19My7XuHKue7vmBn7Q2xFKhiDEhiSURuGykfU8r1Ye', 200, 10),
('$2b$12$DIM25/0cptWqPh8xuAoqTuvRLIYHJ3J/mr7Ii3g9HnGKXNzw.93y.', 200, 10),
('$2b$12$EFF1MmUuNPWn3V2HaxhOK.N6LwvlL6P.YcHbcXyBLiPs99G2AVZuC', 200, 10),
('$2b$12$Eh3ZSGxoXZ7SWSC/g9ODYuv3QIrdi1ef/ZPwDTvvUTDYI8lna2e4C', 222, 222),
('$2b$12$FIt7WstLjFZiNPTFvZbCROmvkIAI4C7AmrR5on47AUxrncok8VIMO', 222, 222),
('$2b$12$fKwrTAAvnIguNW4RaXv8iuTY5JWk2imZi.G8P9wIQG4wqp3gOXNfa', 200, 10),
('$2b$12$G1F/WHrMzJbiRjs0W4IVxeFNoGVkgPvRAy3tOc5mnTIi66sKy1pAy', 200, 10),
('$2b$12$g3JSFVd7aVgVoZ9ZzHz4Mulsbn.Jz2SzNeneeGZRWXomsJptOag6K', 22, 22),
('$2b$12$G3XZ0gg1t8gbFzicTN0LvOE5aHvfUaTbVfN993HOBic14asYfsb5W', 200, 10),
('$2b$12$H6voQO6U4TF8Qk7pARg.Se0Da6xsI7pl2nb2fZpiDrF2YT2hh6ZcC', 200, 10),
('$2b$12$hQQrmCzaO3x/ADqIFF6jdOOR6e00m3JZ/HlqqoU8c4oz0scFQFNYa', 200, 10),
('$2b$12$hTxNCfAJ5eKhJ9BIp2nrKOTu31Is6YYIJdDngb.bOgoRdDvI4hZMq', 200, 10),
('$2b$12$inz2J8Zp2hg1TtUfdbN9ZeDQkoRsR3LOfeQGuoXCWiwq58fNLD.k2', 200, 10),
('$2b$12$IPpmmVue9yg5xNcjQfLqmORALhmx8qjSzlfFFgedIdctUZHj.Zeqa', 22, 22),
('$2b$12$IVSQYHzTU9UkKtKPau62PuZTe.sxNl2Sq50UlZIq.UOFii85E1Qc6', 222, 222),
('$2b$12$jmTMVL87RtXCK9J1.rEqB.5hfY2I2t.B1y7UoWzN7B41ksFN2G9fa', 222, 2222),
('$2b$12$kIUv0tQorYpG1Wh9oMiVBubPPKM4z75pNbL2/J/YwvYxkX3Xrywze', 200, 10),
('$2b$12$kuRJBDt9HxRiDo.achJbdeLDQWEQBpvPQ5eChn.K692.GkP5vDnam', 222, 2222),
('$2b$12$L9UXX03J4c9yDWEU/oCUL.z7ZhsjkPpsLiydbKTAmWF4kNFaZ3MkK', 22, 22),
('$2b$12$LdUxmaSQEgGHbDY7vYkES.PhTMoNQvwubeW3PUEJ5FNSUeTw8e/D2', 22, 22),
('$2b$12$lqJNPKXoKvn61ew0g6d9eun3rEHBJpv.e7s2sqbui/qBEFJwGDJyy', 200, 10),
('$2b$12$LSIMzV8MQexpFHrxwu2QnOuS6T3AFNji0FImu5MJeVatjlElL72xi', 200, 10),
('$2b$12$MfBxC1l8o7kDx4.koy.pvu/5OPPQ6UugEkjwGvFsFg7OdZgJ0OFUi', 2, 2),
('$2b$12$MMPIu27OHH29Lp/TerAHCOOc6vkat2SmhXtIO1Z1d5JNkALZll1SK', 200, 10),
('$2b$12$MvcPejgHAA.ireFtO7o/neG6G1ss4gv7s1RrG38ZsUMb7.r5VdMMm', 200, 10),
('$2b$12$NIma9SSHINOEd2KmWORxH.KOWhH0FJ5ijp7PeItMrnBiVJGhq3uCe', 200, 10),
('$2b$12$NmVJxua7oz7JTJ.3llzSae1mtYZ6dudpcKMdgmUHNsPCbxgWUyLIK', 200, 10),
('$2b$12$OP1yt7eL69BFT/PdouBwc.eZfTF6bpYDcJOMBlY4brOfD.SygJ9pa', 200, 10),
('$2b$12$plJAXpvTT30G/DUQOwWr9OFB3wRgImCUkxfd.7HC/G3nQthxxQ0JW', 200, 10),
('$2b$12$PXl7bWSbzA8nYHIE86zS9u8BLTQ7Awvo2M3o3iosSONDjivNAZWIu', 22, 22),
('$2b$12$Q.mSqYCrm1inoGMqEQCAM.KgYAXamgp/qmzPt7jV5Qz8eIWEuAeAu', 200, 10),
('$2b$12$q0Z7M57wby54r52aBMO..e7FQDg1ISZQbxfiSsilvU.Z1RiXTgSai', 222, 222),
('$2b$12$qHlSesPkMP5d4TQCJO6oZucAWpaHpqEAx3ssFK27z7advCWxX/AhW', 200, 10),
('$2b$12$qmhYdD8Ao4t0xHWx8pZhqe9tZxGCuFGA30t9X9tpAkokECATWDP1m', 200, 10),
('$2b$12$qqShAHOWqg5NGa4PTzu4CuRae3iO54.4L33txymrYw0t2MivYxlFy', 200, 10),
('$2b$12$QSaaUv5/ehOPyd.qsRJq.uNLinE9XrwuKhEvmvLm2/51.bEcm9OHG', 222, 222),
('$2b$12$qv1gVhHLne305UcjhkIcteAEyTQq5MAuCv.L0sHdEa9hl.y9k3l/C', 200, 10),
('$2b$12$RM242iaG8y8QzRI8vRf0se9zfB15tKQwGXHGHlllbQ0MUcgaaq4oK', 22, 22),
('$2b$12$SB81zfu3gFWHmmHgmap1zeQOWCks9K9cGGLPtZyqU6ljtckC0JuzG', 200, 10),
('$2b$12$SmfgiEnHgAzrO990k8RV1eDjGy4ZO6Cw4Co/.ZpqXkhNoD95nGwUC', 22, 22),
('$2b$12$SO7.6J2PG8tyzgb5XxdonurM.c7vtB5r77tEuOKO3tbfMX/dkDs6e', 22, 22),
('$2b$12$SQjr1bPzVV4SucMsyjA7B.19xNhliFg6GNvKsoRh8HeDyoPkIm2me', 200, 10),
('$2b$12$t1BAZ8jwsr0v0tfJLPz59ukITDSMpvggBwZfxEvLH4C34mzqkYF2a', 200, 10),
('$2b$12$T4ZFpbhzAEWRb7dSTteyxufWL9czSVwZ9OEnvrorvp2vW6YVfSzQq', 22, 22),
('$2b$12$TW0.8qBoSnp4gWSVCrx5i.CWnUr4zgZSddTn1eqIajRwdU8Lmm6Gu', 200, 10),
('$2b$12$U6pCQdyNacmUV31Jf4RhpOHofkdT5UJGW.ojc57t7ME1JlFOfUtgy', 200, 10),
('$2b$12$v9CupowlmIkqxvIW9IIyL.ooWnMi5MRQUkIwA.2Dlpx6t814twrBW', 20, 1),
('$2b$12$WfTfZDOyZX/IvYF6eT5Qi.ZoWkqZcEbaud.ttbc6pMowY/xairkwq', 22, 22),
('$2b$12$wKAR/YlN7jYDJyEcp9Up5.FRJk5XxGSZRbytt0lLng1r.p6Y/FQRq', 200, 10),
('$2b$12$xrwci566LJP.E3wLuFE5FOYgDhdKtQrgSOGWcHE7jyYtz/1VPNzIm', 200, 10),
('$2b$12$Z5.wTuyMdMFVB62qbR4we.dN.gts3zgUGcLDj1TmChgmRo210DFC.', 200, 10),
('pruebainj\'or', 200, 1),
('pruebainjor', 200, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(60) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `password`) VALUES
('agustinm', '$2b$12$mDBJ472E4g0nukmEeCTZLuq9TuQEkHJumxpq2Cv2toHOyi24swItG'),
('fabian', '$2b$12$AJGPQbyto9zLq4vZHnmLc.LB8XdH8TpNjTXHsPJoSn2TrZc0XcEOq'),
('pedrito', '$2b$12$77.zWN9w5CoaFqoMbVcGjeTfnSxPScfUN4kMGibvklyNz5zOY/VeG'),
('pedro', '$2b$12$UukgrAqGE3BnoP9i9zFN9OWxDxFwLmKQMKqFNKHHFQ/sP.3QHlKES');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`title`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
