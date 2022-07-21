create database if not exists store;

use store;

create table if not exists Customer(
	customerID int not null unique,
    IDtype enum ('CC','CE','TI'),
    
    primary key (customerID)
);

create table if not exists Supplier(
	supplierID int not null auto_increment,
    supplierName varchar(20) not null unique,
    supplierPhone int not null unique,
    
    primary key (supplierID)
);

create table if not exists Product(
	productID int not null auto_increment,
    productName varchar(100) not null unique,
    productCost float not null,
    supplier int not null,
    
    primary key (productID),
    foreign key (supplier) references Supplier(supplierID)
);

create table if not exists Sell(
	sellID int not null auto_increment,
    cID int not null,
    total float,
    
    primary key(sellId),
    foreign key (cID) references Customer(customerID)
);

create table if not exists Sell_Product(
    sID int not null,
	pID int not null,
    quantity int not null,
    
	foreign key(sID) references Sell(sellID),
    foreign key(pID) references Product(productID)
    
);

-- inserting information
insert into Customer (customerID, IDtype) 
values  (123456789,'CC'),
		(987654321,'TI'),
        (456123987,'CC');

insert into Sell (cID) 
values  (123456789),
		(987654321),
        (456123987),
        (987654321),
        (456123987);

insert into Supplier (supplierName, supplierPhone) 
values ('Lacteos',313789456);
		('Carnes',313321654),
		('Fruta',313456789);

insert into Product (productName,productCost,supplier) 
values ('Sausagge',7500, 1),
		('Milk',4200, 1),
        ('chese',5000.5, 1),
        ('Bacon',9500, 2),
        ('Grappes',6500, 3);

insert into Sell_Product (sID, pID,quantity) 
values (1,1,3);
		(1,2,2);
		(2,3,9);
		(3,1,3);
		(3,5,6);
		(3,4,1);

-- show Sells before deletion
select * from Sell;

-- physical deletion
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Sell WHERE cID = 987654321;
SET FOREIGN_KEY_CHECKS=1;

-- logical deletion
ALTER TABLE Sell ADD state boolean default 1;
select * from Sell;
update Sell set state=0 where cID = 456123987;
select * from Sell where state=1;

-- edit products
update Product set productName='Sausage' where productName='Sausagge';
update Product set supplier=2 where supplier=1;

