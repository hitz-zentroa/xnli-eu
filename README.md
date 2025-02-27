# XNLIeu: a dataset for cross-lingual NLI in Basque

XNLI is a popular Natural Language Inference (NLI) benchmark widely used to evaluate cross-lingual Natural Language Understanding (NLU) capabilities across languages. In this paper, we expand XNLI to include Basque, a low-resource language that can greatly benefit from transfer-learning approaches. The new dataset, dubbed XNLIeu, has been developed by first machine-translating the English XNLI corpus into Basque, followed by a manual post-edition step. We have conducted a series of experiments using mono- and multilingual LLMs to assess a) the effect of professional post-edition compared to the automatic MT system; b) the best cross-lingual strategy for NLI in Basque; and c) whether the choice of the best cross-lingual strategy is influenced by the fact that the dataset is built by translation. The results show that post-edition is crucial and that the translate-train cross-lingual strategy obtains better results overall, although the gain is lower when tested in a dataset that has been built natively from scratch.

Paper: https://aclanthology.org/2024.naacl-long.234/

# Download Dataset

The datasets can be downloaded at: [https://ixa2.si.ehu.eus/mheredia/XNLI-1.0-eu.zip](https://ixa2.si.ehu.eus/mheredia/XNLI-1.0-eu.zip)

The datasets can also be downloaded from HuggingFace: https://huggingface.co/datasets/HiTZ/xnli-eu

It is distributed under the same licenses as [XNLI](https://github.com/facebookresearch/XNLI).

# Dataset Analysis
A Jupyter Notebook with the code used to obtain some statistics that have been included in the paper is available in the `dataset-analysis` directory.

# Fine-tuning
A script for fine-tuning models for XNLI (in any of the 15 original XNLI languages and Basque) and evaluating on either of the three XNLIeu datasets is available in the `fine-tuning` directory.
Example of usage:

```
python run_xnli_eus.py \
  --model_name_or_path google-bert/bert-base-multilingual-cased \
  --language en \
  --train_language eu \
  --do_train \
  --do_eval \
  --per_device_train_batch_size 32 \
  --learning_rate 5e-5 \
  --num_train_epochs 2.0 \
  --max_seq_length 128 \
  --output_dir example_dir \
  --save_steps -1
```

Adapted from the code at [https://github.com/huggingface/transformers/tree/main/examples/pytorch/text-classification] to include Basque as train language and XNLIeu for evaluation. Distributed under its same license.
This directory also includes the shell code that has been employed to perform all of the experiments described in the paper. The subdirectory `train` contains code to train models for the three fine-tuning approaches (translate-train, zero-shot and typology), and the subdirectory `predict` the code to evaluate these fine-tuned models on the three subsplits available on HuggingFace.

# Decoder Evaluation

Evaluation scripts and results for open decoder models are in the `evaluation` directory.

## Install Evaluation Harness

You will need to install [LM Evaluation Harness](https://github.com/EleutherAI/lm-evaluation-harness).

```bash	
git clone https://github.com/EleutherAI/lm-evaluation-harness
cd lm-evaluation-harness
pip install -e .
```

## Run Decoder Evaluation

To run evaluation on open models, use the scripts in the `scripts` directory. Each script evaluates a model in all the tasks. For example, to run evaluation on Latxa v1 7b, run:

```bash
sbatch lm_eval_latxa-7b-v1.slurm
```

## Check Evaluation Results

Evaluation results are in the `results` directory. Each model has a directory with the results of the evaluation in each task. The results are in the form of a json file with the average scores of the model in each task.

## Citation
The [paper](https://aclanthology.org/2024.naacl-long.234/) that explains the dataset and experiments can be cited as follows:
```
@inproceedings{heredia-etal-2024-xnlieu,
    title = "{XNLI}eu: a dataset for cross-lingual {NLI} in {B}asque",
    author = "Heredia, Maite  and
      Etxaniz, Julen  and
      Zulaika, Muitze  and
      Saralegi, Xabier  and
      Barnes, Jeremy  and
      Soroa, Aitor",
    editor = "Duh, Kevin  and
      Gomez, Helena  and
      Bethard, Steven",
    booktitle = "Proceedings of the 2024 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies (Volume 1: Long Papers)",
    month = jun,
    year = "2024",
    address = "Mexico City, Mexico",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2024.naacl-long.234",
    pages = "4177--4188",
    abstract = "XNLI is a popular Natural Language Inference (NLI) benchmark widely used to evaluate cross-lingual Natural Language Understanding (NLU) capabilities across languages. In this paper, we expand XNLI to include Basque, a low-resource language that can greatly benefit from transfer-learning approaches. The new dataset, dubbed XNLIeu, has been developed by first machine-translating the English XNLI corpus into Basque, followed by a manual post-edition step. We have conducted a series of experiments using mono- and multilingual LLMs to assess a) the effect of professional post-edition on the MT system; b) the best cross-lingual strategy for NLI in Basque; and c) whether the choice of the best cross-lingual strategy is influenced by the fact that the dataset is built by translation. The results show that post-edition is necessary and that the translate-train cross-lingual strategy obtains better results overall, although the gain is lower when tested in a dataset that has been built natively from scratch. Our code and datasets are publicly available under open licenses.",
}
```
