# Library Management System (PHP + MySQL) with AI Add-ons

A PHP/MySQL library management web app (generated with AppGini). It comes with two AI add-ons: a **Gemini-powered chatbot** and a **PDF summarizer** that uses Together AI.

## Features

- **Catalog:** books, magazines, newspapers, types
- **Circulation:** book issue, book return
- **Members/users:** with an admin area (`admin/`) for users and groups, owners, backup/restore and maintenance mode
- **AI chatbot** (`AI-Chatbot-with-PHP-and-Gemini-API-main/`): sends questions to Gemini (`gemini-1.5-flash`)
- **PDF summarizer** (`summery_detecter/`): upload a PDF and get a summary from `summarize.py` (Together AI, `meta-llama/Llama-3-8b-chat-hf`)

## Tech Stack

PHP (5.6.3 – 7.4.12 recommended) · MySQL/MariaDB · JavaScript/CSS · Python 3 (`requests`, `pdfplumber`) for the summarizer

## Prerequisites

- A PHP + MySQL stack such as XAMPP or WAMP
- Python 3 with `pip install requests pdfplumber` (summarizer only)
- A Gemini API key (chatbot) and a Together AI API key (summarizer)

## Installation & Setup

1. Clone the repo into your web root (for example `htdocs/`):
   ```bash
   git clone https://github.com/KahafSameer/LibraryManagementSystem.git
   ```
2. Create a MySQL database and import `DATABASE FILE/librarymanagementdb.sql`.
3. Set the database connection values (`$dbServer`, `$dbUsername`, `$dbPassword`, `$dbDatabase`) in `config.php`.
4. Open `http://localhost/LibraryManagementSystem/`.
5. The default login details are in `01 LOGIN DETAILS & PROJECT INFO.txt`. **Change the admin password after your first login.**

## Environment Variables

Listed in [.env.example](.env.example). PHP reads them with `getenv()`, so set them in your web server environment (for example `SetEnv` in Apache):

| Variable | Used by |
|---|---|
| `GEMINI_API_KEY` | `AI-Chatbot-with-PHP-and-Gemini-API-main/chatbot.php` |
| `TOGETHER_API_KEY` | `summery_detecter/summarize.py` |

```apache
SetEnv GEMINI_API_KEY your_gemini_api_key_here
SetEnv TOGETHER_API_KEY your_together_api_key_here
```

## Project Structure

```
*_view.php / *_dml.php / *_autofill.php   # CRUD pages per table (books, Book_Issue, Return_Book, Magazines, NewsPapers, Types, Users)
admin/                                    # Admin area
AI-Chatbot-with-PHP-and-Gemini-API-main/  # Gemini chatbot
summery_detecter/                         # PDF upload + summarizer (summarize.py)
DATABASE FILE/librarymanagementdb.sql     # Database dump
UIImages/                                 # Screenshots and diagrams
```
