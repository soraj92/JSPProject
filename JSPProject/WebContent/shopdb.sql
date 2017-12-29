create table TotalTable(
   board_num int NOT NULL AUTO_INCREMENT, -- 글 번호
   username char(10) not null, -- 작성자 이름
   board_subject varchar(100) not null, -- 글 제목
    price int not null, -- 희망가격
    choice_way int, -- 거래종류 선택
    product_type char(30), -- 카테고리별 상품 분류
    purchasing_time varchar(50), -- 구입한 시기
    trade_area varchar(100), -- 거래지역 (직거래일 경우만 사용 )
    goods_info varchar(500),  -- 상품정보 
    img varchar(500) , -- 첨부할 사진
    board_date date , -- 글작성 날짜
    board_count int , -- 조회수 
    primary key(board_num)
);


insert into testTable values(0,'테스트입니다',10000,0,'2017년 5월','','상품설명을 적으세요','1.png');
insert into testTable values(0,'2번째 테스트입니다',10000,1,'2017년 9월','','상품설명을 적으세요','1.png');