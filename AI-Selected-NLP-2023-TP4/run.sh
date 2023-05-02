#!/bin/bash


if [ "$1" = "train" ]; then
	CUDA_VISIBLE_DEVICES=0 python3.10 run.py train --train-src=./en_es_data/train.es --train-tgt=./en_es_data/train.en --dev-src=./en_es_data/dev.es --dev-tgt=./en_es_data/dev.en --vocab=vocab.json --cuda
elif [ "$1" = "train_small" ]; then
	CUDA_VISIBLE_DEVICES=0 python3.10 run.py train --train-src=./en_es_data/train.es --train-tgt=./en_es_data/train.en --dev-src=./en_es_data/dev.es --dev-tgt=./en_es_data/dev.en --vocab=vocab.json --cuda --embed-size=128 --hidden-size=128
elif [ "$1" = "train_small_data" ]; then
	CUDA_VISIBLE_DEVICES=0 python3.10 run.py train --train-src=./en_es_data/train_small.es --train-tgt=./en_es_data/train_small.en --dev-src=./en_es_data/dev.es --dev-tgt=./en_es_data/dev.en --vocab=vocab.json --cuda --embed-size=128 --hidden-size=128
elif [ "$1" = "test" ]; then
	CUDA_VISIBLE_DEVICES=0 python3.10 run.py decode model.bin ./en_es_data/test.es ./en_es_data/test.en outputs/test_outputs.txt --cuda
elif [ "$1" = "train_local" ]; then
	python3.10 run.py train --train-src=./en_es_data/train.es --train-tgt=./en_es_data/train.en --dev-src=./en_es_data/dev.es --dev-tgt=./en_es_data/dev.en --vocab=vocab.json
elif [ "$1" = "train_local_small" ]; then
	python3.10 run.py train --train-src=./en_es_data/train.es --train-tgt=./en_es_data/train.en --dev-src=./en_es_data/dev.es --dev-tgt=./en_es_data/dev.en --vocab=vocab.json --embed-size=128 --hidden-size=128
elif [ "$1" = "train_local_small_data" ]; then
	python3.10 run.py train --train-src=./en_es_data/train_small.es --train-tgt=./en_es_data/train_small.en --dev-src=./en_es_data/dev.es --dev-tgt=./en_es_data/dev.en --vocab=vocab.json --embed-size=128 --hidden-size=128
elif [ "$1" = "test_local" ]; then
    python3.10 run.py decode model.bin ./en_es_data/test.es ./en_es_data/test.en outputs/test_outputs.txt
elif [ "$1" = "vocab" ]; then
	python3.10 vocab.py --train-src=./en_es_data/train.es --train-tgt=./en_es_data/train.en vocab.json
else
	echo "Invalid Option Selected"
fi
