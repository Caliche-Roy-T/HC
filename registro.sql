USE `empresa`;
DROP procedure IF EXISTS `Registrar_Contrato`;

DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `Registrar_Contrato` (
	in a_id_funcionario int,
    in a_id_area int,
    in a_fecha_inicio date,
    in a_fecha_fin date)
BEGIN
	insert into contratos(id_funcionario, id_area, fecha_inicio, fecha_fin, estado)
    values(a_id_funcionario, a_id_area, a_fecha_inicio, a_fecha_fin, "activo");
END$$

DELIMITER ;