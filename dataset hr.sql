create database hr_data;
use hr_data;

create table office(
officeID int not null primary key,
addres text not null,
city varchar(50) not null,
state varchar(50) not null
);

insert into office values
(001,"Jalan Diponegoro", "Surabaya", "Indonesia"),
(002, "Jalan", "Surabaya", "Indonesia"),
(003,"Jalan Kedung Baruk","Surabaya","Indonesia"),
(004,"Jalan HR. Muhammad","Surabaya","Indonesia"),
(005,"Jalan Cerme","Gresik","Indonesia"),
(006,"Jalan Buduran","Sidoarjo","Indonesia"),
(007,"Jalan Wadung Asri","Sidoarjo","Indonesia"),
(008,"Jalan Wahidin","Gresik","Indonesia"),
(009,"Jalan Pucang Anom","Surabaya","Indonesia"),
(010,"Jalan Boboh","Gresik","Indonesia"),
(011,"Jalan Prambon","Gresik","Indonesia"),
(012,"Jalan Porong","Sidoarjo","Indonesia"),
(013,"Jalan Asemrowo","Surabaya","Indonesia"),
(014,"Jalan Sawahan","Gresik","Indonesia"),
(015,"Jalan Ahmad Yani","Surabaya","Indonesia");

insert into office values
(016,"Jalan Wonokromo","Surabaya","Indonesia"),
(017,"Jalan Kepatihan","Gresik","Surabaya"),
(018,"Jalan Ahmad Yani","Surabaya","Indonesia");

create table employee(
employeeID int not null primary key,
name varchar(70) not null,
job_title varchar(55) not null,
salary int not null,
officeID int not null,
key fk_emp_officeID (officeID),
key fk_emp_employeeID (reports),
constraint fk_emp_office foreign key (officeID) references office (officeID)
);

insert into employee values
(10111,"Lily Irawan","Editor",5500000,001),
(10212,"Wisnu Prayuda","Editor",5500000,002),
(20311,"Tirta Purnomi","Staf Administrasi",4700000,003),
(20412,"Salsabila","Staf Administrasi",4700000,004),
(20513,"Hilda Anggara","Staf Administrasi",4700000,005),
(30611,"Kila Khoirina","Staf HR",49000000,006),
(40711,"Aldi Muhammad","Staf Gudang",4500000,007),
(40812,"Hendra Pramono","Staf Gudang",45000000,008),
(50911,"Melinda Suprowo","Baker",5000000,008),
(51012,"Kesha Elmono","Baker",5000000,010),
(61111,"Ikrom Yudoyono","Barista",4600000,011),
(61212,"Hadi Wirawan","Barista",4600000,012),
(71311,"Arniawati","Staf Kasir",4500000,013),
(71412,"Salam Qonitatun","Staf Kasir",4500000,013),
(81511,"Joko Sunarto","Cleaner",4450000,014),
(81612,"Salsa Berliana","Cleaner",4450000,015),
(91711,"Ami Hidayat","Pelayan",4450000,017),
(91812,"Mega Gundono","Pelayan",4450000,018);

-- Memperbarui kesalahan input
update employee set salary = 4500000 where name="Hendra Pramono";
update employee set salary = 4900000 where name="Kila Khoirina";

update employee set officeID=009 where name="Melinda Suprowo";
update employee set officeID=0014 where name="Salam Qonitatun";

update office set addres="Jalan Wonocolo" where officeID=002;

-- Menampilkan nama pegawai dan gaji di mana gaji > 4.650.000 (diurutkan dari yang terkecil)
select name,salary from employee
where salary>=4650000
order by salary asc;

-- Menampilkan nama pegawai yang berasal dari kota Surabaya
select employee.name,office.city from employee join office on employee.officeID=office.officeID
where city="Surabaya"
order by name asc;

-- Menampilkan jumlah pegawai dari Surabaya
select city, count(*) as jml_pegawai from office
where city="Surabaya" ;

-- Menampilkan jumlah pegawai dari Surabaya dan Gresik
select city, count(*) as jml_pegawai from office
where city in ("Surabaya","Gresik")
group by city;

-- Menampilkan jumlah pegawai dari setiap kota
select city, count(*) as jml_pegawai from office
group by city;

-- Menampilkan jumlah budget untuk gaji pegawai
select sum(salary) as jml_gaji from employee
where salary>4000000;

-- Menampilkan informasi pegawai dengan office id 1,5,9,13,14
(select * from employee limit 1 offset 0)
union
(select * from employee limit 1 offset 4)
union
(select * from employee limit 1 offset 8)
union
(select * from employee limit 1 offset 12)
union
(select * from employee limit 1 offset 13);

select*from office;
select* from employee;

