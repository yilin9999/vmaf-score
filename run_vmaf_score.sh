#!/bin/bash

#prepare reference video (yuv), ref.mp4 must be native 1920x1080
ffmpeg -y -i ref_1080p.mp4 -c:v rawvideo -pix_fmt yuv420p ref_1080p.yuv

# prepare test video (yuv), upscale to 1920x1080 (same with the reference video)
ffmpeg -y -i test.mp4 -filter:v scale=1920:1080 -c:v rawvideo -pix_fmt yuv420p test_1080p.yuv

#generate vmaf score of test.mp4
./vmafossexec yuv420p 1920 1080 ref_1080p.yuv test_1080p.yuv vmaf/model/vmaf_v0.6.1.pkl --phone-model --psnr --ssim --log vmaf.log
set vmaf  = `grep  "aggregateVMAF" vmaf.log  | sed -n 's/.*VMAF="//p' | sed -n 's/".*exe.*//p'`

#generate the log of video information
ffmpeg -i test.mp4 -report
set br = `grep bitrate ffmpeg-*-*.log | sed -n 's/.*bitrate: //p' | sed -n 's/ kb.*//p'`

#show the result
echo "FINAL_VMAF     = " $vmaf
echo "FINAL_BITRATE = " $br

