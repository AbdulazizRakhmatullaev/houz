// Initialize notification count
let notificationCount = 0;

// Function to update notification count and display it on the bell icon
function updateNotificationCount(count) {
  // Check if the inbox dropdown is active
  const inboxDropdown = document.getElementById('inboxDropdown');
  const isActive = inboxDropdown.classList.contains('active');

  // If inbox dropdown is active, don't display notification count
  if (isActive) {
    return;
  }

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

// Function to format the date according to the specified logic
function formatDateTime(created_at) {
  const createdAtDate = new Date(created_at);

  if (isNaN(createdAtDate.getTime())) {
    return 'Invalid Date';
  }

  const now = new Date();
  const timeDiff = Math.abs(now - createdAtDate) / 1000;

  let formattedDate;

  if (timeDiff < 60) {
    formattedDate = 'now';
  } else if (timeDiff < 3600) {
    formattedDate = `${Math.floor(timeDiff / 60)}m`;
  } else if (timeDiff < 86400) {
    formattedDate = `${Math.floor(timeDiff / 3600)}h`;
  } else if (timeDiff < 172800) {
    formattedDate = 'yesterday';
  } else {
    const options = {
      month: 'long',
      day: 'numeric',
      hour: 'numeric',
      minute: 'numeric',
      hour12: true,
    };
    formattedDate = createdAtDate.toLocaleString('en-US', options);
  }

  return formattedDate;
}

// // Function to update the displayed date every minute
// function updateDateTime() {
//     console.log("Updating datetime...");
//     const notificationDates = document.querySelectorAll(".notdt");
//     notificationDates.forEach(function (element) {
//         const createdAt = element.dataset.createdAt;
//         console.log("createdAt:", createdAt);
//         if (createdAt) {
//             const formattedDate = formatDateTime(createdAt);
//             console.log("formattedDate:", formattedDate);
//             element.textContent = formattedDate;
//         }
//     });
// }

function updateDateTime() {
  // console.log("Updating datetime...");
  const notificationDates = document.querySelectorAll('.notdt');
  notificationDates.forEach(function (element) {
    // Get the original datetime value from data attribute
    const createdAt = element.dataset.createdAt;
    // console.log("createdAt:", createdAt);
    if (createdAt) {
      const formattedDate = formatDateTime(createdAt);
      // console.log("formattedDate:", formattedDate);
      element.textContent = formattedDate;
    }
  });
}

function getCSRFToken() {
  const cookieValue = document.cookie
    .split('; ')
    .find(row => row.startsWith('csrftoken'))
    .split('=')[1];
  return cookieValue;
}

// WebSocket setup
var socket = new WebSocket(
  'ws://' + window.location.host + '/ws/notifications/',
);

// // on socket open
// socket.onopen = function (e) {
//   console.log("Socket successfully connected.");
// };

// // on socket close
// socket.onclose = function (e) {
//   console.log("Socket closed unexpectedly");
// };

// on receiving a message from the WebSocket server
socket.onmessage = function (e) {
  const data = JSON.parse(e.data);

  // Check if the notification is for the current user
  if (data.reciever === currentUser) {
    // Increment notification count
    notificationCount++;

    // Update notification count
    updateNotificationCount(notificationCount);

    // format the created_at
    const formatted_dt = formatDateTime(data.created_at);

    // for CSRF
    const csrfToken = getCSRFToken();

    // Create the notification HTML string using the data
    const notificationHTML = `
        <div class="notcon">
            <div class="notsen-msg">
                <div class="notsender">
                    <a href="/user_profile/${data.sender}/">
                        ${
                          data.avatar_url
                            ? `<img src="${data.avatar_url}" alt="" class="pp">`
                            : `<div class="pp" style="background: linear-gradient(${data.avatar_default});">
                                <div class="grcn">${data.profile_name.charAt(0)}</div>
                            </div>`
                        }
                    </a>
                </div>
                <div class="msgcol">
                    <div class="notsendername">${data.profile_name}</div>
                    <div class="notmsg">
                        <div class="notmsg_ttl">${data.message}</div>
                        ${
                          data.room_host === data.reciever
                            ? `
                        <div class="notroominfo">
                            <div class="not-room-col">Check in: ${data.check_in}</div>
                            <div class="not-room-col">Check out: ${data.check_out}</div>
                        </div>
                        <form action="/room/confirm/${data.notification_id}" method="POST" class="bookform">
                            <input type="hidden" name="csrfmiddlewaretoken" value="${csrfToken}">
                            <button type="submit" name="action" value="confirm" class="btn-2">Confirm</button>
                            <button type="submit" name="action" value="cancel" class="btn-trspt">Cancel</button>
                        </form>
                        `
                            : ``
                        }
                    </div>
                    <div class="notdt_col">
                        <div class="notdt">${formatted_dt}</div>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Append the notification HTML to the container
    const notificationsContainer = document.getElementById('notcol');
    notificationsContainer.insertAdjacentHTML('afterbegin', notificationHTML);

    // Update the timestamp dynamically every minute
    setInterval(function () {
      const notdtElement = document.querySelector('.notdt');
      if (notdtElement) {
        notdtElement.textContent = formatDateTime(data.created_at);
      }
    }, 60000);
  }
};

document.addEventListener('DOMContentLoaded', function () {
  // Your code here
  document.getElementById('inboxDrBtn').addEventListener('click', function () {
    resetNotificationCount();
  });
});

// Call updateDateTime initially
updateDateTime();

// Call updateDateTime every minute
setInterval(updateDateTime, 60000);
