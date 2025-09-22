FROM rocker/geospatial:4.3.1

# Copy project files.
COPY Carcharhinidae.csv /app/Carcharhinidae.csv
COPY Carcharhinus.xlsx /app/Carcharhinus.xlsx
COPY Diets.xlsx /app/Diets.xlsx
COPY Traits.xlsx /app/Traits.xlsx
COPY index.qmd /app/index.qmd
COPY references.bib /app/references.bib
COPY Phylogeny/mcc_tree.nex /app/Phylogeny/mcc_tree.nex
COPY _extensions/stanford-quarto /app/_extensions/stanford-quarto
COPY _extensions/shafayetShafee /app/_extensions/shafayetShafee
COPY Images/landmarks.TPS /app/Images/landmarks.TPS
COPY ["Bass Images/bass_images.TPS", "/app/Bass Images/bass_images.TPS"]

# Install Quarto CLI
RUN apt-get update -y && apt-get install -y wget \
    && wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.13/quarto-1.7.13-linux-amd64.deb \
    && dpkg -i quarto-1.7.13-linux-amd64.deb \
    && rm quarto-1.7.13-linux-amd64.deb

# Install r-cran-* binary packages
RUN apt-get install -y --no-install-recommends \
    r-cran-tidyverse

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get clean

# Install R packages from source
RUN R -e "install.packages(c(\
    'geomorph', \
    'RRPP', \
    'openxlsx', \
    'dplyr', \
    'ggplot2', \
    'phytools', \
    'geiger', \
    'phangorn', \
    'tibble', \
    'geometry', \
    'reshape', \
    'colorspace', \
    'compositions', \
    'ordiBreadth', \
    'tidyr', \
    'akima', \
    'Hmisc', \
    'ggpointdensity', \
    'boot', \
    'broom', \
    'rredlist', \
    'treemap', \
    'ggrepel', \
    'dispRity', \
    'fields', \
    'abind', \
    'ggpubr', \
    'forcats'))"

RUN R -e "install.packages('quarto', repos = 'https://cloud.r-project.org')"
RUN R -e "install.packages('ggpubr', repos = 'https://cloud.r-project.org')"
RUN R -e "install.packages('conflicted', repos = 'https://cloud.r-project.org')"
RUN R -e "install.packages('knitr', repos = 'https://cloud.r-project.org')"
RUN R -e "install.packages('kableExtra', repos = 'https://cloud.r-project.org')"

# Set working directory
WORKDIR /app

# Render the Quarto document
CMD ["R", "-e", "quarto::quarto_render('/app/index.qmd')"]
