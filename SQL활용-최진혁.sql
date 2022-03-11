-- 1.데이터베이스 생성
create database member_db;
create user member_db@localhost identified by 'member_db';
grant all privileges on member_db.* to member_db@localhost with grant option;
commit;

-- show databases;

-- 2.테이블을 생성
USE member_db;

CREATE TABLE login_info (
  member_num	INTEGER PRIMARY KEY AUTO_INCREMENT,
  member_id	VARCHAR(18) NOT NULL UNIQUE,
  member_pass	VARCHAR(40) NOT NULL
);

-- SELECT * FROM login_info;

-- 3.데이터 삽입
INSERT INTO login_info VALUES(NULL, 'cjh754', 'pw123');
INSERT INTO login_info VALUES(NULL, 'tester01', 'pw01');
INSERT INTO login_info VALUES(NULL, 'tester02', 'pw02');
INSERT INTO login_info VALUES(NULL, 'tester03', 'pw03');
INSERT INTO login_info VALUES(NULL, 'tester04', 'pw04');
INSERT INTO login_info VALUES(NULL, 'tester05', 'pw05');
INSERT INTO login_info VALUES(NULL, 'tester06', 'pw06');
INSERT INTO login_info VALUES(NULL, 'tester07', 'pw07');
INSERT INTO login_info VALUES(NULL, 'tester08', 'pw08');
INSERT INTO login_info VALUES(NULL, 'tester09', 'pw09');

-- 4.데이터 선택
SELECT member_num as '회원번호', member_id as '회원아이디', member_pass as '패스워드' FROM login_info;

-- 5.테이블을 생성
CREATE TABLE notice (
  notice_num	INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  notice_tit	VARCHAR(40) NOT NULL,
  notice_txt	VARCHAR(100),
  notice_date	DATE DEFAULT(CURRENT_DATE),
  user_name		VARCHAR(20),
  user_num		INTEGER NOT NULL
);

-- 6.데이터 삽입
INSERT INTO notice VALUES(NULL, '공지사항01', '공지사항01입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항02', '공지사항02입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항03', '공지사항03입니다.', DEFAULT, '김두한', '2');
INSERT INTO notice VALUES(NULL, '공지사항04', '공지사항04입니다.', DEFAULT, '박말자', '3');
INSERT INTO notice VALUES(NULL, '공지사항05', '공지사항05입니다.', DEFAULT, '김기리', '4');
INSERT INTO notice VALUES(NULL, '공지사항06', '공지사항06입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항07', '공지사항07입니다.', DEFAULT, '신동한', '5');
INSERT INTO notice VALUES(NULL, '공지사항08', '공지사항08입니다.', DEFAULT, '신동한', '5');
INSERT INTO notice VALUES(NULL, '공지사항09', '공지사항09입니다.', DEFAULT, '곽승혁', '6');
INSERT INTO notice VALUES(NULL, '공지사항10', '공지사항10입니다.', DEFAULT, '김민수', '7');
INSERT INTO notice VALUES(NULL, '공지사항11', '공지사항11입니다.', DEFAULT, '홍성호', '8');
INSERT INTO notice VALUES(NULL, '공지사항12', '공지사항12입니다.', DEFAULT, '홍성호', '8');
INSERT INTO notice VALUES(NULL, '공지사항13', '공지사항13입니다.', DEFAULT, '이재경', '9');
INSERT INTO notice VALUES(NULL, '공지사항14', '공지사항14입니다.', DEFAULT, '이재경', '9');
INSERT INTO notice VALUES(NULL, '공지사항15', '공지사항15입니다.', DEFAULT, '이재경', '9');
INSERT INTO notice VALUES(NULL, '공지사항16', '공지사항16입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항17', '공지사항17입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항18', '공지사항18입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항19', '공지사항19입니다.', DEFAULT, '최진혁', '1');
INSERT INTO notice VALUES(NULL, '공지사항20', '공지사항20입니다.', DEFAULT, '최진혁', '1');

-- 7.데이터 선택
select notice_num as '일련번호',
	notice_tit as '제목',
    notice_txt as '내용',
    notice_date as '작성일',
    user_name as '작성자',
    user_num as '회원번호'
    FROM notice ORDER BY notice_date ASC, notice_num DESC;
    
-- 8.함수,조건 사용
SELECT substring(user_name, 1, 1) as '성', concat(count(*), '명') as '인원수' FROM notice WHERE user_name like '김%';

-- 9.데이터 삭제
DELETE FROM notice WHERE notice_tit is null;

-- 10.데이터 변경
UPDATE login_info SET member_pass = 'qwe1234' WHERE member_num = 5;

-- 11.인덱스
CREATE INDEX idx_notice ON notice(notice_tit, user_name);

-- 12.인덱스를 이용한 검색효율성
DROP INDEX idx_notice ON notice;
SELECT notice_tit, user_name FROM notice WHERE notice_tit like '공%' AND user_name like '최%';
CREATE INDEX idx_notice ON notice(notice_tit, user_name);
SELECT notice_tit, user_name FROM notice WHERE notice_tit like '공%' AND user_name like '최%';

-- 13.뷰의 생성
CREATE VIEW my_view AS 
SELECT a.member_id AS '회원아이디', b.notice_tit AS '제목',
	b.notice_txt AS '내용', b.notice_date AS '작성일', b.user_name AS '작성자'
FROM login_info AS a, notice AS b
WHERE a.member_num = b.user_num;

-- SELECT * FROM my_view;

-- 14.뷰의 생성
CREATE VIEW my_view2 AS
SELECT 제목, 작성일, 작성자, 회원아이디
FROM my_view;

-- SELECT * FROM my_view2;

-- 15. database 요소들 삭제
DROP VIEW my_view, my_view2;
DROP INDEX idx_notice ON notice;
DROP TABLE login_info, notice;
DROP USER member_db@localhost;
DROP DATABASE member_db;

-- SHOW DATABASES;