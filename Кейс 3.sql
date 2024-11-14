CREATE DATABASE Tourism;
USE Tourism;

-- Таблица услуг
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Таблица направлений
CREATE TABLE Destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Таблица туристов
CREATE TABLE Tourists (
    tourist_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20)
);
-- Таблица гостиниц
CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5)
);
-- Таблица заказов туров (переменная информация)
CREATE TABLE TourBookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    tourist_id INT NOT NULL,
    destination_id INT NOT NULL,
    service_id INT NOT NULL,
    hotel_id INT,
    booking_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (tourist_id) REFERENCES Tourists(tourist_id),
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);
Скрипт для ввода данных приведен ниже:
USE Tourism;
-- Вставка записей в таблицу Services (Услуги)
INSERT INTO Services (service_name, description) VALUES
('Экскурсия', 'Организованная экскурсия по историческим местам'),
('Трансфер', 'Трансфер из аэропорта до отеля'),
('Аренда автомобиля', 'Аренда автомобиля на весь период отдыха'),
('Питание', 'Трехразовое питание в отеле'),
('Страховка', 'Страховка для выезда за границу');
-- Вставка записей в таблицу Destinations (Направления)
INSERT INTO Destinations (country, city) VALUES
('Россия', 'Москва'),
('Италия', 'Рим'),
('Франция', 'Париж'),
('Испания', 'Барселона'),
('Египет', 'Каир');
-- Вставка записей в таблицу Tourists (Туристы)
INSERT INTO Tourists (full_name, email, phone_number) VALUES
('Иван Иванов', 'ivanov@example.com', '+79160000001'),
('Ольга Петрова', 'petrova@example.com', '+79160000002'),
('Сергей Смирнов', 'smirnov@example.com', '+79160000003'),
('Анна Кузнецова', 'kuznecova@example.com', '+79160000004'),
('Алексей Федоров', 'fedorov@example.com', '+79160000005');
-- Вставка записей в таблицу Hotels (Гостиницы)
INSERT INTO Hotels (hotel_name, city, rating) VALUES
('Метрополь', 'Москва', 5),
('Гранд Отель', 'Рим', 4),
('Le Meurice', 'Париж', 5),
('Барселона Отель', 'Барселона', 4),
('Нил Отель', 'Каир', 3);
-- Вставка записей в таблицу TourBookings (Заказы туров)
INSERT INTO TourBookings (tourist_id, destination_id, service_id, hotel_id, booking_date, price) VALUES
(1, 1, 1, 1, '2024-01-15', 15000.00),
(2, 2, 2, 2, '2024-02-20', 25000.00),
(3, 3, 3, 3, '2024-03-05', 20000.00),
(4, 4, 4, 4, '2024-04-10', 18000.00),
(5, 5, 5, 5, '2024-05-25', 22000.00);
