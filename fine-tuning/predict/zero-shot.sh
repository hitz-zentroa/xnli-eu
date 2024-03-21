for seed in 27 23 33
do
    for model in ixa-ehu/ixambert-base-cased google-bert/bert-base-multilingual-cased FacebookAI/xlm-roberta-base FacebookAI/xlm-roberta-large
    do
        for split in eu eu_mt eu_native
        do
            python ../run_xnli_eus.py --model_name_or_path ../models/zero-shot/$model/$seed --language eu --train_language en --pred_dataset $split --do_predict --per_device_train_batch_size 32 --num_train_epochs 10.0 --max_seq_length 128 --output_dir ../results/zero-shot/$model/$seed --save_steps 50000 --load_best_model_at_end 1 --metric_for_best_model accuracy --seed $seed --evaluation_strategy steps --eval_steps 5000 --save_total_limit 2 
        done
    done
done
