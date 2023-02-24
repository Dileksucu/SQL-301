-- STORE PROCEDURE

-- OLUŞTURMUŞ OLDUĞUMUZ SQL KODLARI YORDAMLARLA SAKLAMAK İÇİN KULLANILIR 
-- AVANTAJI : SÜRDÜREBİLİRLİK , HIZ/PERFORMAS AVANTAJ SAĞLAR
--parametre alabilirler , değer döndürebilirler 

-- PROCEDUR YAZIMI :

-- Create Proc Producer_NAME 
-- ( parametre alabilir )
--AS 
-- BEGIN 
--SQL CODE 
-- END 

Create proc ProcedurProducts 
(
@ProductName nvarchar(40)
)
As 
Begin
insert into  Products (ProductName)
values (@ProductName)
End

-- prosedürü oluşturduk 
-- programmability altında olan  store pro. de oluşturur.


--PEKİ STORE PROSEDÜRÜ ÇAĞIRIP NASIL KULLANIYORUZ ?

--İNSERT İŞLEMİ (VERİ EKLEDİK)

EXEC ProcedurProducts 'Dilek'  -- productname için hangideğeri eklicez onu yazdık
exec ProcedurProducts 'Melek'

select * from Products
where ProductName='Dilek' -- Dilek ismini eklemiş 


--UPDATE İŞELMİ (VERİ GÜNCELLEME) 
 
 Create Proc  ProcedureUpdate
 (
 @ProductName nvarchar(40),
 @ProductID int,
 @UnitPrice money 
 )
 AS
 Begin
 
 UPDATE Products 
 Set  ProductName=@ProductName ,UnitPrice=@UnitPrice
 where  ProductID=@ProductID -- ne üzerinden olacak , productID si benim dışarıdan gönderdiğim ProductID olacak

 End


 -- parametreler sırasıyla yazılır : name , ıd ,unıtprice
 EXEC ProcedureUpdate 'melek',1,100
 exec ProcedureUpdate 'Chai',1,100

 select * from Products


-- DELETE İŞLEMİ (VERİ SİLME)

Create proc ProcedureDelete
(
@ProductName nvarchar(40),
@ProductID int
)
As
begin
delete from Products 
where ProductName =@ProductName and  ProductID=@ProductID
end


exec ProcedureDelete 'Melek' ,79
exec ProcedureDelete 'Dilek',78


select * from Products
where ProductName='Melek' -- Dilek , Melek  tablodan silindi













---VİEW YAPISI VE KULLANIM ALANLARI 
 
 -- Viewlar için SANAL TABLOLAR diyebiliriz , içlerinde fiziki olarak veri tutmazlar. (kısaca viewlar tablo gibi davranırlar )
 
 -- Bir ve birden fazla tabloyu bir araya getirmek için kullandığımız  (ÖR:Joinleme işlemi )
 --karışık sorguları bir view haline getirip daha rahat çalıştırmamızı sağlarlar .

 -- TABLOLAR ÜZERİNDE BAZI YERE ERİŞİM SAĞLAMASINI İSTEMİYORUZ YA DA BAZI DATALARI GÖRMESİNİ 
 --SAĞLAMAK İÇİN KULLANILABİLİR VİEW .
 
 -- PERFORMANS AÇISINDAN FAYDA SAĞLAR .


 select CategoryName,ProductName,UnitPrice from Products p inner join Categories c
 on p.CategoryID=c.CategoryID
 order by CategoryName
 -- bu sorgu joinledik , karışık bir sorgu oldu.

 
-- VİEW YAZIMI :
--Create view viewa_verilecek_isim AS  sqlCode

Create View GetProducts 
AS 
select CategoryName,ProductName,UnitPrice from Products p inner join Categories c
on p.CategoryID=c.CategoryID

-- viewlar içiin de ORDER BY yapılamaz .
-- Bu kodu GetProduts adında , view klasörüne kaydeder .


--Ben bu tabloya istek göndericem (viewla oluşturduğumuz sanal tabloya )

select * from GetProducts 
order by ProductName
-- tıpkı tablo gibi çektik , sadece daha karışık sorgularla değil de 
--tabloya takma ad verip onu sanllaştırıp o tabloya istek yolladık .





