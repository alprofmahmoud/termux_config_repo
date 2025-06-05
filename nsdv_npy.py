import yt_dlp

def download_video_with_audio(url, output_path):
    yt_opts = {
        'format': 'bestvideo+bestaudio',  # تنزيل أفضل جودة فيديو وأفضل جودة صوت ودمجهما
        'outtmpl': '$HOME' + '/%(title)s.%(ext)s',  # مسار الملف الناتج
        'postprocessors': [{
            'key': 'FFmpegVideoConvertor',
            'preferedformat': 'mp4',  # التنسيق الناتج
        }]
    }

    with yt_dlp.YoutubeDL(yt_opts) as ydl:
        ydl.download([url])

# استخدام الدالة لتنزيل ودمج الفيديو والصوت
download_video_with_audio('https://youtu.be/i_qM1ljkyMA?si=iIBx1wjq4Hv8R3DV', '$HOME/X/')
