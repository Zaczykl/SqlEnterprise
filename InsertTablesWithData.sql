INSERT INTO Clients(FirstName,LastName,City,PhoneNumber,Email)
VALUES ('�ukasz','Zaczyk','Katowice','555666777','lukzac@gmail.com')

INSERT INTO Clients(FirstName,LastName,City,PhoneNumber,Email)
VALUES ('Janusz','Kowalski','Wroc�aw','555666778','januszKow@gmail.com')

INSERT INTO Clients(FirstName,LastName,City,PhoneNumber,Email)
VALUES('Piotr','Nowak','Tychy','555666888','piotrnowak@gmail.com')

SELECT *
FROM Clients

INSERT INTO Products (Name,Price)
VALUES('Chleb',50)

INSERT INTO Products (Name,Price)
VALUES ('Mas�o',4.65)

INSERT INTO Products (Name,Price)
VALUES ('Ser',12.99)

SELECT *
FROM Products

INSERT INTO Invoices (Number,ClientNumber,CreatedDate)
VALUES ('100',1,'2021-10-26')

INSERT INTO Invoices (Number,ClientNumber,CreatedDate)
VALUES ('101',2,'2021-11-03')

INSERT INTO Invoices (Number,ClientNumber,CreatedDate)
VALUES ('102',3,'2021-12-01')

SELECT *
FROM Invoices

INSERT INTO InvoicePositions (InvoiceId,ProductId,Quantity)
VALUES(1,1,20)

INSERT INTO InvoicePositions (InvoiceId,ProductId,Quantity)
VALUES(1,3,3)

INSERT INTO InvoicePositions (InvoiceId,ProductId,Quantity)
VALUES(2,2,20)

INSERT INTO InvoicePositions (InvoiceId,ProductId,Quantity)
VALUES(2,1,1)

INSERT INTO InvoicePositions (InvoiceId,ProductId,Quantity)
VALUES(3,3,1)

INSERT INTO InvoicePositions (InvoiceId,ProductId,Quantity)
VALUES(3,3,1)

SELECT *
FROM InvoicePositions

--Wy�wietl numer faktury, imi� i nazwisko klienta.
SELECT Number AS [Numer Faktury],c.FirstName AS Imi�,c.LastName AS Nazwisko
FROM Invoices i
INNER JOIN Clients c ON i.ClientNumber=c.Id

---Wy�wietl wszystkie pozycje z numerem faktury, nazw� produktu oraz cen�.
SELECT i.Number AS [Numer faktury],p.Name AS [Nazwa produktu],p.Price AS 'Cena'
FROM InvoicePositions ip
INNER JOIN Invoices i ON ip.InvoiceId=i.Id
INNER JOIN Products p ON ip.ProductId=p.Id



--Wy�wietl numery faktur wraz z sum� ilo�ci produkt�w (wszystkie sztuki) na tej fakturze.
SELECT Number AS [Numer faktury],SUM(ip.Quantity) AS [Wszystkie sztuki]
FROM Invoices i
INNER JOIN InvoicePositions ip ON i.Id=ip.InvoiceId
INNER JOIN Products p ON ip.ProductId=p.Id
GROUP BY i.Number


--Wy�wietl numery faktur wraz z cen� ca�kowit�.
SELECT Number AS [Numer faktury],SUM(ip.Quantity*p.Price) AS [Warto�� faktury],'z�'AS 'Waluta'
FROM Invoices i
INNER JOIN InvoicePositions ip ON i.Id=ip.InvoiceId
INNER JOIN Products p ON ip.ProductId=p.Id
GROUP BY i.Number


