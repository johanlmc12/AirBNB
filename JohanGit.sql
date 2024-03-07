CREATE TABLE review (
    id VARCHAR2(50),
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    user_id VARCHAR2(50),
    place_id VARCHAR2(50),
    text VARCHAR2(255)
);

CREATE TABLE "User" (
    id VARCHAR2(50),
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    email VARCHAR2(255),
    password VARCHAR2(255),
    first_name VARCHAR2(100),
    last_name VARCHAR2(100)
);

CREATE TABLE Amenity (
    id VARCHAR2(50),
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    name VARCHAR2(255)
);

CREATE TABLE PlaceAmenity (
    amenity_id VARCHAR2(50),
    place_id VARCHAR2(50)
);

CREATE TABLE State (
    id VARCHAR2(50),
    updated_at TIMESTAMP,
    created_at TIMESTAMP
);

CREATE TABLE City (
    id VARCHAR2(50),
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    state_id VARCHAR2(50),
    name VARCHAR2(255)
);

CREATE TABLE Place (
    id VARCHAR2(50),
    updated_at TIMESTAMP,
    created_at TIMESTAMP,
    user_id VARCHAR2(50),
    name VARCHAR2(255),
    city_id VARCHAR2(50),
    description VARCHAR2(1000),
    number_rooms INTEGER,
    number_bathrooms INTEGER,
    max_guest INTEGER,
    price_by_night NUMBER,
    latitude FLOAT,
    longitude FLOAT
);

ALTER TABLE review
ADD CONSTRAINT review_pk PRIMARY KEY (id);
ALTER TABLE "User"
ADD CONSTRAINT User_pk PRIMARY KEY (id);
ALTER TABLE Amenity
ADD CONSTRAINT Amenity_pk PRIMARY KEY (id);
ALTER TABLE State
ADD CONSTRAINT State_pk PRIMARY KEY (id);
ALTER TABLE City
ADD CONSTRAINT City_pk PRIMARY KEY (id);
ALTER TABLE Place
ADD CONSTRAINT Place_pk PRIMARY KEY (id);

ALTER TABLE review
ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES "User"(id);
ALTER TABLE review
ADD CONSTRAINT fk_place_id FOREIGN KEY (place_id) REFERENCES Place(id);

ALTER TABLE PlaceAmenity
ADD CONSTRAINT fk_amenity_id FOREIGN KEY (amenity_id) REFERENCES Amenity(id);
ALTER TABLE PlaceAmenity
ADD CONSTRAINT fk_place_id FOREIGN KEY (place_id) REFERENCES Place(id);

ALTER TABLE City
ADD CONSTRAINT fk_state_id FOREIGN KEY (state_id) REFERENCES state(id);

ALTER TABLE place
ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES "User"(id);
ALTER TABLE Place
ADD CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES city(id);
