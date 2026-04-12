# Kali Linux + .NET Automated Docker Image

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/subratb/kali-rolling-dotnet/digest-check-rebuild.yml?branch=main)
![Docker Pulls](https://img.shields.io/docker/pulls/subratb/kali-rolling-dotnet)
![Docker Image Size](https://img.shields.io/docker/image-size/subratb/kali-rolling-dotnet/latest)
![GitHub License](https://img.shields.io/github/license/subratb/kali-rolling-dotnet)
![GitHub Repo Stars](https://img.shields.io/github/stars/subratb/kali-rolling-dotnet?style=social)
![GitHub Issues](https://img.shields.io/github/issues/subratb/kali-rolling-dotnet)
![GitHub Pull Requests](https://img.shields.io/github/issues-pr/subratb/kali-rolling-dotnet)


This repository builds a custom Docker image based on **kalilinux/kali-rolling** with the **.NET SDK** installed using the official [`dotnet-install.sh`](https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install) script.

The image is automatically rebuilt whenever the upstream `kali-rolling` base image updates, ensuring you always get the latest Kali packages and security fixes.

---

## 🚀 Features

- Kali Linux (rolling release)
- Latest LTS .NET SDK installed via `dotnet-install.sh`
- Automated rebuilds using GitHub Actions
- Digest‑based update detection (rebuilds only when Kali updates)
- Automatically pushed to Docker Hub

---

## 🛠 How It Works

This repository contains:

- A **Dockerfile** that installs .NET on top of Kali Linux
- A **GitHub Actions workflow** that:
  - Checks the digest of `kalilinux/kali-rolling`
  - Rebuilds the image only when the digest changes
  - Pushes the updated image to Docker Hub
  - Stores the last known digest in `.kali_digest`

This ensures efficient, reliable, and fully automated image maintenance.

---

## 📦 Docker Hub Image

The built image is available on Docker Hub:

```bash
docker pull subratb/kali-rolling-dotnet:latest
```
---

## 🔧 Building Locally

If you want to build the image manually:

```bash
docker build -t kali-rolling-dotnet .
```
---

## 🧩 Repository Structure

```bash
.
├── Containerfile
├── .kali_digest              # Auto-updated by GitHub Actions
└── .github/
    └── workflows/
        └── digest-check-rebuild.yml
```
---

## 🤖 GitHub Actions Automation

The workflow:

- Runs every 12 hours
- Pulls the latest Kali base image
- Extracts its digest
- Compares it to the stored digest
- Rebuilds and pushes the image only if the digest changed

This avoids unnecessary builds and keeps the image fresh.

---

## 📜 License

This project is licensed under the **MIT License**.  
See the `LICENSE` file for details.

---

## 🙌 Contributions

Contributions, issues, and feature requests are welcome.  
Feel free to open a PR or start a discussion.