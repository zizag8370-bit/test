# Flask → GitHub Actions → Google Cloud Run (Secure CI/CD)

This template auto-deploys a Flask app to **Google Cloud Run** on every push to `main`.

## What you get
- Flask app (`app.py`)
- Production server via Gunicorn
- `Dockerfile` compatible with Cloud Run
- GitHub Actions workflow that:
  - Auths to GCP using **Workload Identity Federation (OIDC)** (no JSON keys)
  - Builds & pushes to **Artifact Registry**
  - Deploys to **Cloud Run**

---

## 1) Create these GitHub Secrets
In your repo: **Settings → Secrets and variables → Actions → New repository secret**

- `GCP_PROJECT_ID` : your GCP project id (e.g. `my-project-123`)
- `GCP_REGION` : your region (e.g. `asia-southeast1`)
- `GAR_REPO` : Artifact Registry repo name (e.g. `app-repo`)
- `CLOUD_RUN_SERVICE` : Cloud Run service name (e.g. `flask-app`)
- `WIF_PROVIDER` : Workload Identity Provider resource name
- `WIF_SERVICE_ACCOUNT` : service account email (e.g. `github-deployer@...iam.gserviceaccount.com`)

> Tip: `WIF_PROVIDER` looks like:
`projects/123456789/locations/global/workloadIdentityPools/POOL/providers/PROVIDER`

---

## 2) Run locally (optional)
```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

Open: http://localhost:8080

---

## 3) Build & run with Docker (optional)
```bash
docker build -t flask-cloudrun .
docker run -p 8080:8080 flask-cloudrun
```

---

## 4) Deploy
Just push to `main`:
```bash
git add .
git commit -m "deploy"
git push origin main
```

GitHub Actions will deploy automatically.

---

## Notes on Codespaces
- **You can use Codespaces** to develop/test and commit/push.
- **You do NOT need Codespaces to deploy**: deployment happens on **GitHub Actions** after you push.
