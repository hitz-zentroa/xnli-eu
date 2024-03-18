# xnli-eu

# Download Dataset

The datasets can be downloaded at: [ixa2.si.ehu.eus/mheredia/XNLI-1.0-eu.zip](ixa2.si.ehu.eus/mheredia/XNLI-1.0-eu.zip)

The datasets can also be downloaded from HuggingFace: https://huggingface.co/datasets/HiTZ/xnli-eu

# Evaluation

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