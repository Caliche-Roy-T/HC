drop database empresa;
create database empresa;
use empresa;
create table funcionarios (
id_funcionario int auto_increment primary key,
nombre varchar(100),
apellido varchar(100),
correo varchar(100),
telefono varchar(100),
fecha_ingreso date
);

create table area (
id_area int  auto_increment primary key,
nombre_area varchar(100),
salario decimal(10,2)
);

create table contratos (
id_contrato int auto_increment primary key,
id_funcionario int,
id_area int,
fecha_inicio date,
fecha_fin date,
estado varchar(20),
foreign key (id_funcionario) references funcionarios(id_funcionario),
foreign key (id_area) references area(id_area)
);

insert into funcionarios (nombre, apellido, correo, telefono, fecha_ingreso) values
("Carlos", "Gonzalez", "ccgz@hotmail.com", "3211235436", "2023-11-17"),
("Adriana", "Novoa", "adri@hotmail.com", "3123216787", "2020-06-14");

insert into area (nombre_area, salario) values
("desarrollador", 3000.00),
("diseñadora", 1500.00)
;

insert into contratos (id_funcionario, id_area, fecha_inicio, fecha_fin, estado) values
(1, 1, "2023-02-01", "2026-02-01", "activo"),
(2, 2, "2020-04-01", "2026-12-31", "activo");

create view funcionarios_contratos as 
select
	f.id_funcionario,
    f.nombre,
    a.nombre_area,
    c.fecha_inicio,
    c.fecha_fin,
    c.estado
from funcionarios f
join contratos c on f.id_funcionario = c.id_funcionario
join area a on c.id_area = a.id_area;
    
create function calcular_duracion_contrato(fecha_inicio date, fecha_fin date)
returns int
deterministic
return datediff(fecha_fin, fecha_inicio);

select calcular_duracion_contrato("2020-02-01", "2025-06-20") as dias;



    
    