function mkdirc
    mkdir -p $argv[1] && cd $argv[1]
end

function docker-tty
    screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
end

set -U EDITOR vim
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"

set -x GOPATH $HOME
set -x GOROOT $HOME/go

set -px PATH $GOROOT/bin
set -px PATH $GOPATH/bin
set -px PATH $GOPATH/src/github.com/uber/go-torch/FlameGraph
set -px PATH /opt/local/bin
set -px PATH /opt/local/sbin
set -px PATH /usr/local/sbin
set -px PATH $HOME/.cargo/bin
set -px PATH /usr/local/opt/libpq/bin
set -px PATH /Users/nk2ge5k/yandex-cloud/bin

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color yellow
	echo -n (whoami)
	set_color blue
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '> '
	set_color normal
end

function fish_greeting
	echo -e (uname -rs | awk '{print "\\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime | sed 's/^up //' | awk '{print "\\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print "\\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e "\n"

	set_color normal
end
