FROM blang/latex:ubuntu

# Install a few additional packages just in case
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    texlive-latex-extra \
    texlive-bibtex-extra \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY . /work

ENTRYPOINT ["latexmk"]
CMD ["-pdf", "-silent", "main.tex"]
