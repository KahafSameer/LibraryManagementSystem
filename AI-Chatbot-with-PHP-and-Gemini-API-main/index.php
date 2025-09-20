<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
 
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div id="chat-container">
       <div id="chat-box"></div>

    <div class="input-container">
      <input type="text" id="user-input" placeholder="Ask about books, authors or library services..." autocomplete="off" />
      <button id="send-btn">Send</button>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script> <!-- for markdown support -->
  <script src="script.js"></script>
</body>
</html>
