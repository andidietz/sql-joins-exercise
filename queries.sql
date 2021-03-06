-- Join the two tables so that every column and record appears, 
-- regardless of if there is not an owner_id. 
SELECT * 
    FROM owners 
    JOIN vehicles 
    ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. 
-- Display the owners first_name, last_name and count of vehicles.
SELECT first_name, last_name, COUNT(*) 
    FROM owners 
    JOIN vehicles 
    ON owners.id = vehicles.owner_id 
    GROUP BY owners.id 
    ORDER BY first_name;

-- Count the number of cars for each owner and display the average price for 
-- each of the cars as integers. Display the owners first_name, last_name, 
-- average price and count of vehicles. The first_name should be ordered in descending order.
-- Only display results with more than one vehicle and an average price greater than 10000.
SELECT first_name, last_name, AVG(price) AS average_price, COUNT(owners.id) as count 
    FROM owners 
    JOIN vehicles 
    ON owners.id = vehicles.owner_id 
    GROUP BY first_name, last_name 
    HAVING AVG(PRICE) > 10000 AND COUNT(owners.id) > 1 
    ORDER BY first_name DESC;