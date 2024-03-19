# XNLIeu: a dataset for cross-lingual NLI in Basque

XNLI is a popular Natural Language Inference (NLI) benchmark widely used to evaluate cross-lingual Natural Language Understanding (NLU) capabilities across languages. In this paper, we expand XNLI to include Basque, a low-resource language that can greatly benefit from transfer-learning approaches. The new dataset, dubbed XNLIeu, has been developed by first machine-translating the English XNLI corpus into Basque, followed by a manual post-edition step. We have conducted a series of experiments using mono- and multilingual LLMs to assess a) the effect of professional post-edition compared to the automatic MT system; b) the best cross-lingual strategy for NLI in Basque; and c) whether the choice of the best cross-lingual strategy is influenced by the fact that the dataset is built by translation. The results show that post-edition is crucial and that the translate-train cross-lingual strategy obtains better results overall, although the gain is lower when tested in a dataset that has been built natively from scratch.

# Download Dataset

The datasets can be downloaded at: [ixa2.si.ehu.eus/mheredia/XNLI-1.0-eu.zip](ixa2.si.ehu.eus/mheredia/XNLI-1.0-eu.zip)

The datasets can also be downloaded from HuggingFace: https://huggingface.co/datasets/HiTZ/xnli-eu

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

# Decoder Evaluation

Evaluation scripts and results for open decoder models are in the `evaluation` directory.

## Install Evaluation Harness

You will need to install our fork of [LM Evaluation Harness](https://github.com/EleutherAI/lm-evaluation-harness). Clone the repository and checkout the `eustrivia` branch:

```bash	
git clone https://github.com/juletx/lm-evaluation-harness
cd lm-evaluation-harness
git checkout eustrivia
pip install -e .
```

## Run Decoder Evaluation

To run evaluation on open models, use the scripts in the `scripts` directory. Each script evaluates a model in all the tasks. For example, to run evaluation on Latxa v1 7b, run:

```bash
sbatch lm_eval_latxa-7b-v1.slurm
```

## Check Evaluation Results

Evaluation results are in the `results` directory. Each model has a directory with the results of the evaluation in each task. The results are in the form of a json file with the average scores of the model in each task.

