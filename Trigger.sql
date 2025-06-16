delimiter //
create trigger contrato_vencido
before update on contratos
for each row
begin
    if new.fecha_fin < curdate() then
        set new.estado = 'vencido';
    end if;
end;
//

delimiter ;

update contratos
set fecha_fin = '2025-06-16'
where id_contrato = 3;

select * from contratos;
select * from area;
select * from funcionarios;

select * from contratos where id_contrato = 1;

