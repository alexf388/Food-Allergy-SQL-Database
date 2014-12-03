/* delete/update 1 */

DELIMITER $$
CREATE procedure userdelete()
BEGIN

DELETE FROM userallergy 
WHERE User_ID=3;

DELETE FROM userinformation
WHERE User_ID = 3;

END $$

CALL userdelete()



/* delete/update 2 */

DELIMITER $$
CREATE procedure allergymerge()
BEGIN
UPDATE userallergy
SET Allergy_ID = 13
WHERE Allergy_ID = (
SELECT Allergy_ID
FROM allergy
WHERE Allergy_name = 'Tartrazine'
);
UPDATE foodallergy
SET Allergy_ID = 13
WHERE Allergy_ID = 15;
DELETE FROM allergy
WHERE Allergy_ID = 15;
END $$
CALL allergymerge()


/* delete/update 3 */ 

UPDATE sql458619.usermedication 
SET medication_ID=53, doseage = '10ml', doseage_instructions = 'Only when needed'
WHERE medication_ID = 1;