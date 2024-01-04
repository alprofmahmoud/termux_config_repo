#!/bin/bash
		# selection function system
function fun_system(){
echo "+---+----------------------------------------+"
echo "|   | Systems                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Debian                                 |"
echo "| 2 | Termux                                 |"
echo "+---+----------------------------------------+"
echo "Choose System"
}
## selection function method download.
function fun_method_download(){
echo "+---+----------------------------------------+"
echo "|   | Methods                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Download from URL                      |"
echo "| 2 | Download from file                     |"
echo "+---+----------------------------------------+"
echo "Choose Method"
}
## selection function show lists.
function fun_show_list {
echo "+---+----------------------------------------+"
echo "|   | Show                                   |"
echo "+---+----------------------------------------+"
echo "| 1 | Show formatting list                   |"
echo "| 2 | Show subtitles list                    |"
echo "| 3 | Show formatting list (playlist)        |"
echo "+---+----------------------------------------+"
echo "| 0 | skip                                   |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## selection function options downloading URL.
function fun_options_down_from_url(){
echo "+---+----------------------------------------+"
echo "|   | Options                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Enter video formatting                 |"
echo "| 2 | Output location                        |"
echo "| 3 | Playlist download                      |"
echo "+---+----------------------------------------+"
echo "| 8 | Download                               |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## selection function options downloading from file.
function fun_options_down_from_url_file(){
echo "+---+----------------------------------------+"
echo "|   | Options                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Show formatting list                   |"
echo "| 2 | Enter formatting video                 |"
echo "| 3 | Output location                        |"
echo "+---+----------------------------------------+"
echo "| 8 | Download                               |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## skip downloading function.
function fun_skip_options(){
echo "+---+----------------------------------------+"
echo "|   | Options                                |"
echo "+---+----------------------------------------+"
echo "| 1 | Skip download the video                |"
echo "| 2 | Continue download the video            |"
echo "+---+----------------------------------------+"
echo "Choose option"
}

## Show format list function.
function fun_format_list(){
	Format_list="-F"
	echo "Enter Video URL"
	read v_url_list
	fun_yt_dlp	# main command function.
}

## this is the function do show list subtitle.
function fun_subttl_list(){
	List_subs="--list-subs"
	echo "Enter Video URL"
	read v_url_list
	fun_yt_dlp	# main command function.

}

## this is the function do download subtitle.
function fun_subttl_down(){
	List_subs=""
	Write_sub="--write-sub"
	Sub_lang="--sub-lang"
	Wrire_auto_sub="--write-auto-sub"
	echo "Enter subtitle language"
	read lng
	if (test $var_show -eq 2)
	then
		fun_skip_options	# function skip options.
		read var_skp
		func_test_variables_read $var_skp
		if (test $var_skp -eq 1
		)then
			skp="--skip-download"
		elif (test $var_skp -eq 2)
		then
			skp=""
		else
			fun_exit
		fi
		fun_format_list    	# function to show format list to this url video.
		fun_format_vid_down	# download video by format function.
		fun_output			# output function.

		fun_yt_dlp	# main command function.
	fi
}

## function entry ID of the formatting.
function fun_format_vid_down(){
	echo "Enter ID of the formatting"
	read format_vid
	Format_video="-f $format_vid"
	if (test $var_show -eq 1)
	then
		Format_list=""
		fun_output
		fun_yt_dlp
	fi
}

## funcion defult save location.
function fun_defult_lct(){
	lcte="-o /data/data/com.termux/files/home/storage/downloads/down_termux/%(title).200B.%(ext)s"
}

:<< EOF
## this is function choose save location.
function fun_output(){
	echo "where are you want save this file?"
	echo "+---+----------------------------------------+"
	echo "|   | Output in                              |"
	echo "+---+----------------------------------------+"
	echo "| 1 | Defult location (down_termux)          |"
	echo "| 2 | Choose location                        |"
	echo "+---+----------------------------------------+"
	echo "Choose"
	read var_out
	if (test $var_out -eq 1)
	then
		fun_defult_lct
	elif (test $var_out -eq 2 )
	then
	echo "Enter new output location"
	read new_lct_out
	lcte="-o /data/data/com.termux/files/home/storage/downloads/$new_lct_out/%(title).200B.%(ext)s"
	else
		fun_exit
	fi
}
EOF

option1="Defult location (down_termux)"
option2="Choose location"

lngth_option1=$(expr length "$option1")
lngth_option2=$(expr length "$option2")

nmbr_spc1=`expr 39 - $lngth_option1`
nmbr_spc2=`expr 39 - $lngth_option2`

func_test_variables_read(){

re='^[0-9]+$'
if  [[ $1 =~ $re ]] ; then
	printf "\e[0;32mDone \e[0m\n"
else 
	fun_exit
	#echo "var is not number" >&2; exit 1
fi
}

function fun_output(){
	if test -f /data/data/com.termux/files/home/lcte_file.txt;
	then
	echo "File exists."
	else
	touch lcte_file.txt
	fi

	echo "where are you want save this $type_url?"
	echo "+---+-----------------------------------------+"
	echo "|   | Output in                               |"
	echo "+---+-----------------------------------------+"
	echo "| 1 | $option1 $(printf '%.s ' $(seq $nmbr_spc1))|"
	echo "| 2 | $option2 $(printf '%.s ' $(seq $nmbr_spc2))|"

	filename="lcte_file.txt"	
	i=2	
	while read  ; do
	 (( i+=1 ))

	option_n=$REPLY
	lng_option_n=$(expr length "$option_n")
	nmbr_spc_n=`expr 39 - $lng_option_n`

	echo "| $i | $REPLY $(printf '%.s ' $(seq $nmbr_spc_n))|"

	done < lcte_file.txt

	echo "+---+-----------------------------------------+"
	echo "Choose"
	read var_out
	func_test_variables_read $var_out
	if (test $var_out -eq 1)
	then
		fun_defult_lct
	elif (test $var_out -eq 2 )
	then
		echo "Enter output location"
		read new_lct_out 
		echo $new_lct_out >> $HOME/lcte_file.txt
		lcte="-o $HOME/storage/downloads/$new_lct_out/%(title).200B.%(ext)s"
		lines_n=`sed -n '$=' lcte_file.txt`
		if (test $lines_n -eq 7)
		then
		:>lcte_file.txt
		fi

 
	else
		var_out_n1=`expr $var_out - 2`
		var_out_n2=`expr $var_out_n1 + 2`
		if (test $var_out -eq $var_out_n2)
		then
		lct_list=`sed -n "$var_out_n1"p lcte_file.txt`
		lcte="-o $HOME/storage/downloads/$lct_list/%(title).200B.%(ext)s"
	else
		fun_exit
	fi
	fi
}


## this is function show format list to the playlist.
function fun_plst_format_list_from_url(){
		type_url="Playlist"
		echo "Enter playlist video start"
		read S_item
		echo "Enter playlist video end"
		read E_item
		pl_s="--playlist-start"
		pl_e="--playlist-end"
		Format_list="-F"
		echo "Enter $type_url URL"
		read v_url_list
		fun_yt_dlp	# main command function.
		Format_list=""
		echo "enter ID formatting"
		read Format_video
		fun_output
		fun_yt_dlp
}
function fun_plst_format_from_url(){
	type_url="Playlist"
	echo "Hello $type_url"
	echo "Enter playlist video start"
	read S_item
	echo "Enter playlist video end"
	read E_item
	pl_s="--playlist-start"
	pl_e="--playlist-end"
	Format_list=""
}
		
## function exit.
function fun_exit(){
		printf "\e[0;31mERROR : \e[0mNot avarible!"
		exit
}

## this is function download from file.
function fun_down_from_file(){
	vi url_file
	url_f="url_file"
	ap_f="-a"
	url_v=""
}

## this is yt-dlp function.
## main command function.
function fun_yt_dlp(){
yt-dlp $skp $Format_list $Format_video $pl_s $S_item $pl_e $E_item $List_subs $Write_sub $Sub_lang $lng $write_auto_sub $lcte $url_v $v_url_list
}

## this is funcion download from url.
function fun_URL(){
for ((counter=1; counter<=4; counter++)); do
fun_options_down_from_url
read options_u
func_test_variables_read $options_u

if (test $options_u -eq 1 )
then
	fun_format_vid_down

elif (test $options_u -eq 2)
then
	fun_output

elif (test $options_u -eq 3)
then
	fun_plst_format_from_url
elif (test $options_u -eq 8)
then
break
else 
	fun_exit
fi

		done
echo "Enter $type_url URL"
read url_v

fun_yt_dlp
}

## this is function download from file.
function fun_URL_File(){
for ((counter=1; counter<=4; counter++)); do
fun_options_down_from_url_file
read options_uf
func_test_variables_read $options_uf
if (test $options_uf -eq 1)
then
	#vi urlfile.txt
	filename="urlfile.txt"

	for counter in $(cat "$filename")
	do
		yt-dlp -F $counter
		echo "Enter ID formatting for video"
		read ID_format_uf
		fun_output
		Format_option="-f"
		yt-dlp $Format_option $ID_format_uf $lcte $counter
	done
break
elif (test $options_uf -eq 2)
then
	fun_format_vid_down

elif (test $options_uf -eq 3)
then
	fun_output

elif (test $options_uf -eq 8)
then
fun_down_from_file

yt-dlp $Format_list $Sub_list $Format_video $pl_s $S_item $pl_e $E_item $ap_f $url_f $lcte
break
else
	fun_exit
fi
done

}

##
function fun_download(){
fun_method_download    # function method download.
read S_down
func_test_variables_read $S_down
if (test $S_down -eq 1)
then
	fun_URL
elif (test $S_down -eq 2)
then
	fun_URL_File
else
	fun_exit
fi
}

## variables.
Format_list=""
Format_video=""
lcte=""
pl_s=""
S_item=""
pl_e=""
E_item=""
ap_f="--no-batch-file"
List_subs=""
write_auto_sub=""
Write_sub=""
Sub_lang=""
lng=""
skp=""
type_url="Video"
var_plst_file=0


fun_show_list	# function show lists.

read var_show
func_test_variables_read $var_show
if (test $var_show -eq 1)
then
	fun_format_list
	fun_format_vid_down
elif (test $var_show -eq 2)
then
	fun_subttl_list
	fun_subttl_down

elif (test $var_show -eq 3)
then
	fun_plst_format_list_from_url
elif (test $var_show -eq 0)
then
	fun_download
else
	fun_exit
fi
