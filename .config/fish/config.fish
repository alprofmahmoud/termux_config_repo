if status is-interactive
    # Commands to run in interactive sessions can go here
end
figlet -f standard Prof

set -U fish_greeting

function fish_greeting
    echo Hello friend!
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end
