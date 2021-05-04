# deepspeed_testing

Hi there! This repo contains the accompanying code to my blog post [DeepSpeed Investigation: What I Learned](https://nathancooper.io/i-am-a-nerd/deepspeed/deep-learning/2021/05/03/DeepSpeed-Investigation.html) where I explored the awesome [DeepSpeed](https://www.deepspeed.ai/) library.

## Running my experiments
To run my experiments make sure you have [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) installed on your machine **(I've only tested this on Ubuntu 20.04)**.

```
docker run --gpus all -d -it -v $(pwd):/workspace --name deepspeed pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel bash
docker exec -it deepspeed bash
bash test.sh <model_name>
```

I've tested this out with three different models: t5-small, t5-base, t5-large, and t5-3b.