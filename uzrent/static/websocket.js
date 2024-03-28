// WebSocket setup
var socket = new WebSocket('ws://' + window.location.host + '/ws/notifications/');

// on socket open
socket.onopen = function (e) {
    console.log('Socket successfully connected.');
};

// on socket close
socket.onclose = function (e) {
    console.log('Socket closed unexpectedly');
};

// socket.onmessage = function (e) {
//     const data = JSON.parse(e.data);
//     const notificationHTML = data.html_content;

//     console.log(data);
//     console.log(notificationHTML);

//     const notificationsContainer = document.getElementById('notcol');
//     notificationsContainer.insertAdjacentHTML('afterbegin', notificationHTML);
// };

socket.onmessage = function (e) {
    const data = JSON.parse(e.data);

    // Create the notification HTML string using the data
    const notificationHTML = `
        <div class="notcon">
            <div class="notsen-msg">
                <div class="notsender">
                    <a href="/user_profile/${data.sender}/">
                        ${data.avatar_url ? `<img src="${data.avatar_url}" alt="" class="pp">` :
            `<div class="pp" style="background: linear-gradient(${data.avatar_default});">
                                <div class="grcn">${data.profile_name.charAt(0)}</div>
                            </div>`
        }
                    </a>
                </div>
                <div class="msgcol">
                    <div class="notsendername">${data.profile_name}</div>
                    ${data.room_host === data.reciever ? `
                        <div class="notmsg">
                            <div class="notmsg_ttl">${data.message}</div>
                            <div class="notroominfo">
                                <div class="not-room-col">Check in: ${data.check_in}</div>
                                <div class="not-room-col">Check out: ${data.check_out}</div>
                            </div>
                        </div>
                        <form action="/confirm_room/${data.notification_id}/" method="POST" class="bookform">
                            <input type="hidden" name="csrfmiddlewaretoken" value="your_csrf_token_here">
                            <button type="submit" name="action" value="confirm" class="btn-2">Confirm</button>
                            <button type="submit" name="action" value="cancel" class="btn-trspt">Cancel</button>
                        </form>
                        <div class="notdt">${data.created_at}</div>
                    ` : `
                        <div class="notmsg">${data.message}</div>
                        <div class="notdt">${data.created_at}</div>
                    `}
                </div>
            </div>
        </div>
    `;

    // Append the notification HTML to the container
    const notificationsContainer = document.getElementById('notcol');
    notificationsContainer.insertAdjacentHTML('afterbegin', notificationHTML);

    // getting object of count
    count = document.getElementById('bellCount').getAttribute('data-count');
    document.getElementById('bellCount').setAttribute('data-count', parseInt(count) + 1);
};
