### CI Pipeline for DSO_Github-Actions
This repository uses GitHub Actions for Continuous Integration (CI) to ensure code quality, security, and proper deployment processes. Below is a breakdown of the CI pipeline steps and the tools used. I followed the YouTube video youtube.com/watch?v=gLJdrXPn0ns&t=2489s by TechWorld with NANA and with forked project: https://github.com/nanuchi/devsecops-crash-course-pygoat for the based of my project but later added my own tools and environments. Constantly updating as I learn more DevSecOps best practices and security issues. 

## Pipeline Overview and Workflow
- The CI pipeline is triggered on every push. It consists of the following major stages:
- Checkout Code: Pull the latest version of the repository.
- A install and use Bandit a Python security analyzer that looks for common security issues.
- Trivy is used to scan the file system for vulnerabilities in the code.
- Use SonarQube server: A tool to detect bugs, vulnerabilities, and code smells.
- OWASP Dependency-Check: Scans project dependencies to identify known vulnerabilities.
- TruffleHog: Scans the repository for sensitive information such as hardcoded secrets.
- GitGuardian: Scans for any potential secret leaks in the repository.
- After SAST Scan passes, the Docker image is built and scanned for vulnerabilities before being pushed to Docker Hub.
- Trivy Image Scan again: Scans the Docker image for vulnerabilities before pushing it.
- Push Docker Image to Docker Hub: Logs into Docker Hub and pushes the Docker image.
- Finally, the pipeline deploys the application to a Kubernetes cluster using kubectl.


## Environment Tools Used
- An AWS EC2 instance for the Runner server with Docker, Trivy, Maven, and Gitguardian installed
- An AWS EC2 instance for Sonarqube
- AWS EC2 instance(s) runnig Kubernetes Master node and needed worker nodes
- An AWS EC2 instance running Prometheus with Grafana and Blackbox exporter installed
- Bandit: Python security analysis tool.
- Trivy: Security scanner for vulnerabilities in filesystems and container images.
- SonarQube: Code quality and security analysis tool.
- OWASP Dependency-Check: Vulnerability scanner for project dependencies.
- TruffleHog: Secrets and sensitive information scanning tool.
- GitGuardian: Secrets detection tool to scan repositories.
- Docker: Containerization platform.
- Kubernetes: Container orchestration tool.



