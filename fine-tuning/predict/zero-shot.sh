for seed in 27 23 33
do
    for model in ixa-ehu/ixambert-base-cased google-bert/bert-base-multilingual-cased 
    do
        python ../run_xnli_eus.py --model_name_or_path $model --language eu --train_language en --do_train --do_eval --per_device_train_batch_size 32 --learning_rate 5e-5 --num_train_epochs 10.0 --max_seq_length 128 --output_dir ../models/zero-shot/$model/$seed --save_steps 50000 --load_best_model_at_end 1 --metric_for_best_model accuracy --seed $seed --evaluation_strategy steps --eval_steps 5000 --save_total_limit 2 
    done

    for model in FacebookAI/xlm-roberta-base FacebookAI/xlm-roberta-large
    do
        python ../run_xnli_eus.py --model_name_or_path $model --language eu --train_language en --do_train --do_eval --per_device_train_batch_size 32 --learning_rate 10e-6 --num_train_epochs 10.0 --max_seq_length 128 --output_dir ../models/zero-shot/$model/$seed --save_steps 50000 --load_best_model_at_end 1 --metric_for_best_model accuracy --seed $seed --evaluation_strategy steps --eval_steps 5000 --save_total_limit 2 
    done
done