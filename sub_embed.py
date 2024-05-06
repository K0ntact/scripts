import subprocess
import os
import sys

# Get arguments
path = sys.argv[1]

def embed_subtitles(video_files, subtitle_files):
    for video_name, subtitle_name in zip(video_files, subtitle_files):
        video_format = video_name.split('.')[-1]
        output_file = f"{path}/{video_name.split('.')[0]}_with_sub.{video_format}"
        video_path = f"{path}/{video_name}"
        subtitle_path = f"{path}/{subtitle_name}"

        command = [
            "ffmpeg",
            "-i", video_path,
            "-i", subtitle_path,
            "-c", "copy", "-c:s", "mov_text",
            output_file
        ]

        subprocess.run(command)

vids = []
subs = []
for file_name in os.listdir(path):
    if file_name.endswith(".mkv") or file_name.endswith(".mp4"):
        vids.append(file_name)
    if file_name.endswith(".srt"):
        subs.append(file_name)
embed_subtitles(vids, subs)
