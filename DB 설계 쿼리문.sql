
CREATE TABLE CUSTOMER
(CUSTOMERID VARCHAR2(10) PRIMARY KEY,
CUSTOMERPWD VARCHAR2(15),
CUSTOMERNAME VARCHAR2(15),
CUSTOMEREMAIL VARCHAR2(30),
CUSTOMERTEL VARCHAR2(11),
CUSTOMERZIPCODE VARCHAR2(6),
CUSTOMERADDR VARCHAR2(100),
CUSTOMERCREATED DATE,
CUSTOMERYEAR VARCHAR2(4),
CUSTOMERMONTH VARCHAR2(2),
CUSTOMERDAY VARCHAR2(2));

CREATE TABLE QNA
(QNANUM NUMBER(6) PRIMARY KEY,
QNATITLE VARCHAR2(50),
QNACONTENT VARCHAR2(300),
CUSTOMERID VARCHAR2(15),
QNACREATED DATE,
QNAANSWER VARCHAR2(5),
QNAHITCOUNT NUMBER(5),
CONSTRAINT CHK_QNA CHECK (QNAANSWER IN('TRUE','FALSE')),
CONSTRAINT QNA_CUSTOMER_ID FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID));

CREATE TABLE ITEM
(ITEMNUM NUMBER(8) PRIMARY KEY,
ITEMNAME VARCHAR2(50),
ITEMCOUNT NUMBER(5),
ITEMPRICE NUMBER(10),
ITEMDISCOUNT NUMBER(10),
ITEMTYPE VARCHAR2(20),
ITEMCONTENT VARCHAR2(50),
ITEMIMAGE1 VARCHAR2(50),
ITEMIMAGE2 VARCHAR2(50),
ITEMIMAGE3 VARCHAR2(50),
ITEMIMAGE4 VARCHAR2(50),
ITEMSTOCK NUMBER(5),
ITEMHITCOUNT NUMBER(5));

CREATE TABLE CART
(CARTNUM NUMBER(10) PRIMARY KEY,
CUSTOMERID VARCHAR2(10),
ITEMNUM NUMBER(8),
ITEMPRICE NUMBER(10),
CARTITEMCOUNT NUMBER(10),
CARTTOTPRICE NUMBER(10),
CONSTRAINT CART_ITEM_NUM FOREIGN KEY(ITEMNUM) REFERENCES ITEM(ITEMNUM),
CONSTRAINT CART_CUSTOMER_ID FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID));


CREATE TABLE REVIEW
(CUSTOMERID VARCHAR2(10), 
REVIEWTITLE VARCHAR2(50),
REVIEWCONTENT VARCHAR2(300),
REVIEWNUM NUMBER(10) PRIMARY KEY,
REVIEWCREATED DATE,
REVIEWIMAGE VARCHAR(50),
ITEMNUM NUMBER(8),
REVIEWLIKE NUMBER(5),
CONSTRAINT REVIEW_ITEM_NUM FOREIGN KEY(ITEMNUM) REFERENCES ITEM(ITEMNUM),
CONSTRAINT REVIEW_CUSTOMER_ID FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID));

CREATE TABLE NOTICE
(NOTICENUM NUMBER(5) PRIMARY KEY,
NOTICETITLE VARCHAR2(50),
NOTICECREATED DATE,
NOTICECONTENT VARCHAR2(600),
NOTICEHITCOUNT NUMBER(5),
NOTICEIMAGE VARCHAR2(50)
searchkey varchar2(30));

CREATE TABLE REPLY
(REPLYNUM NUMBER(6) PRIMARY KEY,
CUSTOMERID VARCHAR2(10),
REPLYCONTENT VARCHAR2(300),
QNANUM NUMBER(6),
REPLYCREATED DATE,
CONSTRAINT REPLY_QNA_NUM FOREIGN KEY(QNANUM) REFERENCES QNA(QNANUM),
CONSTRAINT REPLY_CUSTOMER_ID FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID));

CREATE TABLE CUSTOMERORDER
(ORDERNUM NUMBER(6) PRIMARY KEY,
CUSTOMERID VARCHAR2(10),
CARTNUM NUMBER(10),
ITEMNUM NUMBER(8),
CUSTOMERORDERNAME VARCHAR2(15),
CUSTOMERORDERZIPCODE VARCHAR2(6),
CUSTOMERORDERADDR1 VARCHAR2(100),
CUSTOMERORDERADDR2 VARCHAR2(100),
CUSTOMERMEMO VARCHAR2(60),
CUSTOMERORDERTEL VARCHAR2(11),
CUSTOMERORDERPAY VARCHAR2(10),
CONSTRAINT ORDER_CART_NUM FOREIGN KEY(CARTNUM) REFERENCES CART(CARTNUM),
CONSTRAINT ORDER_ITEM_NUM FOREIGN KEY(ITEMNUM) REFERENCES ITEM(ITEMNUM),
CONSTRAINT ORDER_CUSTOMER_ID FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID));


 
