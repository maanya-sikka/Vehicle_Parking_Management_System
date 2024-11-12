$(document).ready(function () {
    $('#vehicleForm').on('submit', function (event) {
        event.preventDefault(); // Prevent the form from submitting normally
        
        // Collect form data
        const formData = {
            license_plate: $('#license_plate').val()
        };

        // Send data via POST request to /api/park
        $.ajax({
            url: '/api/exited_vehicle',
            type: 'POST',
            data: formData,
            success: function (response) {
                alert('See you soon!');
                console.log(response);
            },
            error: function (xhr, status, error) {
                alert('Error adding vehicle!');
                console.error(error);
            }
        });
    });
});
