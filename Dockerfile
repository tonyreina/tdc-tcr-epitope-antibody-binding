FROM continuumio/miniconda3@sha256:58b1c7df8d69655ffec017ede784a075e3c2e9feff0fc50ef65300fc75aa45ae

# Squash the pip root install warning
ENV PIP_ROOT_USER_ACTION=ignore

# Copy all files into the image
COPY notebooks/tdc-tcr-epitope-binding-affinity.ipynb notebooks/tdc-tcr-epitope-binding-affinity.ipynb
COPY requirements* .
COPY environment.yml .
COPY README.md .

# Install the conda and pip packages into the base conda environment
RUN conda update --name base --channel defaults conda
RUN conda env update --name base --file environment.yml --prune

LABEL version="0.1"
LABEL description="Docker container for TDC TCR-Epitope Binding Affinity Prediction Task"
LABEL author="Tony Reina"