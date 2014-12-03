CREATE TABLE allergy (

Allergy_ID		INT NOT NULL AUTO_INCREMENT,
Allergy_name	VARCHAR(30) NOT NULL,

PRIMARY KEY(Allergy_ID)
);

CREATE TABLE foodproduct (

food_name		VARCHAR(30) NOT NULL,
food_barcode	INT NOT NULL AUTO_INCREMENT,

PRIMARY KEY(food_barcode)

);

CREATE TABLE grocerystore (

store_ID		INT NOT NULL AUTO_INCREMENT,
store_name		VARCHAR(30) NOT NULL,

PRIMARY KEY(store_ID)

);

CREATE TABLE medication (

medication_ID	INT NOT NULL AUTO_INCREMENT,
common_name		VARCHAR(30) NOT NULL,


PRIMARY KEY(medication_ID)
);

CREATE TABLE userinformation (

User_ID				INT NOT NULL AUTO_INCREMENT,
User_password		VARCHAR(30) NOT NULL,
Name_first			VARCHAR(30) NOT NULL,
Name_last			VARCHAR(30) NOT NULL,
Authentication		TINYINT(1) NOT NULL,


PRIMARY KEY(User_ID)

);

CREATE TABLE foodallergy (

Allergy_ID		INT NOT NULL,
food_barcode	INT NOT NULL,

PRIMARY KEY(Allergy_ID, food_barcode),

FOREIGN KEY(Allergy_ID) REFERENCES allergy(Allergy_ID),
FOREIGN KEY(food_barcode) REFERENCES foodproduct(food_barcode)
);

CREATE TABLE userallergy (

User_ID		INT NOT NULL,
Allergy_ID	INT NOT NULL,
Risk		VARCHAR(30),

PRIMARY KEY(User_ID, Allergy_ID),
FOREIGN KEY(User_ID) REFERENCES userinformation(User_ID),
FOREIGN KEY(Allergy_ID) REFERENCES allergy(Allergy_ID)
);

CREATE TABLE usermedication (

User_ID					INT NOT NULL,
medication_ID			INT NOT NULL,
doseage					VARCHAR(30) NOT NULL,
doseage_instructions	VARCHAR(30) NOT NULL,

PRIMARY KEY(User_ID, medication_ID),
FOREIGN KEY(User_ID) REFERENCES userinformation(User_ID),
FOREIGN KEY(medication_ID) REFERENCES medication(medication_ID)
);
CREATE TABLE  foodstore (

food_barcode			INT NOT NULL,
store_ID				INT NOT NULL,
store_price				DOUBLE NOT NULL,
store_location			VARCHAR(30) NOT NULL,

PRIMARY KEY(store_ID, food_barcode),
FOREIGN KEY(food_barcode) REFERENCES foodproduct(food_barcode),
FOREIGN KEY(store_ID) REFERENCES grocerystore(store_ID)
);
