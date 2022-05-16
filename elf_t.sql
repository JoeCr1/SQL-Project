/* 
	Name: elf_t.sql
    Author: Joseph Cryer
    Date: 4/2/2022
    Final Project
*/


SPOOL elf_t.txt

CREATE OR REPLACE
  TYPE elf_t UNDER base_t
  ( /*oid     NUMBER
  , oname   VARCHAR2(30)*/
    name    VARCHAR2(30)
  , genus   VARCHAR2(30)
  , CONSTRUCTOR FUNCTION elf_t
        ( name       VARCHAR2
        , genus      VARCHAR2 DEFAULT 'Elves' ) RETURN SELF AS RESULT
  , OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
  , MEMBER FUNCTION get_genus RETURN VARCHAR2
  , MEMBER PROCEDURE set_genus (genus VARCHAR2)
  , OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 )
  INSTANTIABLE NOT FINAL;
/

SHOW ERRORS

DESC elf_t

CREATE OR REPLACE TYPE BODY elf_t IS
  CONSTRUCTOR FUNCTION elf_t
        ( name      VARCHAR2
        , genus     VARCHAR2 DEFAULT 'Elves' ) RETURN SELF AS RESULT IS
  BEGIN
    self.oid := tolkien_s.CURRVAL-1000;
    self.oname := 'Elf';
    self.name := name;
    self.genus := genus;
    RETURN;
  END elf_t;
 
  OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS
  BEGIN
    RETURN self.name;
  END get_name;

  MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
  BEGIN
    RETURN self.genus;
  END get_genus;

  MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
  BEGIN
    self.genus := genus;
  END set_genus;
  
  OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
  BEGIN
    RETURN (self AS base_t).to_string||'['||self.name||']['||self.genus||']';
  END to_string;
END;
/




