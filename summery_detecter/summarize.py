import sys
import requests
import pdfplumber
import time
import os
import logging

# Setup logging to log.txt
logging.basicConfig(filename='log.txt', level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')
try:
    sys.stdout.reconfigure(encoding='utf-8')
except Exception:
    pass

# ✅ Config
API_KEY = "45465bb44b6ec65148beab2681637c38c9e9a7dd7ed93f519bbb0a1cde5f26f7"
MODEL_NAME = "meta-llama/Llama-3-8b-chat-hf"
CHUNK_SIZE = 3000  # chars per chunk
DELAY_BETWEEN_REQUESTS = 1.5  # seconds

def extract_text_from_pdf(pdf_path):
    """Extracts full text from the PDF using pdfplumber"""
    text = ""
    try:
        with pdfplumber.open(pdf_path) as pdf:
            for page in pdf.pages:
                page_text = page.extract_text()
                if page_text:
                    text += page_text + "\n"
    except Exception as e:
        logging.error(f"PDF Extraction Error: {str(e)}")
        raise RuntimeError(f"PDF Extraction Error: {str(e)}")
    return text.strip()

def chunk_text(text, chunk_size):
    """Splits text into manageable chunks"""
    return [text[i:i+chunk_size] for i in range(0, len(text), chunk_size)]

def summarize_chunk(text_chunk, index):
    """Calls Together API to summarize one chunk"""
    prompt = f"Summarize this part of a document (part {index}) in 100 words:\n\n{text_chunk}"

    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    }

    payload = {
        "model": MODEL_NAME,
        "messages": [{"role": "user", "content": prompt}],
        "temperature": 0.7
    }

    try:
        response = requests.post("https://api.together.xyz/v1/chat/completions", headers=headers, json=payload, timeout=60)
        if response.status_code != 200:
            logging.error(f"API HTTP error for chunk {index}: {response.status_code} {response.text}")
            return f"[Error] API HTTP error for chunk {index}."
        result = response.json()
        if "choices" in result and result["choices"]:
            return result["choices"][0]["message"]["content"].strip()
        else:
            logging.error(f"No summary returned for chunk {index}. Response: {result}")
            return f"[Error] No summary returned for chunk {index}."
    except requests.exceptions.RequestException as req_err:
        logging.error(f"Request error on chunk {index}: {str(req_err)}")
        return f"[Error] Request error on chunk {index}."
    except Exception as e:
        logging.error(f"Unexpected error on chunk {index}: {str(e)}")
        return f"[Error] Unexpected error on chunk {index}."

if __name__ == "__main__":
    try:
        if len(sys.argv) < 2:
            logging.error("Usage: python summarize.py <pdf-path>")
            sys.exit(1)

        pdf_path = sys.argv[1]
        if not os.path.isfile(pdf_path):
            logging.error(f"File not found: {pdf_path}")
            sys.exit(1)

        full_text = extract_text_from_pdf(pdf_path)

        if not full_text:
            logging.error("No text extracted from PDF.")
            sys.exit(1)

        chunks = chunk_text(full_text, CHUNK_SIZE)

        summaries = []
        for i, chunk in enumerate(chunks, 1):
            summary = summarize_chunk(chunk, i)
            summaries.append(f"Chunk {i}:\n{summary}\n")
            time.sleep(DELAY_BETWEEN_REQUESTS)

        final_output = "\n".join(summaries)
        # Output only the summary for backend use
        print(final_output)
    except Exception as e:
        logging.error(f"Fatal error: {str(e)}")
        print(f"[Error] {str(e)}")
        sys.exit(1)
