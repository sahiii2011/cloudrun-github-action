

# My Flask App on Cloud Run

This project demonstrates a simple Flask application deployed on Google Cloud Run using GitHub Actions for continuous integration and continuous deployment (CI/CD).

## Overview

The application is a basic "Hello, world!" Flask app.  It's containerized using Docker and deployed to Cloud Run, a fully managed serverless platform that automatically scales your containerized applications.  GitHub Actions automates the build, push, and deployment process whenever changes are pushed to the main branch.

## Technologies Used

*   **Python:** The programming language for the Flask application.
*   **Flask:** A microframework for building web applications in Python.
*   **Docker:** A platform for building, shipping, and running applications in containers.
*   **Google Cloud Run:** A fully managed serverless platform for deploying containerized applications.
*   **Google Artifact Registry:** A service for storing Docker images.
*   **GitHub Actions:** A platform for automating CI/CD workflows.

## Project Structure
├── app.py          # The Flask application code
├── requirements.txt # Python dependencies
├── Dockerfile      # Instructions for building the Docker image
└── .github/workflows/X.yml # GitHub Actions workflow file

## Deployment

The application is deployed automatically to Cloud Run whenever changes are pushed to the `main` branch of this repository. The GitHub Actions workflow (`.github/workflows/main.yml`) handles the following steps:

1.  Checks out the code.
2.  Authenticates with Google Cloud using a service account key.
3.  Builds the Docker image, tagging it with the commit SHA.
4.  Pushes the Docker image to Google Artifact Registry.
5.  Deploys the Docker image to Cloud Run.

## Setup and Configuration

1.  **Google Cloud Project:** You will need a Google Cloud Project with the Cloud Run, Cloud Build, and Artifact Registry APIs enabled.

2.  **Artifact Registry Repository:** Create a Docker repository in Artifact Registry in your Google Cloud project. The repository name should match the one used in the workflow (e.g., `my-app-repo`).

3.  **Service Account:** Create a service account with the "Artifact Registry Writer" and "Cloud Run Deployer" roles. Download the service account key as a JSON file and store its contents as a GitHub secret named `GCP_SA_KEY` in your repository settings.

4.  **GitHub Secrets:** In your GitHub repository settings, under "Secrets and variables" -> "Actions", add the following secrets:
    *   `GCP_SA_KEY`: The contents of your service account JSON key file.
    *   `GCP_PROJECT_ID`: Your Google Cloud Project ID.

5.  **Environment Variables in Workflow:** In the GitHub Actions workflow file, set the following environment variables:
    *   `REGION`: The Google Cloud region where you want to deploy (e.g., `us-central1`).
    *   `REPO_NAME`: The name of your Artifact Registry repository.
    *   `SERVICE`: The name of your Cloud Run service.

## Running Locally (for development)

1.  **Clone the repository:** `git clone https://github.com/your-username/your-repo-name.git`
2.  **Create a virtual environment:** `python3 -m venv venv`
3.  **Activate the virtual environment:** `source venv/bin/activate` (Linux/macOS) or `venv\Scripts\activate` (Windows)
4.  **Install dependencies:** `pip install -r requirements.txt`
5.  **Run the application:** `python app.py`

## Accessing the Application

After the workflow completes successfully, you can access the application at the URL provided in the Cloud Run console or in the GitHub Actions workflow logs. 

## Contributing

Contributions are welcome!  Please open an issue or submit a pull request.
