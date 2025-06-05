import yt_dlp
from other_functions import *
from output import *
from yt_dlp.postprocessor import MetadataParserPP
class down_singles_video:
    def __init__(self,ur_l):
        self.url = ur_l

    def show_format_list(self):
        yt_opts = {
        'listformats': True
            }
        ydl = yt_dlp.YoutubeDL(yt_opts)
        ###ydl.download(self.url)
        meta = ydl.extract_info(self.url, download=False)
        title = meta.get('title') 
        print (title)

    def select_format(self):
        # fun enter format
        frmt=enter_format()

        # fun output location vidoe
        lct=output_lct()

        yt_opts = {
            'outtmpl':'$HOME/'+lct+'/%(title).200B.%(ext)s',
            'format':frmt,
            'continue': True,
            'progress_hooks': [my_hook],
            'embed-metadata': True,
            'quiet': True,
            'parse-metadata': '%(title)s',
            'actions': [
                 (yt_dlp.postprocessor.metadataparser.MetadataParserPP.replacer,
                  'title', '[|,｜.*]', '%(section_title)s')], 
             'key': 'MetadataParser',
             'when': 'pre_process'
                }

        ydl = yt_dlp.YoutubeDL(yt_opts)
        ydl.download(self.url)
        ###meta = ydl.extract_info(self.url, download=False)
        ###title = meta.get('title') 
        ###print (title)


    def show_subtitle_list(self):
        print("hello in subtitles section")
        # fun output location vidoe
        lct=output_lct()
        ydl_opts = {
        'listsubtitles' : True,
        #'writesubtitles': True,
        #'subtitlesformat': 'srt',
        #"write_auto_sub":True,
        "sub_lang":'en',
        "skip_download":True,
        "output":'$HOME'+lct+'/%(title).200B.%(ext)s',
            }
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download(self.url)

    def download(self,song,url):
        ydl_opts = {
        'format': 'm4a/bestaudio/best',
        'outtmpl': song + ".%(ext)s",
        'merge-output-format': 'mkv',
        'writethumbnail': True,
        'embedthumbnail': True,
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'aac'
        },
        {
            'key': 'MetadataParser',
            'when': 'post_process',
            # The title and artist name are interpreted from the given song name, 
            # but can be interpreted from the title on YouTube by replacing song with "title"
            'actions': [(MetadataParserPP.Actions.INTERPRET, song, '(?P<artist>.+)\ \-\ (?P<title>.+)')]
        },
        {
            'key': 'FFmpegMetadata'
        },
        {
            "key": 'EmbedThumbnail'
        }
        ]
    }

        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download(url)


        download('Daniel Pemberton - Falling Apart', 'https://www.youtube.com/watch?v=Uhx77_beiso&pp=ygUNZmFsbGluZyBhcGFydA%3D%3D')
