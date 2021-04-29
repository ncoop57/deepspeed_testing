#! /bin/sh
model=$1

python transformers/examples/pytorch/translation/run_translation.py \
--model_name_or_path $model --per_device_train_batch_size 1   \
--output_dir output_dir --overwrite_output_dir --fp16 \
--do_train --max_train_samples 500 --num_train_epochs 1 \
--dataset_name wmt16 --dataset_config "ro-en" \
--source_lang en --target_lang ro 2> no_deepspeed_$model.txt

deepspeed --num_gpus=1 transformers/examples/pytorch/translation/run_translation.py \
--deepspeed transformers/tests/deepspeed/ds_config_zero2.json \
--model_name_or_path $model --per_device_train_batch_size 1   \
--output_dir output_dir --overwrite_output_dir --fp16 \
--do_train --max_train_samples 500 --num_train_epochs 1 \
--dataset_name wmt16 --dataset_config "ro-en" \
--source_lang en --target_lang ro 2> deepspeed_$model.txt
