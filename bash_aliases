###########################################
#
# Load file from your bash files
#
#
# #Source custom config from v20100t.linux-config.github.com
#
# if [ -f /etc/bashrc ]; then
# 	. /etc/bashrc
# fi
#
###########################################
#
# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# More alias  http://www.itworld.com/operating-systems/59407/handy-dandy-aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias back='cd $OLDPWD'
alias rm='rm -i'
alias del='rm -i'
alias ff="find / -type f -name"
alias f.="find . -type f -name"
alias dirs='ls -d */'
alias hg='history | grep '


alias ll='ls -alh'
alias ps='ps aux'


#liste les alias et functions
function listba(){
cat .bashrc|egrep "alias|function"|grep -v "^#"|most
}


# Calendrier du mois avec le jour en cours en rouge:
alias cal='var=$(/usr/bin/cal -m); echo "${var/$(date +%-d)/$(echo -e "\033[1;31m$(date +%-d)\033[0m")}"'

# les 10 plus gros fichiers/rértoires du réroitre en cours
alias topten='du -sk $(/bin/ls -A) | sort -rn | head -10'

# change le titre de la fenêe de la console
t () {
    echo -ne "\\e]2;$1\\a"
}

# More Alias :
alias l='ls -CFa'

# Alias  Commande cdl cd + ls
cdl() { cd "$@" && ls; }

# Alias web logs
alias logs='tail -f /etc/httpd/logs/access_log /etc/httpd/logs/error_log /var/log/mariadb/mariadb.log'

