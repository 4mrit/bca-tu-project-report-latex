#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="bca-tu-report-latex-tex"

# Usage: ./scripts/docker-build.sh [engine]
# engine: default 'pdf' meaning latexmk -pdf (pdflatex), or 'xelatex' for xelatex
engine=${1:-pdf}

if ! command -v docker >/dev/null 2>&1; then
	echo "❌ Error: docker is not installed or not in PATH. Please install Docker."
	exit 1
fi

echo "🏗️ Building Docker image: $IMAGE_NAME"
docker build --platform linux/amd64 -t "$IMAGE_NAME" .

LATEXMK_FLAGS=( -pdf -silent -f main.tex )
if [ "$engine" = "xelatex" ]; then
	LATEXMK_FLAGS=( -xelatex -pdf -silent -f main.tex )
fi

echo "🚀 Running container to build PDF (output will be mounted to host repo) using engine: $engine"
docker run --rm --platform linux/amd64 -v "$(pwd)":/work -w /work "$IMAGE_NAME" "${LATEXMK_FLAGS[@]}"

echo "🧹 Cleaning auxiliary files..."
rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc *.blg *.bbl *.lof *.lot *.dvi *.pyg *.ps *.thm *.nlo *.nls *.idx *.ilg *.ind *.glg *.glo *.gls *.ist *.bak *.tdo *.tlog

echo "✅ Build completed. PDF should be at: $(pwd)/main.pdf"
