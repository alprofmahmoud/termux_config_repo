from choices import *
from singles import *
from output import *
Indvdl_optns()
print ("Choose")
chs=input()
if chs =="1":
    print ("Enter url video")
    url=input()

    # fun print url in url text file
    save_url(url)

    sfl= down_singles_video(url)
    sfl.show_format_list()

    sf=down_singles_video(url)
    sf.select_format()

elif chs =="2":
    print ("Show subtitles list")
    print ("Enter url video")
    url=input()

    # fun print url in url text file
    save_url(url)

    subtl=down_singles_video(url)
    subtl.show_subtitle_list()

elif chs=="3":
    down=down_singles_video(url)
    down.download()

else:
    print(chs)
    print ("out")

