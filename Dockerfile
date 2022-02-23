FROM rocker/r-base:latest
# install binaries and dependencies
RUN apt-get update && apt-get install -y -qq --no-install-recommends --purge \
    r-cran-pdftools \
    r-cran-dplyr \
    r-cran-stringr \
    libxml2-dev libxml2 \
    libssl-dev libssl1.1 && \
    Rscript -e "install.packages(c('pdftools', 'stringr', 'dplyr', 'writexl'))"
# Set working directory
WORKDIR /app
# Copy directory structure 
COPY . .

CMD code/instruction.sh
