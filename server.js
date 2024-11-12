const express = require('express');
const bodyParser = require('body-parser');
const { Client } = require('pg');  // Importing pg module to interact with PostgreSQL

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public')); // To serve static files (CSS, JS)

// PostgreSQL connection configuration
const dbConfig = {
  user: 'postgres',          
  host: 'localhost',              
  database: 'CarDB',   
  password: 'maanya',      
  port: 5432,                  
};

// Initialize PostgreSQL client
const client = new Client(dbConfig);

// Connect to PostgreSQL database
client.connect()
  .then(() => {
    console.log("Successfully connected to PostgreSQL Database");
  })
  .catch(err => {
    console.error("Error connecting to PostgreSQL: ", err);
  });

// Route to render the main page
app.get('/', (req, res) => {
    res.render('index'); // Render the EJS page (or your HTML page)
});

// Parking a car route
app.post('/park', async (req, res) => {
  const { license_plate, owner_name, model, color, contact } = req.body; // Collecting form data

  console.log("Attempting to park vehicle with license plate:", license_plate); // Debug log

  try {
    // Insert vehicle into the Vehicles table in PostgreSQL
    const query = `
      Select "CarParkingSchema".slotNumberAssignment($1, $2, $3, $4, $5) AS result;
   
    `;
     //INSERT INTO "CarParkingSchema"."Vehicles" (license_plate, owner_name, model, color, contact)

    const values = [license_plate, owner_name, model, color, contact];
    
    // Execute the query
    const result = await client.query(query, values);

    const message = result.rows[0].result;

    if(message=="NO SLOTS AVAILABLE"){
      res.send("Sorry! " + message);
  }else
  {
    res.send("Vehicle added successfully! - "+ message);
  }
  } catch (err) {
    console.log("Error adding vehicle:", err);
    res.send("Error adding vehicle: " + err.message); // Send back the error message
  }
});

// Route to view all available slots (adjusting for PostgreSQL query)
app.get('/available-slots', async (req, res) => {
  try {
    const result = await client.query(
      `SELECT slot_number FROM "CarParkingSchema"."parking_slots" WHERE status = 'AVAILABLE'`
    );

    res.render('available_slots', { slots: result.rows });
  } catch (err) {
    console.error("Error retrieving available slots:", err);
    res.send("Error retrieving available slots: " + err.message);
  }
});

app.post('/exited_vehicle', async (req, res) => {
  const { license_plate} = req.body; // Collecting form data

  console.log("Attempting to exit vehicle with license plate:", license_plate); // Debug log

  try {
    // Insert vehicle into the Vehicles table in PostgreSQL
    const query = `
   
    Select "CarParkingSchema".exit_vehicle($1) AS result;
    `;

    const values = [license_plate];
    
    // Execute the query
    const result = await client.query(query, values);

    const message = result.rows[0].result;

    if(message=="Vehicle not present"){
      res.send("Sorry! " + message);
  }else
  {
    res.send("Thankyou! "+ message);
  }
  } catch (err) {
    console.log("Error adding vehicle:", err);
    res.send("Error adding vehicle: " + err.message); // Send back the error message
  }
});


// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

