create table BoardTBL(
   board_num int NOT NULL AUTO_INCREMENT, -- 글 번호
   username char(10) not null, -- 작성자 이름
   board_subject varchar(100) not null, -- 글 제목
    price int not null, -- 희망가격
    choice_way int, -- 거래종류 선택 (0 :직  1 :택배)
    product_type char(30), -- 카테고리별 상품 분류
    purchasing_time varchar(50), -- 구입한 시기
    trade_area varchar(100), -- 거래지역 (직거래일 경우만 사용 )
    goods_info varchar(500),  -- 상품정보 
    img varchar(500) , -- 첨부할 사진
    board_date date , -- 글작성 날짜
  	trade_state int,  -- 판매 상황 (1: 판매중, 2: 거래중 ,3 : 판매완료)
    primary key(board_num) -- 기본키
);
--username,board_subject,price,choice_way,purchasing_time,trade_area,goods_info,img,board_date,trade_state
 -- (글번호, 작성자,글제목,희망가격,거래종류선택, 카테고리별 상품 분류, 구입시기, 거래지역, 상품정보, 첨부할 사진, 글작성날짜, 판매상황)


insert into BoardTbl(username, board_subject, price, choice_way, product_type, purchasing_time, trade_area, goods_info, img, board_date, trade_state) values('sora','가방 팝니다!',110000,0,'w-t','2017년 5월','서울','상품설명을 적으세요','1.png','2017-10-3',1);

insert into BoardTbl(username, board_subject, price, choice_way, product_type, purchasing_time, trade_area, goods_info, img, board_date, trade_state)
 values('dahye','물건 ㅍㅍㅍ',80000,0,'w-t','2017년 5월','서울','상품설명을 적으세요','2.png','2017-12-20',1);
 
 insert into BoardTbl(username, board_subject, price, choice_way, product_type, purchasing_time, trade_area, goods_info, img, board_date, trade_state)
 values('jungmin','한번도 사용한적 없는 책팜!!!',45000,0,'w-t','2017년 5월','서울','상품설명을 적으세요','3.png','2017-11-11',1);
 
 insert into BoardTbl(username, board_subject, price, choice_way, product_type, purchasing_time, trade_area, goods_info, img, board_date, trade_state)
 values('juhye','한정판!! 무민머그컵 팜',5000,1,'c-t','2017년 11월','서울','상품설명을 적으세요','4.png','2017-12-3',1);
 
 select*from boardtbl;
 
 update boardtbl set img ="450x3001.png" where username ="dahye";
 update boardtbl set img ="450x3002.png" where username ="jungmin";
 update boardtbl set img ="450x3003.png" where username ="juhye";
 update boardtbl set img ="450x3004.png" where username ="sora";