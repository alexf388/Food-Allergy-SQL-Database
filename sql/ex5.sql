/*query 1*/

/*queries the list of users and gets the password of a certain user*/

SELECT User_password

FROM userinformation

WHERE User_ID = 5;


/*query 2*/

/*joins multiple tables and then queries to get all food at a certain store without a certain allergy
the store store name results from a sub query */

SELECT DISTINCT food_name, store_price, store_location

FROM allergy
NATURAL JOIN foodallergy
NATURAL JOIN userallergy
NATURAL JOIN foodproduct
NATURAL JOIN foodstore 
NATURAL JOIN grocerystore
WHERE Allergy_name != 'Treenut'
AND store_name = (
SELECT store_name
FROM grocerystore
WHERE store_ID = 1
)

/*query 3*/

/*joins multiple tables then queries them with a restriction
overall it grabs all the food the user should stay away from if they have the allergy*/

SELECT DISTINCT food_name, store_price, store_location

FROM allergy
NATURAL JOIN foodallergy
NATURAL JOIN  foodproduct
NATURAL JOIN  foodstore
NATURAL JOIN  grocerystore
WHERE Allergy_name = 'Treenut' 


/*query 4*/
/*shows the userid, risk, allergy, medication_ID, common name of medicatino, doseage, doseage instructions of each person with treenut allergy and high risk 
overall it just shows what the medication, doseage, and doseage instructions for each user with a specific allergy and its specific risk */
SELECT DISTINCT User_ID, Risk, Allergy_name, medication_ID, common_name, doseage, doseage_instructions

FROM sql458619.userallergy
NATURAL JOIN sql458619.allergy
NATURAL JOIN sql458619.userinformation
NATURAL JOIN sql458619.usermedication
NATURAL JOIN sql458619.medication
WHERE Allergy_name = 'Treenut'
AND Risk = 'High'; 



/*query 5*/
/*shows the allergies, risk of allergies, and medications a user has and needs for their allergies of a specific user */
SELECT DISTINCT Allergy_name, Risk, medication_ID, common_name, doseage, doseage_instructions

FROM sql458619.userallergy
NATURAL JOIN sql458619.allergy
NATURAL JOIN sql458619.userinformation
NATURAL JOIN sql458619.usermedication
NATURAL JOIN sql458619.medication
WHERE User_ID = '122';


