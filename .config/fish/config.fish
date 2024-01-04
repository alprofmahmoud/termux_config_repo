if status is-interactive
    # Commands to run in interactive sessions can go here
end
function nsdv
	bash /data/data/com.termux/files/usr/bin/nsdv.sh
end
function nsdvn
	bash /data/data/com.termux/files/home/nsdv-new.sh
end
function ls
	lsd
end
function la
	lsd -A
end
function ll
	lsd -l
end
function ip
	curl ifconfig.me
end
function gc 
	git clone
end
function cls 
	clear
end
function "pkg ins"
	pkg install
end

figlet -f standard Prof

set -U fish_greeting

function fish_greeting
    echo Hello friend!
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end
function hist
	history | nl
end
