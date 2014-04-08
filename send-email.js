function log(obj) {
    $('#response').text(JSON.stringify(obj));
}



var m = new mandrill.Mandrill();

var params = {
    "message": {
        "from_email":"wndyhsu@gmail.com",
        "to":[{"email":"wndyhsu@gmail.com"}],
        "subject": "Sending a text email from Running Buddy",
        "text": "This is Running Buddy."
    }
};

function sendTheMail() {
    m.messages.send(params, function(res) {
        log(res);
    }, function(err) {
        log(err);
    });
}

