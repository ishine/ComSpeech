exp=tts.fastspeech2.cvss-de-en
python fairseq/fairseq_cli/train.py data/comspeech/cvss_de_en/s2s \
    --user-dir ComSpeech \
    --tts-data data/cvss-c/de-en/tts/ --validate-task tts \
    --save-dir ComSpeech/checkpoints/$exp \
    --config-yaml config_sup.yaml --train-subset train --valid-subset dev \
    --num-workers 8 --max-update 100000 \
    --task comspeech_task --criterion comspeech_criterion --arch s2s_conformer_fastspeech2 \
    --encoder-layers 12 --encoder-embed-dim 256 --encoder-ffn-embed-dim 2048 --encoder-attention-heads 4 \
    --decoder-layers 4  --decoder-embed-dim 512 --decoder-ffn-embed-dim 2048 --decoder-attention-heads 8 \
    --tts-encoder-layers 4 --tts-encoder-embed-dim 256 --tts-encoder-attention-heads 2 \
    --tts-decoder-layers 4 --tts-decoder-embed-dim 256 --tts-decoder-attention-heads 2 \
    --share-decoder-input-output-embed \
    --tts-loss-weight 1.0 --label-smoothing 0.1 \
    --clip-norm 5.0 --n-frames-per-step 1 --fp16 \
    --dropout 0.3 --attention-dropout 0.3 --relu-dropout 0.3 \
    --lr 1e-3 --lr-scheduler inverse_sqrt --warmup-init-lr 1e-7 --warmup-updates 4000 \
    --optimizer adam --adam-betas "(0.9,0.98)" \
    --ddp-backend=legacy_ddp --patience 10 \
    --batch-size-tts 64 \
    --max-tokens 40000 \
    --no-progress-bar --log-format json --log-interval 100 \
    --required-batch-size-multiple 1 \
    --save-interval 1 --save-interval-updates 2000 \
    --validate-interval 1000 --validate-interval-updates 2000 \
    --keep-best-checkpoints 5 \
    --keep-interval-updates 5 --keep-last-epochs 5 \
    --attn-type espnet --pos-enc-type rel_pos \
    --seed 1 --update-freq 2