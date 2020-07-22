create database testDB;

use testDB;

create table testTable (
id varchar(20),
name varchar(20)
);

create procedure testProc
as
begin
insert into testTable values('test', 'test1');
select 'abc' as response;
end;