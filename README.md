# Bioinformatics model for protein therapeutics

## NOTE
This is *not* a Resilience project and the code/opinions/recommendations are my personal work and mine alone.

## Synopsis

We'll use the [Therapeutics Data Commons](https://tdcommons.ai/) Python package to download open-source ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)) datasets that are meaningful in pharmaceutical research. In this repository, we'll use a dataset called [TCR-Epitope Binding Affinity](https://tdcommons.ai/multi_pred_tasks/tcrepitope/). The code will be in the notebook [notebooks/tdc-tcr-epitope-binding-affinity.ipynb](notebooks/tdc-tcr-epitope-binding-affinity-model.ipynb).

![TCR-epitope binding](notebooks/tcr-epitope-binding.png)

We show how to create a deep learning model for predicting if a T-cell receptor (TCR) and protein epitope will bind to each other. A model that can predict how well a TCR bindings to an epitope can lead to more effective treatments that use immunotherapy. For example, in anti-cancer therapies it is important for the T-cell receptor to bind to the protein marker in the cancer cell so that the T-cell (actually the T-cell's friends in the immune system) can kill the cancer cell.

[HuggingFace](https://huggingface.co/facebook/esm2_t36_3B_UR50D) is a Python library that provides a "one-stop shop" 
to train and deploy AI models. In this case, we use HuggingFace to get a pre-trained version of Facebook's 
open-source [Evolutionary Scale Model (ESM-2)](https://github.com/facebookresearch/esm). 
This model turns protein sequences into a vector of numbers that the computer can use 
in a mathematical model. The vector of numbers uniquely encodes (aka embeds) a protein sequence 
in the same way that the [Dewey Decimal System](https://en.wikipedia.org/wiki/Dewey_Decimal_Classification) and [ISBN](https://en.wikipedia.org/wiki/ISBN) uniquely encode a book into a set of numbers (and letters). This representation is also referred to as a [latent space](https://en.wikipedia.org/wiki/Latent_space#:~:text=A%20latent%20space%2C%20also%20known,another%20in%20the%20latent%20space).

Then, we'll show how to combine this embedding with a simple neural network to create a [binary classifier](https://en.wikipedia.org/wiki/Binary_classification) for the TCR-epitope binding affinity prediction (True=They Bind, False=They don't bind).

![encoder-decoder Dewey Decimal](notebooks/encoder-decoder.png)

## Getting the dataset

The [Therapeutics Data Commons (TDC)](https://tdcommons.ai/) dataset can be automatically downloaded via 
their open-sourced Python library. However, it will take significant time (hours) to compute the 
[Evolutionary Scale Model (ESM-2)](https://github.com/facebookresearch/esm) embedding vectors. 

To save you time, I've uploaded the preprocessed data as Pickle files on [Zenodo](https://zenodo.org/records/11894560). If you download those 3 files, then the Python script will skip the embedding step.

## Running things locally
### Creating the `conda` environment

To install all of the required Python packages, you'll need to create a [conda](https://docs.conda.io/en/latest/miniconda.html) environment. Follow the [conda website](https://docs.conda.io/en/latest/miniconda.html) directions to download and install `conda` ([Anaconda](https://www.anaconda.com/products/distribution) works too). Once you have `conda` installed, run the command:

```bash
conda env create -f environment.yml
```

Once the environment is successfully created, activate it by running:

```bash
conda activate tdc-tcr-epitope-binding-affinity-env
```

At this point you should be able to run the Jupyter Notebook:

```bash
jupyter notebook notebooks/tdc-tcr-epitope-binding-affinity-model.ipynb
```

## Running things in a container

If you don't want to install `conda`, then you can run the Jupyter notebook from within a container.

### Apptainer

To create an [Apptainer](https://apptainer.org), run the command:

```bash
apptainer build tdc-tcr-epitope-binding-affinity.sif tdc-tcr-epitope-binding-affinity.def
```

Then, run:

```bash 
apptainer shell tdc-tcr-epitope-binding-affinity.sif
```

At this point, you'll be able to run the Jupyter Notebook:

```bash
jupyter notebook notebooks/tdc-tcr-epitope-binding-affinity-model.ipynb
```

### Docker

To create a [Docker](https://docker.com), run the command:

```bash
docker build -t tdc-tcr-epitope-binding-affinity .
```

Now you can run:

```bash
docker run tdc-tcr-epitope-binding-affinity
```

And finally you can run the Jupyter Notebook:

```bash
jupyter notebook notebooks/tdc-tcr-epitope-binding-affinity-model.ipynb
```

### References

1. Weber, Anna, Jannis Born, and María Rodriguez Martínez. "TITAN: T-cell receptor specificity prediction with bimodal attention networks." Bioinformatics 37.Supplement_1 (2021): i237-i244.

2. Bagaev, Dmitry V., et al. "VDJdb in 2019: database extension, new analysis infrastructure and a T-cell receptor motif compendium." Nucleic Acids Research 48.D1 (2020): D1057-D1062.

3. Dines, Jennifer N., et al. "The immunerace study: A prospective multicohort study of immune response action to covid-19 events with the immunecode™ open access database." medRxiv (2020).

4. Alexander Rives, Joshua Meier, Tom Sercu, Siddharth Goyal, Zeming Lin, Jason Liu, Demi Guo, Myle Ott, C. Lawrence Zitnick, Jerry Ma, Rob Fergus. "Biological structure and function emerge from scaling unsupervised learning to 250 million protein sequences." bioRxiv 622803; doi: https://doi.org/10.1101/622803  https://www.biorxiv.org/content/10.1101/622803v4

5. Zeming Lin et al, Evolutionary-scale prediction of atomic-level protein structure with a language model, Science (2023). DOI: 10.1126/science.ade2574  https://www.science.org/doi/10.1126/science.ade2574


### ESM2

https://huggingface.co/facebook/esm2_t36_3B_UR50D

**Checkpoint name**|**Number of layers**|**Number of parameters**
:-----:|:-----:|:-----:
esm2\_t48\_15B\_UR50D|	48|	15B
esm2\_t36\_3B\_UR50D|	36|	3B
esm2\_t33\_650M\_UR50D|	33|	650M
esm2\_t30\_150M\_UR50D|	30|	150M
esm2\_t12\_35M\_UR50D|	12|	35M
esm2\_t6\_8M\_UR50D|	6|	8M


### Licenses

The TDC dataset is a [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/). The ESM-2 model is [MIT license](https://en.wikipedia.org/wiki/MIT_License).
