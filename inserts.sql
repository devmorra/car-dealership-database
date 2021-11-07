insert into inventory
values(
	1,
	5
);

insert into part
values(
	1,
	4000,
	'Engine',
	1,
	'Mitsubishi'
);

insert into inventory
values(
	2,
	20
);

insert into part
values(
	2,
	50,
	'Spark plug',
	2,
	'Mitsubishi'
);

insert into inventory
values(
	3,
	24
);

insert into part
values(
	3,
	50,
	'Tire',
	3,
	'Mitsubishi'
);

select * from inventory;
select * from part;

insert into salesperson
values(
	1,
	'Joe',
	'Shmoe',
	'jshmoe@carplace.com',
	'1 apple st city, state 12345',
	'123-456-7890'
);

insert into salesperson
values(
	2,
	'Jane',
	'Shmane',
	'jshmane@carplace.com',
	'50 pear rd city, state 54321',
	'980-765-4321'
);

select * from salesperson;

create or replace function add_customer(_cust_id integer, _first_name varchar, _last_name varchar, _address varchar, _phone_number varchar)
returns void
as $$
begin
	insert into customer
	values(_cust_id, _first_name, _last_name, _address, _phone_number);
end
$$
language plpgsql;

select add_customer(1, 'Bob', 'The Builder', '5 Build St', '234-568-2384');
select add_customer(2, 'The', 'Count', '123 Ahahah St', '341-588-2948');

select * from customer;

insert into mechanic
values(
	1,
	'Fixxer',
	'Upper',
	'Some place',
	'111-555-1234'
);

insert into mechanic
values(
	2,
	'Repair',
	'Person',
	'Another place',
	'111-551-1234'
);

select * from mechanic;

insert into car
values(
	1,
	'Mitsubishi',
	'Crazy car',
	2021,
	'abc123',
	'new',
	0
);

insert into car
values(
	2,
	'Mitsubishi',
	'Super car',
	2020,
	'123abc',
	'used',
	10000
);

select * from car;

insert into invoice
values(
	1,
	1, -- Bob the builder
	1, -- Joe Shmoe
	1, -- Crazy car
	'10-6-2021',
	50000
);

insert into invoice
values(
	2,
	2, -- The Count
	2, -- Jane Shmane
	2, -- Super car
	'10-12-2021',
	30000
);

select * from invoice;

-- Bob the builder brings their crazy car to be repaired by Repair Person, replacing the tires and getting an oil change

insert into service_ticket
values(
	1, -- ticket num
	2, -- Fixer Upper
	1, -- Bob The Builder
	1, -- Crazy Car
	'11-1-2021',
	'11-1-2021',
	300, -- service price
	200, --looking back, this parts_price is redundant
	500, -- total price
	'{"Oil Change", "Tire Change"}' -- service list
);

-- track the 4 tires that were used in the repair
insert into part_used
values(
	1, -- entry id, maybe not needed?
	3, -- tire upc
	1, -- service ticket id
	4  -- amount of part used
);





-- The Count brings their super car to be repiared by Fixer Upper, who does a tire rotation and replaces the engine and spark plugs (oh no!)

insert into service_ticket
values(
	2, -- ticket num
	1, -- Repair Person
	2, -- The Count
	2, -- Super Car
	'12-4-2021',
	'11-7-2021', -- yes this is in the future
	2000, -- service price
	4050, --looking back, this parts_price is redundant
	6050, -- total price, also redundant
	'{"Engine Replacement", "Tire Rotation", "Spark Plug Replacement"}' -- service list
);

insert into part_used
values(
	2, -- entry id, maybe not needed?
	1, -- engine upc
	2, -- service ticket id
	1  -- amount of part used
);

insert into part_used
values(
	3, -- entry id, maybe not needed?
	2, -- spark plug upc
	2, -- service ticket id
	1  -- amount of part used
);

select * from part_used;
select * from service_ticket;

select * from salesperson;
select * from invoice;
select * from customer;
select * from car;
select * from mechanic;
select * from part;
select * from inventory;