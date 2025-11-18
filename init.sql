-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

-- Drop and recreate tables (optional during dev)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    price DECIMAL(10, 2) DEFAULT 0,
    description TEXT
);

INSERT INTO test_table (name, price, description) VALUES
('Blue Acara', 19.99, 'The blue acara (Andinoacara pulcher) is a colorful freshwater fish in the cichlid family.'),
('Bristlenose Pleco', 8.99, 'Fish of this genus are common in the aquarium trade where they are known as bushynose or bristlenose catfish.'),
('Red Cherry Barb', 3.99, 'A small, vibrant schooling fish known for its vivid red coloration and peaceful temperament.'),
('Silver Molly', 3.99, 'Popular livebearer with a shiny silver sheen; thrives in a brackish or freshwater tank.'),
('Neon Rainbowfish', 9.99, 'A peaceful and active fish with iridescent blue and red stripes, great for community tanks.'),
('Lemon Tetra', 5.99, 'The Lemon Tetra is a small, peaceful schooling fish recognized for its translucent yellow body and bright red eyes. When kept in groups, their vibrant yellow coloration intensifies, especially in well-planted aquariums. They are active, social fish that do best in schools of six or more, adding lively movement and color to community tanks.'),
('Kuhli Loach', 5.99, 'The Kuhli Loach is a slender, eel-like freshwater fish known for its peaceful nature and nocturnal activity. They spend much of their time burrowing in soft substrates and are excellent scavengers, helping keep the tank clean. They do best in groups and are ideal for community aquariums with gentle tankmates.');


