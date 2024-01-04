#/data/data/com.termux/files/home/storage/downloads/down_termux
echo "+---+----------------------------------------+"
echo "| N | select your system	             |"
echo "+---+----------------------------------------+"
echo "| 1 | Debian                                 |"
echo "| 2 | Termux                                 |"
echo "+---+----------------------------------------+"
echo "select type your oprating system"
read tsys
if (test $tsys -eq 1)
then
echo "this is debian distrabution GNU/Linux"
echo "+---+----------------------------------------+"
echo "| N | Description	                     |"
echo "+---+----------------------------------------+"
echo "| 1 | download single video                  |"
echo "| 2 | download playlist                      |"
echo "| 3 | download playlist No format list       |"
echo "| 4 | download from file                     |"
echo "| 5 | download from file No format list      |"
echo "| 6 | resume download video                  |"
echo "| 7 | exit                                   |"
echo "+--------------------------------------------+"
read wdown
# Equal 1 download single video.
if (test $wdown -eq 1)
then
	echo "download single videos..."
	echo "enter URL your video..."
	read urlv
	yt-dlp -F $urlv
	echo "\nenter select formatting..."
	read fvd
	yt-dlp -f $fvd $urlv -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 2 download playlist.
elif (test $wdown -eq 2)
then
	echo "download playlist..."
	echo "enter number start playlist..."
	read sitem
	echo "enter number end playlist..."
	read eitem
	echo "enter URL playlist..."
	read urlpl
	yt-dlp -F --playlist-start $sitem --playlist-end $eitem $urlpl
	echo "\nenter select formating..."
	read fvd
	yt-dlp -f $fvd --playlist-start $sitem --playlist-end $eitem $urlpl -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 3 download playlist No format list.
elif (test $wdown -eq 3)
then
	echo "download playlist No format list..."
	echo "enter number start playlist..."
	read sitem
	echo "enter number end playlist..."
	read eitem
	echo "enter URL playlist..."
	read urlpl
	echo "\nenter select formating..."
	read fvd
	yt-dlp -f $fvd --playlist-start $sitem --playlist-end $eitem $urlpl -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 4 download from urlfile.
elif (test $wdown -eq 4)
then
	echo "downloas from url file..."
	echo "enter url file..."
	read urlf
	yt-dlp -F -a $urlf
	echo "\nenter select formatting..."
	read fvd
	yt-dlp -f $fvd -a $urlf -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 5 downloas from url file No formating list.
elif (test $wdown -eq 5)
then
	echo "downloas from url file No formating list..."
	echo "enter url file..."
	read urlf
	echo "\nenter select formatting..."
	read fvd
	yt-dlp -f $fvd -a $urlf -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 6 resume download video.
elif (test $wdown -eq 6)
then
	echo " resume download video..."
	echo "enter url..."
	read urlv
	echo "enter format video..."
	read fvd
	yt-dlp -f $fvd $urlv
# Equal 7 exit.
elif (test $wdown -eq 7)
then
	echo " Good luck 👋"
	exit
# Other
else
	echo "out of the range..."
fi

elif (test $tsys -eq 2)
then
echo "+---+----------------------------------------+"
echo "| N | Description	                     |"
echo "+---+----------------------------------------+"
echo "| 1 | download single video                  |"
echo "| 2 | download videoi with subtitles         |"
echo "| 3 | download playlist                      |"
echo "| 4 | download playlist No format list       |"
echo "| 5 | download from file                     |"
echo "| 6 | download from file No format list      |"
echo "| 7 | resume download video                  |"
echo "| 8 | exit                                   |"
echo "+--------------------------------------------+"
read wdown
# Equal 1 download single video.
if (test $wdown -eq 1)
then
	echo "download single videos..."
	echo "enter URL your video..."
	read urlv
	yt-dlp -F $urlv
	echo "\nenter select formatting..."
	read fvd
	yt-dlp -f $fvd $urlv -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'


# Equal 2 download single video with subs
elif (test $wdown -eq 2)
then
	echo "download single video with subs..."
	echo "enter URL of th video..."
	read urlv
	yt-dlp --list-subs -F $urlv
	echo "enter subtitle Ex: ar.*"
	read sub
	echo "\nenter select formatting..."
	read fvd
	yt-dlp --write-subs --sub-langs $sub -f $fvd $urlv -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'


# Equal 2 download playlist.
elif (test $wdown -eq 3)
then
	echo "download playlist..."
	echo "enter number start playlist..."
	read sitem
	echo "enter number end playlist..."
	read eitem
	echo "enter URL playlist..."
	read urlpl
	yt-dlp -F --playlist-start $sitem --playlist-end $eitem $urlpl
	echo "\nenter select formating..."
	read fvd
	yt-dlp -f $fvd --playlist-start $sitem --playlist-end $eitem $urlpl -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 3 download playlist No format list.
elif (test $wdown -eq 4)
then
	echo "download playlist No format list..."
	echo "enter number start playlist..."
	read sitem
	echo "enter number end playlist..."
	read eitem
	echo "enter URL playlist..."
	read urlpl
	echo "\nenter select formating..."
	read fvd
	yt-dlp -f $fvd --playlist-start $sitem --playlist-end $eitem $urlpl -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 4 download from urlfile.
elif (test $wdown -eq 5)
then
	echo "downloas from url file..."
	echo "enter url file..."
	read urlf
	yt-dlp -F -a $urlf
	echo "\nenter select formatting..."
	read fvd
	yt-dlp -f $fvd -a $urlf -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 5 downloas from url file No formating list.
elif (test $wdown -eq 6)
then
	echo "downloas from url file No formating list..."
	echo "enter url file..."
	read urlf
	echo "\nenter select formatting..."
	read fvd
	yt-dlp -f $fvd -a $urlf -o /data/data/com.termux/files/home/storage/downloads/down_termux/'%(title)s.%(ext)s'

# Equal 6 resume download video.
elif (test $wdown -eq 7)
then
	echo " resume download video..."
	echo "enter url..."
	read urlv
	echo "enter format video..."
	read fvd
	yt-dlp -f $fvd $urlv
# Equal 7 exit.
elif (test $wdown -eq 8)
then
	echo " Good luck 👋"
	exit
# Other
else
	echo "out of the range..."
fi
else echo "Not supported"
fi
