/* 
	Name: create_tolkien.sql
    Author: Joseph Cryer
    Date: 4/2/2022
    Final Project
*/

SET PAGESIZE 999

SPOOL create_tolkien.txt

DROP TABLE tolkien;

CREATE TABLE tolkien
( tolkien_id NUMBER
, tolkien_character base_t);

DROP SEQUENCE tolkien_s;
CREATE SEQUENCE tolkien_s START WITH 1001;

SPOOL OFF

QUIT