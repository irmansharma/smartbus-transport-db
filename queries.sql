-- 1. Query to retrieve all the available buses with their capacity
SELECT * FROM buses;


-- 2. Query to show all routes with origin and destination cities
SELECT * FROM routes;


-- 3. Query to show full schedule with bus model, driver name, route, arrival time and departure time
SELECT s.schedule_id, b.model AS bus_model, d.name AS driver_name, 
       r.origin, r.destination, s.departure_time, s.arrival_time
FROM schedules s
JOIN buses b ON s.bus_id = b.bus_id
JOIN drivers d ON s.driver_id = d.driver_id
JOIN routes r ON s.route_id = r.route_id
ORDER BY s.schedule_id;


-- 4. Query to show all passengers and the schedules they've booked tickets for
SELECT ticket_id, p.name AS passenger_name, r.origin, r.destination, s.departure_time, t.seat_number
FROM tickets t
JOIN passengers p ON t.passenger_id = p.passenger_id
JOIN schedules s ON t.schedule_id = s.schedule_id
JOIN routes r ON s.route_id = r.route_id
ORDER BY p.name;


-- 5. Query to show number of tickets booked for each schedule
SELECT schedule_id, COUNT(*) AS tickets_booked
FROM tickets
GROUP BY schedule_id
ORDER BY tickets_booked DESC;


-- 6. Query to find all passengers with seat numbers who booked a ticket on bus ID 1
SELECT p.name, t.seat_number
FROM tickets t
JOIN passengers p ON t.passenger_id = p.passenger_id
JOIN schedules s ON t.schedule_id = s.schedule_id
WHERE s.bus_id = 1;


-- 7. Query to list all stops for a specific route (e.g., route_id = 1), in order
SELECT s.stop_name, bsm.stop_order
FROM bus_stop_map bsm
JOIN stops s ON bsm.stop_id = s.stop_id
WHERE bsm.route_id = 1
ORDER BY bsm.stop_order;


-- 8. Query to find drivers who have more than one schedule
SELECT d.name, COUNT(*) AS total_schedules
FROM schedules s
JOIN drivers d ON s.driver_id = d.driver_id
GROUP BY d.name
HAVING COUNT(*) > 1;


-- 9. Query to count the number of registered passengers
SELECT COUNT(*) AS total_passengers FROM passengers;


-- 10. Query to show all tickets booked between June 25 and June 26
SELECT t.*, p.name AS passenger_name
FROM tickets t
JOIN passengers p ON t.passenger_id = p.passenger_id
WHERE DATE(booking_time) BETWEEN '2025-06-25' AND '2025-06-26';

