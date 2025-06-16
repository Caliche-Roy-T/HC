delimiter //

create trigger validar_contrato
before insert on contratos
for each row
begin
	declare cantidad int;
    
    select count(*) into cantidad
    from contratos
    where id_funcionario = new.id_funcionario
	  and estado = 'activo';
      
	if cantidad > 0 then
      signal sqlstate '45000'
      set message_text = "El funcionario ya tiene un contrato activo";
	  
	end if;
end;
//

delimiter ;