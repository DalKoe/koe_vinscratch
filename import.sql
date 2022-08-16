
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `seized_pd_vehicles` (
  `id` int(250) NOT NULL,
  `plate` varchar(250) DEFAULT NULL,
  `vehicle_props` longtext DEFAULT NULL,
  `model` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `seized_pd_vehicles`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `seized_pd_vehicles`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

ALTER TABLE `owned_vehicles` 
ADD `vin_scratched` INT(1) NOT NULL DEFAULT '0';

