document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("user-input");
  const sendBtn = document.getElementById("send-btn");

  input.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      sendMessage();
    }
  });

  sendBtn.addEventListener("click", sendMessage);
});

function sendMessage() {
  const userInputElem = document.getElementById("user-input");
  const userInput = userInputElem.value.trim();
  const chatBox = document.getElementById("chat-box");

  if (userInput === "") return;

  // User Message
  const userMessage = document.createElement("div");
  userMessage.className = "user-message";
  userMessage.textContent = userInput;
  chatBox.appendChild(userMessage);

  // Loading placeholder
  const loadingMessage = document.createElement("div");
  loadingMessage.className = "bot-message";
  loadingMessage.textContent = "Typing...";
  chatBox.appendChild(loadingMessage);
  chatBox.scrollTop = chatBox.scrollHeight;

  // Send to chatbot.php
  fetch("chatbot.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ message: userInput })
  })
    .then((response) => response.json())
    .then((data) => {
      chatBox.removeChild(loadingMessage);

      const botMessage = document.createElement("div");
      botMessage.className = "bot-message";
      botMessage.style.position = "relative";

      const responseText = data.response
        ? data.response
        : data.error || "No response.";

      // Markdown to HTML (simple)
      const formatted = formatMarkdown(responseText);
      botMessage.innerHTML = formatted;

      // Add Copy Button
      const copyBtn = document.createElement("button");
      copyBtn.className = "copy-btn";
      copyBtn.textContent = "Copy";
      copyBtn.style.position = "absolute";
      copyBtn.style.top = "4px";
      copyBtn.style.right = "4px";
      copyBtn.style.display = "none"; // Hidden by default

      // Animation logic
      copyBtn.addEventListener("animationend", () => {
        copyBtn.classList.remove("copied-animate");
      });

      copyBtn.onclick = () => {
        navigator.clipboard.writeText(responseText);
        copyBtn.innerHTML = "&#10003;"; // ✅
        copyBtn.classList.add("copied-animate");
        setTimeout(() => {
          copyBtn.textContent = "Copy";
        }, 900);
      };

      // Show/hide copy button on hover
      botMessage.addEventListener("mouseenter", () => {
        copyBtn.style.display = "block";
      });
      botMessage.addEventListener("mouseleave", () => {
        copyBtn.style.display = "none";
      });

      botMessage.appendChild(copyBtn);
      chatBox.appendChild(botMessage);

      userInputElem.value = "";
      chatBox.scrollTop = chatBox.scrollHeight;
    })
    .catch(() => {
      chatBox.removeChild(loadingMessage);

      const errorMessage = document.createElement("div");
      errorMessage.className = "bot-message";
      errorMessage.textContent = "Bot: Failed to fetch response.";
      chatBox.appendChild(errorMessage);
    });
}

// Convert simple markdown (**bold**, *italic*, lists) to HTML
function formatMarkdown(text) {
  // Escape HTML
  let html = text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");

  // Bold: **text**
  html = html.replace(/\*\*(.*?)\*\*/g, "<strong>$1</strong>");

  // Italic: *text*
  html = html.replace(/\*(.*?)\*/g, "<em>$1</em>");

  // Lists
  html = html.replace(/(^|\n)\s*[-*]\s+(.*?)(?=\n|$)/g, "$1<ul><li>$2</li></ul>");

  // Combine adjacent <ul>
  html = html.replace(/<\/ul>\s*<ul>/g, "");

  return html.replace(/\n/g, "<br>");
}
