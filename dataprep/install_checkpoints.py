import os
import requests

# Define file paths
pose_checkpoint = '../checkpoints/rtmpose-l_simcc-coco-wholebody_pt-aic-coco_270e-384x288-eaeb96c8_20230125.pth'
det_checkpoint = '../checkpoints/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth'

# Define URLs
pose_url = "https://download.openmmlab.com/mmpose/rtmpose/rtmpose-l_simcc-coco-wholebody_pt-aic-coco_270e-384x288-eaeb96c8_20230125.pth"
det_url = "https://download.openmmlab.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth"

# Ensure checkpoints directory exists
os.makedirs(os.path.dirname(pose_checkpoint), exist_ok=True)

# Download files if they don't exist
for path, url in [(pose_checkpoint, pose_url), (det_checkpoint, det_url)]:
    if not os.path.exists(path):
        print(f"Downloading {path}...")
        response = requests.get(url)
        with open(path, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded {path}”)
