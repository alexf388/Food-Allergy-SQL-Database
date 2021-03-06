/* person_user_view create */ 
CREATE VIEW `personal_user_view` AS
SELECT * FROM userallergy NATURAL JOIN usermedication

/* food_product_allergy_view create */ 
CREATE VIEW `food_product_allergy_view` AS
SELECT Allergy_ID, foodallergy.food_barcode, food_name, store_ID, store_price, store_location FROM foodallergy NATURAL JOIN foodproduct, foodstore

/* query personal_user_view for User_ID =1  */ 
SELECT * FROM schema.personal_user_view
WHERE User_ID = 1; 

/* query person_user_view create for store_ID = 1, food_barcode=7, store_location = 'Jiuxian'*/ 
SELECT * FROM schema.food_product_allergy_view
WHERE store_ID = 1 AND food_barcode = 7 AND store_location = 'Jiuxian';

/* insert into person_user_view with values(DOES NOT WORK) */ 
INSERT INTO personal_user_view (User_ID, Allergy_ID, Risk, medication_ID, doseage, doseage_instructions) 
VALUES (1, 12, 'Medium', 30, '11ml', 'Monthly'); 

/* insert into food_product_allergy_view with values(DOES NOT WORK) */ 
INSERT INTO food_product_allergy_view(Allergy_ID, food_barcode, food_name, store_ID, store_price, store_location) 
VALUES (1, 1, 'Spicy wings', 2, '9.90', 'Toronto'); 
