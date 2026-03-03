from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def home():
    return "Hello from Flask on Cloud Run! ✅"

@app.get("/healthz")
def healthz():
    return {"status": "ok"}

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
