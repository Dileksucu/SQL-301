-- İNDEX MİMARİSİ 

--  1.index türü : türkçe - inglizce sözlük , bir ingilzce sözlüğün türkçe karşılığını arıyoruz . sıralırdır bellidir hangi harfin nerde olduğu
-- ör : book kelimesini arıcaz , burada book index kelimesidir aslında . Data karşılığı hemen book'un karşındadır "kitap" yazacaktır .

-- 2.index türü: ör , bir biyoloji kitabı düşünün hücreyle ilgili konuyu arıcaksınız 
-- kitabın arkasında index yoksa bütün sayfaları tek tek karıştırmamız gerekir 
-- index varsa kitabın arkasında H olan harfi bulup , Hücre konusunu buluruz

-- ÖR : where name ='engin' -- bu tek tek ara her sayfada

-- İndexler , algoritmaların arkasında B-TREE algoritmasını kullanır.

----------------------------------------------------------------
--B-TREE ALGORİTMASI :

--AĞAÇ YAPISINDA , HİYERARŞİK BİR YAPI KURAR
-- DAHA SONRA KENDİNCE ARALIKLI OLARAK SIRALIYOR 
-- MESELA A-D ,E-F,...,EN SON Y OLAN DATALARI SIRALIYOR 
--VT'NINA SORGU GÖNDERİYORUZ "WHERE NAME ='ZEHRA' " 

-- SORGU YAZILDIĞINDA ,SQL VERİ TABANI TABLODA HİYERARŞİK OLUŞTURULAN AĞAÇ YAPISINA GİDER.
-- İNDEX KULLANILIRSA , 20 MİLYONLAR VERİ OLAN TABLODAN BİLE GERİ DÖNÜŞ ALINIR .


---------------------------------------
-- CLUSTRED İNDEX 
-- Bir tabloda maksimum 1 clustred index olur  
--genelde  bu index türünü ID olan kolona ya da PK olan kolona yerleştiririz 

--TANIM : İNDEX ANAHTARIMIZA GÖRE VERİLERİN FİZKSEL SIRALANDIĞI VE 
--DATANIN İNDEX ANAHTARIYLA AYNI YERDE OLDUĞUĞU İNDEX TÜRÜDÜR . 

--ARAMA YAPTIĞIMIZ DEĞER (İNDEX ANAHTARI) 


--ÖR: Nortwind Db de customerId kısmı clustered , yani indexlenmiş 

-- Aslında , veri fiziksel olarak index anahtarına göre sıralanır 
-- ÖR: veriyi siz tabloda sona ekleseniz , refhresh yapıldığında veri 
-- indexlendiği sayfaya göre konumlandırılır .
-- meseela : engin diye bir customerId ekledim sona , refhresh yaptığım da tabloda baş harfi E olan sayfaya , sıraya geçer 
-- nedeni çünkü o sayfaya indexlenmiştir 


-- Gerçek hayatta neye benzetiriz ? Sözlük , telefon rehberleri gibi örnekler verilebilir 



---------------------------------------------
-- NON-CLUSTRED İNDEX 
-- NOT : BİR TABLODA BİRDEN FAZLA NUN-CLUSTERED İNDEX OLUŞTURULABİLİRSİNİZ . (MAX 1000 TANE NON-CLUSTRED İNDEX KONULABİLİR )

--	ÖR:
-- Herhangi bir konu anlatımlı kitabın sonundaki index bölümünü verebiLiriz.

-- yani veriyi index anahtarına göre sıralama yapılmaz , konuları ihtiyaca göre sıralarız bu index türünde .
-- ÖRNEĞİN, BAŞLANGIÇ KONULARI , ARA KONULAR ... GİBİ SIRALANIR
-- fakat bu konulara hızlıca referans vermek için kitabın arkasına İndex bölümü oluşturursunuz .
-- index bölümün de ilgili başlığın , hangi sayfalarda olduğunun adresini tutarsınız .
--ilgili sayfaya gider o datayı çekersiniz 


-- where koşulu olmayan bir yere index bırakmak doğru değildir .
-- çünkü her bir index vt da yer teşkil eder.
-- index bakımı yapılmadığında vt nında ciddi zafiyetler oluşturur.


-------------------------------------------------------------------------------
--FRAGMENTATİON (parçalanma , bölünme demek ) ----> (index bakımı )

--index bakımı yapılmazsa zamanla verilerimizde ve sorgular da performans sorunu ortaya çıkar .

-- ÖR:
-- Clustered index sayfaları düşünelim ; B harfiyle başlayan müşteri eklenecek sayfa da yer yok .
-- VT'nında yeni bir sayfa oluşturur , o sayfaya B ile başlayan müşteriyi ekler 
-- yer olmayan sayfa da ki verileri alır (bir kısmını ?) , yeni sayfaya B nin altına ekler 
-- ve dolu olan sayfanın bir kısmı boşalır (insertle data taşıdık ) , bu durum da sistem allak bullak olur .
--YUKARIDA ANLATTIĞIM OLAYA FRAGMETİTON DENİR 

--PEKİ ÇÖZÜM :
--İNDEX SAYFALARIMIZ DA ALAN, BOŞLUK BIRAKIYORUZ . (FİLL FACTOR DENİYOR)
-- index sayfası oluştururken , sayfanın %5-10 'unu boşluk bırakmalıyız 
--zamanla o bırakılan boşluk da dolabilir , belli dönemler de indexleri yeniden oluşturmamız gerekiyot.

-- FİLL FACTOR(BOŞLUK) DEĞERİNİ BELİRLERKEN , SİSTEM DE EN ÇOK NE KULLANILDIĞINA BAKILIR 
-- MESELA SELECT KULLANILIYORSA HEP , BOŞLUK BIRAKMAYA GEREK YOK . ÇÜNKÜ VERİ DEĞİŞMİYOR .
-- AMA INSERT - UPDATE - SELECT LER BENZER SEVİDEYSE %10 CİVARI BOŞLUK BIRAKILABİLİR 
-- VERİ DEĞŞİMİ ÇOK OLUYORSA ORTALAMA %20 E KADAR BOŞLUK BIRAKILABİLİR .


 
