# Bioinformatics model for protein therapeutics

We'll use the [Therapeutics Data Commons](https://tdcommons.ai/) Python package to download open-source ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)) datasets that are meaningful in pharmaceutical research. In this notebook, we'll use a dataset called [TCR-Epitope Binding Affinity](https://tdcommons.ai/multi_pred_tasks/tcrepitope/).

![TCR-epitope binding](notebooks/tcr-epitope-binding.png)

We show how to create a deep learning model for predicting if a T-cell receptor (TCR) and protein epitope will bind to each other. A model that can predict how well a TCR bindings to an epitope can lead to more effective treatments that use immunotherapy. For example, in anti-cancer therapies it is important for the T-cell receptor to bind to the protein marker in the cancer cell so that the T-cell (actually the T-cell's friends in the immune system) can kill the cancer cell.

We'll see how to use the open-sourced [bio-embeddings](https://docs.bioembeddings.com/v0.2.3/) Python library to get the latest state-of-the-art AI model for embedding the protein sequences. In this case, we use Facebook's open-source [Evolutionary Scale Model (ESM-1b)](https://github.com/facebookresearch/esm). These embeddings turn the protein sequences into a vector of 1,280 numbers that the computer can use in a mathematical model. The vector of numbers uniquely encodes (aka embeds) a protein sequence in the same way that the [Dewey Decimal System](https://en.wikipedia.org/wiki/Dewey_Decimal_Classification) uniquely encodes a book into a set of numbers (and letters).

Then, we'll show how to combine this embedding with a simple neural network to create a [binary classifier](https://en.wikipedia.org/wiki/Binary_classification) for the TCR-epitope binding affinity prediction (True=They Bind, False=They don't bind).

![encoder-decoder Dewey Decimal](notebooks/encoder-decoder.png)