$(document).ready(function () {
    $('#vehicleForm').on('submit', function (event) {
        event.preventDefault(); // Prevent the form from submitting normally
        
        // Collect form data
        const formData = {
            license_plate: $('#license_plate').val(),
            owner_name: $('#owner_name').val(),
            model: $('#model').val(),
            color: $('#color').val(),
            contact: $('#contact').val(),
        };

        // Send data via POST request to /api/park
        $.ajax({
            url: '/api/park',
            type: 'POST',
            data: formData,
            success: function (response) {
                alert('Vehicle added successfully!');
                console.log(response);
            },
            error: function (xhr, status, error) {
                alert('Error adding vehicle!');
                console.error(error);
            }
        });
    });
});
