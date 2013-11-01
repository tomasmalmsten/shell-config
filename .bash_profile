#Some tweeking of the shell look and feel:
export CLICOLOR=1
PS1="\[\033[1;30m\][\[\033[1;34m\]\u\[\033[1;30m\]@\[\033[0;35m\]\h\[\033[1;30m\]] \[\033[1;30m\]\W \[\033[0;30m\]\$\[\033[0m\] "

#Setting the default editor to emacs
export EDITOR="emacs"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set the number of open files to be 1024
#ulimit -S -n 1024

# Export maven options passed to the JVM
export MAVEN_OPTS="-XX:MaxPermSize=128m -Xmx512m -Xms128m"

#Make sure /usr/local/bin takes precidence over /usr/bin
export PATH=/usr/local/path:$PATH
#Adding path for /usr/local/sbin
export PATH=$PATH:/usr/local/sbin
#Add my own termainl tools to the path
export PATH=$PATH:~/tools/terminal
#Add mysql to path
export PATH=$PATH:/usr/local/mysql/bin
#Add karaf to path
export PATH=$PATH:/usr/local/Cellar/karaf/current/libexec/bin
