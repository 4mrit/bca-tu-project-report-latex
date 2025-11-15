# bca-tu-project-report-latex

This repository contains a LaTeX project for a BCA final project report.

## Build & PDF Generation

Build the PDF using Docker (recommended) or local TeX installation.

### Quick Docker Build

- Build with pdflatex (default):

```zsh
make docker
```

- Build with xelatex (system fonts):

```zsh
make docker ENGINE=xelatex
```

Output: `main.pdf` in the repository root.

### Local Build (Optional)

```zsh
make
```

### Notes

- Docker image: `blang/latex:ubuntu` with minimal TexLive packages.
- For Apple Silicon, use `--platform linux/amd64` if needed.
