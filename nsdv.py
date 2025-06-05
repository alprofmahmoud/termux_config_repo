print ("hello world");
import yt_dlp
import json
from colorama import Fore
print(f"{Fore.RED}This text is red!{Fore.WHITE}")
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
print(bcolors.UNDERLINE + "Warning: No active frommets remain. Continue?" + bcolors.ENDC)
print ("enter save location")
lct=input()
def my_hook(d):
    if d['status'] == 'downloading':
        print(' Downloading video!')
    if d['status'] == 'finished':
        print(' Downloaded!')

yt_opts = {
    'outtmpl':lct+'/%(title).200B.%(ext)s',
    'format':'sd',
    'progress_hooks': [my_hook],
    'listformats': True
}
ur_l=input()
with yt_dlp.YoutubeDL(yt_opts) as ydl:
    meta = ydl.extract_info(
        ur_l, download=False)
    formats = meta.get('formats', [meta])
ydl = yt_dlp.YoutubeDL(yt_opts)
ydl.download(ur_l)
for f in formats:
        print(f['protocol'])
with yt_dlp.YoutubeDL(yt_opts) as ydl:
    info = ydl.extract_info(ur_l, download=False)
    print(json.dumps(ydl.sanitize_info(info)))

