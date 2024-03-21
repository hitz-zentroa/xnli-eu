for seed in 27 23 33
do
    for lang in ar bg de el en es fr hi ru sw th tr ur vi zh
    do
        python ../run_xnli_eus.py --model_name_or_path ../models/typology/$lang/$seed --language eu --train_language $lang --pred_dataset $split --do_predict --per_device_train_batch_size 32 --num_train_epochs 10.0 --max_seq_length 128 --output_dir ../results/typology/$lang/$seed --save_steps 50000 --load_best_model_at_end 1 --metric_for_best_model accuracy --seed $seed --evaluation_strategy steps --eval_steps 5000 --save_total_limit 2 
    done

done
