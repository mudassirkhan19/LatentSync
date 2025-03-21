#!/bin/bash

audio_path="/disk/gtc-2025-final-videos/audios/boman-og-audio.mp3"
video_path="/disk/gtc-2025-final-videos/videos/boman-occlusion-avatar.mp4"
# get video_out_path from video_path and audio_path (remove extension without hardcoding it to mp4/mp3)
video_out_path="results/$(basename "$video_path" .mp4)_$(basename "$audio_path" .mp3)_latentsync_15.mp4"

uv run python -m scripts.inference \
    --unet_config_path "configs/unet/stage2.yaml" \
    --inference_ckpt_path "checkpoints/latentsync_unet.pt" \
    --inference_steps 20 \
    --guidance_scale 1.5 \
    --video_path "$video_path" \
    --audio_path "$audio_path" \
    --video_out_path "$video_out_path"
