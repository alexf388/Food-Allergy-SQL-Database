/*insert 1*/

USE user;

INSERT INTO userinformation 
	( User_ID, User_password, Name_first, Name_last, Authentication) 
		VALUES 
			(1, 'admin', 'Alex', 'Fung', 0);
			
			
/*insert 2*/

USE user;

INSERT INTO userallergy
	(User_ID, Allergy_ID, Risk)
	SELECT userinformation.User_ID, allergy.Allergy_ID, 'High'
    FROM userinformation, allergy
    WHERE userinformation.User_ID = 1 AND allergy.Allergy_ID = 4;
	
	
	
			

/*insert 3*/

USE user;

INSERT INTO userallergy (User_ID, Allergy_ID)
SELECT User_ID, Allergy_ID FROM userinformation, allergy
		WHERE Allergy_ID = ROUND((RAND() * (15-1))+1)
		
		

		
/*insert 4*/

DELIMITER $$
CREATE procedure monkey()
BEGIN

DECLARE i INT DEFAULT 0;
DECLARE W INT DEFAULT 0;
DECLARE S INT DEFAULT 0;
DECLARE R VARCHAR(30);

	WHILE i < 2000 DO 
    
    SET W = ROUND((RAND() * (3-1))+1);
    SET S = ROUND((RAND() * (15-1))+1);
    
    IF W = 1 THEN
    
    SET R = 'LOW';
    
    ELSEIF W = 2 then
    
    SET R = 'MEDIUM';
    
    ELSE
    
    SET R = 'HIGH';
    
    END IF;
	
    INSERT INTO userallergy 
	( User_ID, Allergy_ID, Risk) 
		SELECT userinformation.User_ID, allergy.Allergy_ID, R
    FROM userinformation, allergy
    WHERE userinformation.User_ID = i AND allergy.Allergy_ID = S;
            
	SET i = i + 1;

	END WHILE;

END $$

CALL monkey()