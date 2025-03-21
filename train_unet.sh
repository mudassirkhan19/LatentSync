#!/bin/bash

uv run torchrun --nnodes=1 --nproc_per_node=1 --master_port=25678 -m scripts.train_unet \
    --unet_config_path "configs/unet/stage1.yaml"
