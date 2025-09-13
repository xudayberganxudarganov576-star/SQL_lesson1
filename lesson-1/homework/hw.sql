--1) Define the following terms: data, database, relational database, and table.
--Tushuncha	Qisqacha tarif
--Malumot (Data)	Hali qayta ishlanmagan faktlar yoki raqamlar.
--Malumotlar bazasi	Malumotlarni tartibli saqlash va boshqarish tizimi.
--Relatsion malumotlar bazasi	Malumotlarni jadvallar shaklida saqlaydigan va ular ortasida boglanish mavjud bolgan baza.
--Jadval (Table)	Qator (yozuv) va ustunlardan (maydon) tashkil topgan malumotlar tuzilmasi.
--2)List five key features of SQL Server
--Xususiyat nomi	Tavsifi (Ozbek tilida)
--1	Yuqori mavjudlik va avariyadan tiklanish (HADR)	Doimiy ishlash va malumotlarni yoqotmaslik uchun Always On Availability Groups, Failover Clustering va boshqa vositalar.
--2	Xavfsizlik va muvofiqlik	Malumotlarni himoya qilish uchun Transparent Data Encryption, Always Encrypted, Row-Level Security va Auditing.
--3	Ishlash tezligini optimallashtirish	In-Memory OLTP, Query Store, Columnstore Indexlar va aqlli sorovlarni qayta ishlash orqali tezlikni oshirish.
--4	Integratsiya xizmatlari (SSIS)	Turli manbalardan malumotlarni olish, ozgartirish va yuklash jarayonlarini boshqarish imkoniyati.
--5	Masshtablanuvchanlik va bulut integratsiyasi	Kichikdan yirikgacha loyihalarni qollab-quvvatlash va Microsoft Azure bulut platformasi bilan integratsiya.
--3)What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
--Windows autentifikatsiyasi
--Foydalanuvchi Windows tizimidagi hisob ma’lumotlari (foydalanuvchi nomi va parol) orqali tizimga kiradi. Bu rejimda SQL Server foydalanuvchini Windows xavfsizlik tizimi yordamida tekshiradi.

--SQL Server autentifikatsiyasi
--SQL Server uchun maxsus yaratilgan foydalanuvchi nomi va parol orqali ulanish amalga oshiriladi. Bu rejim Windows domenidan tashqaridagi foydalanuvchilar uchun qulay.
--2)Describe the differences between SQL Server, SSMS, and SQL.
--SQL Server ma’lumotlarni saqlovchi va boshqaruvchi dastur.

--SSMS – SQL Server’ni boshqarish uchun dasturiy interfeys.

--SQL – ma’lumotlar bazasi bilan ishlash uchun so‘rov tili.
--3)DQL (SELECT) – Ma’lumotlarni so‘rov qilish uchun ishlatiladi, faqat o‘qish imkonini beradi.

--DML (INSERT, UPDATE, DELETE) – Ma’lumotlarni yaratish, yangilash va o‘chirish uchun.

--DDL (CREATE, ALTER, DROP) – Ma’lumotlar bazasi ob’yektlarini (jadval, indeks va boshqalar) yaratish va o‘zgartirish uchun.

--DCL (GRANT, REVOKE) – Foydalanuvchi huquqlarini berish yoki olib qo‘yish uchun.

--TCL (COMMIT, ROLLBACK) – Ma’lumotlar bazasida tranzaksiyalarni boshqarish uchun.
Create table student(studentID int primary key,Name varcher(50),Age int)

(1,'Ali', 'Valiyev', 20, 85),
(2,'Nilufar', 'Karimova', 22, 90),
(3,'Jasur', 'Toshmatov', 19, 88);
