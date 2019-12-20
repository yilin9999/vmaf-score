# How to derive VMAF score
## Installation
* Source code: https://github.com/Netflix/vmaf
* Build: https://github.com/Netflix/vmaf/blob/master/resource/doc/vmafossexec.md

## Execution Description:
+ Tools:
    * (a)	vmafossexec
    * (b)	ffmpeg

+ VMAF score is a “relative score”, we need to prepare both reference and test video streams.
    * ref_1080p.mp4  Reference video: 1920x1080 raw video
    * test.mp4  Test video: the target video we want to test. It need to be upscaled to 1920x1080.

+ The sample scripts
```    
bash run_vmaf_score.sh
```