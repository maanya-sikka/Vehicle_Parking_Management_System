*********************************************************************************************************
                                        MAANYA SIKKA
*********************************************************************************************************

                                 Vehicle Parking Management System

----------------------------------------------------------------------------------------------------------
                                      Table of Contents
----------------------------------------------------------------------------------------------------------
  1. Project Overview
  2. Features
  3. Technologies Used
  4. Database Schema
  5. Setup Instructions
  6. How to Use
  7. Future Enhancements
  8. Acknowledgments

----------------------------------------------------------------------------------------------------------
                                    Project Overview
----------------------------------------------------------------------------------------------------------
The **Vehicle Parking Management System** is a web-based application designed to manage vehicle parking 
efficiently. This system uses Oracle RDBMS, SQL, PL/SQL, HTML, CSS, and JavaScript to track vehicle 
entries and exits and manage parking slots. The system has two primary options:

- **Entry**: Records the entry of a vehicle, assigns a free parking slot, and marks it as occupied.
- **Exit**: Retrieves a vehicle and empties the assigned parking slot, marking it as available.

----------------------------------------------------------------------------------------------------------
                                         Features
----------------------------------------------------------------------------------------------------------
- **Entry**: Upon entry, the system provides the user with an available parking slot 
                     and marks it as occupied.
- **Exit**: Upon exit, the system frees up the parking slot and marks it as available 
                    for future use.
- **Real-Time Availability**: Displays the available and occupied parking slots in real-time.
- **Parking Slot Management**: The parking slots are managed in a database, with automatic assignment 
                               and retrieval.

----------------------------------------------------------------------------------------------------------
                                     Technologies Used
----------------------------------------------------------------------------------------------------------
- **Database**: Oracle RDBMS
- **SQL**: To query and manage data in the database.
- **PL/SQL**: For writing stored procedures to handle vehicle entry and exit operations.
- **JavaScript**: For the front-end interaction with the database.

----------------------------------------------------------------------------------------------------------
                                     Database Schema
----------------------------------------------------------------------------------------------------------
The system uses the following tables and procedures:

- **Tables**: `PARKING_SLOTS`, `VEHICLES`
- **PL/SQL Procedures**:
    - `exit_vehicle()`: Handles the exit of a vehicle and marks the parking slot as available.
    - `slotnumberassignment()`: Assigns an available parking slot to a new vehicle entry.

----------------------------------------------------------------------------------------------------------
                                    Setup Instructions
----------------------------------------------------------------------------------------------------------
1. Clone the repository:
    ```bash
    git clone https://github.com/maanya-sikka/Vehicle_Parking_Management_System.git
    ```
2. Set up PostgreSQL on your machine.
3. Import the database schema and tables into your database.
4. Configure the PL/SQL procedures for vehicle entry and exit.
5. Set up the front-end interface (HTML/JavaScript) to interact with the database.

----------------------------------------------------------------------------------------------------------
                                      How to Use
----------------------------------------------------------------------------------------------------------
### Entry Process
1. Go to the **Entry** option in the application.
2. Enter vehicle details.
3. The system will assign an available parking slot number and mark it as occupied.

### Exit Process
1. Go to the **Exit** option in the application.
2. Enter the license plate.
3. The system will retrieve the vehicle and mark the parking slot as available.

----------------------------------------------------------------------------------------------------------
                                  Future Enhancements
----------------------------------------------------------------------------------------------------------
- Add parking fee calculations based on duration of parking.
- Implement user authentication for secure access to the system.
- Provide an administrative dashboard to view parking lot status and transaction history.

----------------------------------------------------------------------------------------------------------
                                      Acknowledgments
----------------------------------------------------------------------------------------------------------
- PostgreSQL for the database backend.
