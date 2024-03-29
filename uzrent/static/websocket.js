// Initialize notification count
let notificationCount = 0;

// Function to update notification count and display it on the bell icon
function updateNotificationCount(count) {
    const bellIcon = document.getElementById('inboxDrBtn');
    if (bellIcon) {
        const bellCount = document.createElement('span');
        bellCount.classList.add('notification-count');

        // Limit the count to 9+ if it exceeds 9
        const displayCount = count > 9 ? '9+' : count.toString();

        bellCount.textContent = displayCount;

        // Clear existing count if present
        const existingCount = bellIcon.querySelector('.notification-count');
        if (existingCount) {
            existingCount.remove();
        }

        bellIcon.appendChild(bellCount);

        // Save notification count to local storage
        localStorage.setItem('notificationCount', count);
    }
}

// Function to retrieve notification count from local storage
function retrieveNotificationCount() {
    const savedCount = localStorage.getItem('notificationCount');
    if (savedCount !== null) {
        notificationCount = parseInt(savedCount);
        updateNotificationCount(notificationCount);
    }
}

// Call retrieveNotificationCount when the page loads
window.addEventListener('load', retrieveNotificationCount);

// Function to reset notification count to 0 and remove display
function resetNotificationCount() {
    notificationCount = 0;
    updateNotificationCount(notificationCount);
    // Remove notification count from local storage
    localStorage.removeItem('notificationCount');

    // Remove notification count display from bell icon
    const bellIcon = document.getElementById('inboxDrBtn');
    const existingCount = bellIcon.querySelector('.notification-count');
    if (existingCount) {
        existingCount.remove();
    }
}

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

// on receiving a message from the WebSocket server
socket.onmessage = function (e) {
    const data = JSON.parse(e.data);

    // Check if the notification is for the current user
    if (data.reciever === currentUser) {
        // Increment notification count
        notificationCount++;

        // Update notification count
        updateNotificationCount(notificationCount);

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
    }
};

document.addEventListener('DOMContentLoaded', function () {
    // Your code here
    document.getElementById('inboxDrBtn').addEventListener('click', function () {
        resetNotificationCount();
    });
});