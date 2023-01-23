use test;
-- написать хранимую функцию, которая принимает данные пользователя
-- создает его (добавляет данные в таблицу) и возвращает средний возраст
-- пользователей, родившихся в тот же год

delimiter $$

create function func4(
user_age int,
user_name varchar(64),
user_bday datetime
)
returns float
deterministic
begin 

	declare avg_age float;--  объявляем переменную

	-- добавляем нового пользователя
	insert into users(age, name, bday)
	values(user_age, user_name, user_bday);
-- 2 часть задания-возвращает средний возраст
-- пользователей, родившихся в тот же год

-- делаем выборку
select avg(age) into avg_age from users
-- условие
where year(user_bday) = year(bday);

-- объявляем переменную после begin в начале

return avg_age;
end $$
-- запускаем в отдельном скрипте


-- Напишите функцию, которая принимает на вход 3 аргумента:
-- employeeId (INTEGER), tipsDate (DATETIME) и tipsAmount (INTEGER).
-- Данная функция должна добавлять новую запись в таблицу tips, а
-- nакже возвращать общую сумму чаевых для данного SQL.работника за
-- весь период времени.
-- Для подсчета суммы по столбцу amount, используйте агрегатную
-- функцию SUM.

delimiter $$

create function func(
employeeId int,
tipsDate datetime,
tipsAmount int
)
returns float
deterministic
begin 

	declare sum_amount int;--  объявляем переменную

	-- добавляем нового пользователя
	insert into tips(employeeId, tipsDate, tipsAmount)
	values(tips_employeeId, tips_Date, tips_Amount);

-- 2 часть задания-возвращать общую сумму чаевых для данного SQL.работника за
-- весь период времени.

-- делаем выборку
select SUM(tipsAmount) into sum_amount from tips
-- условие
where year(tips_Amounty) = year(tipsAmount);

-- объявляем переменную после begin в начале

return sum_amount;
end $$
-- запускаем в отдельном скрипте
-- use test;

-- select func(2, '2012-03-25 10:10:1', '250');
	