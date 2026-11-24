SELECT * FROM public.users;
DROP TABLE users;
CREATE TABLE users (
	ID VARCHAR(100) NOT NULL UNIQUE PRIMARY KEY,
	Password VARCHAR (150) NOT NULL,
	Nickname VARCHAR (200) UNIQUE NOT NULL,
	Email VARCHAR (200) NOT NULL,
	Github_URL VARCHAR (1200),
	Portfolio_URL VARCHAR(1200)
);

CREATE TABLE projects (
	No BIGINT Generated always as identity, 
	ID VARCHAR(100) NOT NULL REFERENCES users(ID),
	Project VARCHAR (360),
	Content VARCHAR (3600) NOT NULL,
	Members INT CHECK (Members >= 0),
	Status INT,
	Period VARCHAR(20),
	WriteTime Timestamp Default Current_Timestamp	
);

drop table projects;

Create Table application (
	ID VARCHAR(100) NOT NULL REFERENCES users(ID),
	Project VARCHAR(360),
	position VARCHAR(360), 
	message VARCHAR(3600),
	status INT,
	applyTime Timestamp Default Current_Timestamp
);

Create Table comments (
	ID VARCHAR(100) NOT NULL REFERENCES users(ID),
	Project VARCHAR(360),
	comment VARCHAR(3600),
	commentTime TImestamp Default Current_Timestamp
);