# Intercity Bus Transport Management System

This is a simple MySQL-based project that simulates an intercity bus transport management system. It uses a relational database to manage buses, drivers, routes, stops, schedules, passengers, tickets, and more.

## 🧰 Technologies Used

- MySQL
- MySQL Workbench

## 📂 Files in this Repository

- `schema.sql`: Contains all `CREATE TABLE` statements and sample data inserts.
- `queries.sql`: Contains useful SQL queries to explore and analyze the database.

## 🗂️ Database Structure

The project includes the following tables:

- `buses`: Bus models and capacities.
- `drivers`: Driver details.
- `routes`: From–to city routes.
- `stops`: Intermediate stops on each route.
- `bus_stop_map`: Maps which stops belong to which routes, and their order.
- `schedules`: Schedule info for bus, driver, and route.
- `passengers`: Passenger details.
- `tickets`: Ticket booking info.

## 🧪 Sample Queries Included

- Query to show all passengers and the schedules they've booked tickets for
- Query to show number of tickets booked for each schedule
- Query to list all stops for a specific route (e.g., route_id = 1), in order
- Query to count the number of registered passengers
- Query to show full schedule with bus model, driver name, route, arrival time and departure time

## 📈 Use Case

This project can be used to demonstrate:

- Database design skills
- Query writing ability
- Handling real-world relationships (many-to-many, one-to-many)
- Fake data generation for testing

## 🗃️ How to Run

1. Open MySQL Workbench.
2. Run `schema.sql` to create tables and insert data.
3. Run `queries.sql` to explore the database.

---

✅ **This project is a learning-focused simulation** — great for data architects, backend devs, and students learning relational DBs.

