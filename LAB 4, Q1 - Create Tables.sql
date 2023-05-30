CREATE DATABASE E_COMM;
USE E_COMM;

/*Table structure for table category*/
CREATE TABLE IF NOT EXISTS category (
  CAT_ID int,
  CAT_NAME varchar(20) NOT NULL,
  PRIMARY KEY (CAT_ID)
);

/*Table structure for table product*/
CREATE TABLE IF NOT EXISTS product (
  PRO_ID int primary key,
  PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy",
  PRO_DESC varchar(60),
  CAT_ID int,
  foreign key(CAT_ID) references category(CAT_ID)
);

/*Table structure for table supplier*/
CREATE TABLE IF NOT EXISTS supplier (
  SUPP_ID int primary key,
  SUPP_NAME varchar(50) not null,
  SUPP_CITY varchar(50) not null,
  SUPP_PHONE varchar(50) not null
);

/*Table structure for table supplier_pricing*/
CREATE TABLE IF NOT EXISTS supplier_pricing (
  PRICING_ID int primary key,
  PRO_ID int,
  SUPP_ID int,
  SUPP_PRICE int default 0,
  foreign key(PRO_ID) references product(PRO_ID),
   foreign key(SUPP_ID) references supplier(SUPP_ID)
);

/*Table structure for table customer*/
CREATE TABLE IF NOT EXISTS customer (
  CUS_ID int primary key,
  CUS_NAME VARCHAR(20) NOT NULL,
  CUS_PHONE VARCHAR(10) NOT NULL,
  CUS_CITY VARCHAR(30) NOT NULL,
  CUS_GENDER char
);

/*Table structure for table orders*/
/* HERE, THE ORDER_AMOUNT COLUMN IS EXCLUDED SINCE TWO COLUMNS IN THE SAME 
DATABASE WITH SAME VALUES MAY GIVE RISE TO ANONMALIES DUE TO DATA REDUNDANCY 
AND DATA INCONSISTENCTY(we were told to do so in the lab session by the 
lab session instructor)*/ 
/*EXPLANATION : WHEN WE COMPARE THE GIVEN DATA ENTRY VALUES IN ORD_AMOUNT 
COLUMN(ORDER TABLE) WITH THE VALUES IN SUPPLIER_PRICE(SUPPLIER PRICING TABLE) 
COLUMN CORRESPONDING TO THE GIVEN PRICING_ID IN ORDERS TABLE, WE SEE THAT 
BOTH  VALUES ARE THE SAME. SO, FOR THIS USE CASE, I HAVE CONSIDERED 
SUPPLIER_PRICING ONLY.*/
CREATE TABLE IF NOT EXISTS orders (
  ORD_ID int primary key,
  ORD_DATE DATE NOT NULL,
  CUS_ID INT,
  PRICING_ID INT,
  KEY CUS_ID (CUS_ID),
  KEY PRICING_ID (PRICING_ID)
);

/*Table structure for table rating*/
CREATE TABLE IF NOT EXISTS rating (
  RAT_ID INT primary key,
  ORD_ID INT,
  RAT_RATSTARS	INT NOT NULL,
  foreign key(ORD_ID) references orders(ORD_ID)
);






