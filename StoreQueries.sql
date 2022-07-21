use store;

-- Query to show products with customer id
select c.customerID, c.IDtype, s.sellID, sp.quantity, p.productName
	from Customer c 
left join Sell s on
    c.customerID = s.cID
left join Sell_Product sp on
    s.sellID = sp.sID
left join Product p on
	sp.pID = p.productID
where s.state = 1; -- shows with logical deletion

-- query to show suppliers
select p.productName, s.supplierName from Product p
right join Supplier s on 
		s.supplierID = p.supplier; 

