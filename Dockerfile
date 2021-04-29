FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

RUN apt update && apt install vim git -y
RUN git clone https://github.com/huggingface/transformers
RUN cd transformers && pip install --no-cache-dir -e . && pip install --no-cache-dir deepspeed
RUN cd examples/pytorch/translation && pip install --no-cache-dir -r requirements.txt

WORKDIR /workspace