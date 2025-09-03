import yt_dlp
import json
import os
from other_functions import *
from lct_slct import *
from yt_dlp.postprocessor import MetadataParserPP
class down_singles_video:
    def __init__(self,url,filename,lct,frmt=None):
        self.url = url
        #self.url=ur_l
        self.lct__ = lct
        self.frmt = frmt
        self.filename="./down_history.json"

        """self.title = title
        self.filename = filename"""
        self.data = []

    def set_filename(self):
        self.filename = "./down_history.json"
        self.data = self.load_data()

    def manage_data(self):

        #filename="./down_history.json"
    
        # تحميل البيانات إذا كان الملف موجوداً
        data = []
        if os.path.exists(self.filename):
            with open(self.filename, 'r', encoding='utf-8') as f:
                data = json.load(f)
    
        while True:
            print("\n1. إضافة بيانات\n2. بحث بالـ ID\n3. خروج")
            choice = input("اختر: ")
        
            if choice == "1":
                # إضافة بيانات جديدة
                new_id = max(item['id'] for item in data) + 1 if data else 1
                new_item = {
                    'id': new_id,
                    'name':self.url,
                    #'name': input("الاسم: "),
                    #'age': int(input("العمر: ")),
                    'age':self.lct,
                    #'city': input("المدينة: ")
                    'city':self.frmt
                }
                data.append(new_item)
                with open(self.filename, 'w', encoding='utf-8') as f:
                    json.dump(data, f, ensure_ascii=False, indent=4)
                print(f"تم الحفظ! ID: {new_id}")
        
            elif choice == "2":
                # البحث بالـ ID
                try:
                    search_id = int(input("أدخل ID: "))
                    for item in data:
                        if item['id'] == search_id:
                            print(f"\nالاسم: {item['name']}\nالعمر: {item['age']}\nالمدينة: {item['city']}")
                            break
                    else:
                        print("غير موجود!")
                except:
                    print("ID يجب أن يكون رقماً!")
        
            elif choice == "3":
                break
            
# استخدام الدالة        
        #manage_data(filename) 
    def show_format_list(self):
        yt_opts = {
        'listformats': True
            }
        try:
            with yt_dlp.YoutubeDL(yt_opts) as ydl:
                ydl.download([self.url])
        except yt_dlp.DownloadError as e:
            print(f"erreeeor: {str(e)}")
        
        """ydl = yt_dlp.YoutubeDL(yt_opts)
        meta = ydl.extract_info(self.url, download=False)
        title = meta.get('title') 
        print (title)
        print(type(yt_opts))"""

    def output_lct_(self):
        print("Enter save location")
        self.location=input()
        return self.location

    def select_format(self):
        # fun enter format
        frmt=enter_format()
        # fun output location vidoe
        #lct=self.output_lct_()
        lct_= SelectOutputLocation()
        yt_opts = {
            'outtmpl':'$HOME/'+lct_+'/%(title).200B.%(ext)s',
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
        try:
            with yt_dlp.YoutubeDL(yt_opts) as ydl:
                ydl.download([self.url])
        except yt_dlp.DownloadError as e:
            print(f"erroeeer: {str(e)}")
        #ydl = yt_dlp.YoutubeDL(yt_opts)
        #ydl.download(self.url)
        meta = ydl.extract_info(self.url, download=False)
        title = meta.get('title') 
        print (title)
        sub_text = title[0:15]
        print("___________________________")
        print(sub_text)
        print(self.lct)
        print(type(self.lct))


    def show_subtitle_list(self):
        print("hello in subtitles section")
        # fun output location vidoe
        lct=output_lct()

        ydl_opts = {
        'listsubtitles' : True,
        #'writesubtitles': True,
        #'subtitlesformat': 'srt',
        #"write_auto_sub":True,
        #"sub_lang":'en',
        "skip_download":True,
        #"output":'$HOME'+lct+'/%(title).200B.%(ext)s',
            }
        #with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            #ydl.download(self.url)

        ydl_opts_subtitle = {
                #'listsubtitles' : True,
                'writesubtitles': True,
                'subtitlesformat': 'srt',
                "write_auto_sub":True,
                "skip_download":True,
                "subtitleslangs":['ar','en'],
                "output":'$HOME'+lct+'/%(title).200B.%(ext)s',
            }
        ydl_opts_final=ydl_opts.update(ydl_opts_subtitle)

        with yt_dlp.YoutubeDL(ydl_opts_final) as ydl:
            ydl.download(self.url)

        










    """def download(self,song,url):
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
            #'actions': [(MetadataParserPP.Actions.INTERPRET, song, '(?P<artist>.+)\\ \\-\\ (?P<title>.+)')]
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


        download('Daniel Pemberton - Falling Apart', 'https://www.youtube.com/watch?v=Uhx77_beiso&pp=ygUNZmFsbGluZyBhcGFydA%3D%3D')"""
