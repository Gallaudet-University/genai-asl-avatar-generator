#!/bin/bash

# Check NVCC version
nvcc -V

# Install PyTorch with CUDA 11.8
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install OpenMIM and related packages
pip install -U openmim
mim install mmengine
mim install "mmcv>=2.0.0"
mim install "mmdet>=3.0.0"
pip install git+https://github.com/jin-s13/xtcocoapi

# Clone and set up MMPose
git clone https://github.com/open-mmlab/mmpose.git
cd mmpose || exit
pip install -r requirements.txt
pip install -v -e .

# Create checkpoints directory if it doesn't exist
if [ ! -d "../checkpoints" ]; then
  mkdir "../checkpoints"
fi

# Download model checkpoints
wget -O checkpoints/rtmpose-l_simcc-coco-wholebody.pth https://download.openmmlab.com/mmpose/v1/projects/rtmposev1/rtmpose-l_simcc-coco-wholebody_pt-aic-coco_270e-384x288-eaeb96c8_20230125.pth
wget -O checkpoints/faster_rcnn_r50_fpn_1x_coco.pth https://download.openmmlab.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_1x_coco/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth
