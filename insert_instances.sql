/* 
	Name: insert_instances.sql
    Author: Joseph Cryer
    Date: 4/2/2022
    Final Project
*/


CREATE OR REPLACE PROCEDURE create_man
    ( pv_name VARCHAR2 ) IS
    man MAN_T:= man_t
            ( pv_name
            , 'Men' );
BEGIN 

	INSERT INTO tolkien 
	VALUES 
        ( tolkien_s.NEXTVAL
        , man );
	
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE create_hobbit
    ( pv_name VARCHAR2 ) IS
    hobbit HOBBIT_T:= hobbit_t
            ( pv_name
            , 'Hobbits' );
BEGIN 

	INSERT INTO tolkien 
	VALUES 
        ( tolkien_s.NEXTVAL
        , hobbit);
	
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE create_dwarf
    ( pv_name VARCHAR2 ) IS
    dwarf DWARF_T:= dwarf_t
            ( pv_name
            , 'Dwarves' );
BEGIN 

	INSERT INTO tolkien 
	VALUES 
        ( tolkien_s.NEXTVAL
        , dwarf );
	
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE create_elf
    ( pv_name VARCHAR2
    , pv_elfkind VARCHAR2 ) IS
 
        noldor NOLDOR_T;
        silvan SILVAN_T;
        teleri TELERI_T;
        sindar SINDAR_T;
        
        lv_seq NUMBER := tolkien_s.NEXTVAL;
        lv_elfkind ELF_T;
	
BEGIN 

	IF pv_elfkind = 'Noldor' THEN
		noldor := noldor_t
            ( name => pv_name
            , genus => 'Elves'
            , elfkind => 'Noldor' );
		lv_elfkind := noldor;
	ELSIF pv_elfkind = 'Silvan' THEN 
		silvan := silvan_t
            ( name => pv_name
            , genus =>  'Elves'
            , elfkind => 'Silvan' );
		lv_elfkind := silvan;
	ELSIF pv_elfkind = 'Teleri' THEN 
		teleri := teleri_t
            ( name => pv_name
            , genus => 'Elves'
            , elfkind => 'Teleri' );
		lv_elfkind := teleri;
	ELSIF pv_elfkind = 'Sindar' THEN
		sindar := sindar_t
            ( name => pv_name
            , genus => 'Elves'
            , elfkind => 'Sindar' );
		lv_elfkind := sindar;
	END IF;
	
	INSERT INTO tolkien 
	VALUES 
        ( lv_seq
        , lv_elfkind);
	
	COMMIT;
END;
/

SHOW ERRORS;

CREATE OR REPLACE PROCEDURE create_orc
    (pv_name VARCHAR2) IS
    orc ORC_T:= orc_t
            (pv_name
            , 'Orcs');
	
BEGIN 

	INSERT INTO tolkien 
	VALUES 
        ( tolkien_s.NEXTVAL
        , orc);
	
	COMMIT;
END;
/




