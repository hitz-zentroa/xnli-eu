#!/bin/bash
#SBATCH --job-name=lm_eval_xglm-7b
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0
#SBATCH --mem=50GB
#SBATCH --gres=gpu:1
#SBATCH --output=.slurm/lm_eval_xglm-7b.out
#SBATCH --error=.slurm/lm_eval_xglm-7b.err

# activate virtual environment
source /gaueko0/users/jetxaniz007/phd/venv2/bin/activate

# print transformers cache
echo $TRANSFORMERS_CACHE

path="facebook"
model="xglm-7.5B"
model_name=$path/$model
folder="xglm"

# select tasks
tasks_selected=(
    "xnli_eu"
    "xnli_eu_mt"
    "xnli_eu_native"
)

num_fewshot=0

for group_name in "${tasks_selected[@]}"; do
    srun python3 -m lm_eval \
        --model hf \
        --model_args pretrained=$model_name,dtype=float16 \
        --tasks $group_name \
        --device cuda \
        --output_path ../results/${model}/${group_name}_${num_fewshot}-shot.json \
        --batch_size auto \
        --num_fewshot ${num_fewshot} \
        --log_samples
done
