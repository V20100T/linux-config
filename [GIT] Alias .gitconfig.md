# Les aliases pour GIT  en console: 



http://www.draconianoverlord.com/2010/03/04/git-config.html

git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
OK



# BY Daniel from Bookeen , modif by Vinz :

#Git environment and configuration

## ~/.gitconfig

```
[user]
    name = v20100t
    email = v20100t@gmail.com

[color]
	status = auto
	diff = auto
    ui = auto
[color "status"]
	added = green
	untracked = magenta
	deleted = red
[push]
    default = current
[alias]
	st = status
	cp = cherry-pick
	ready = rebase -i @{u}
	ls = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Ccyan\\ [%cn]" --decorate
	lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
	ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Ccyan\\ [%cn]" --decorate --numstat
	lnc = log --pretty=format:"%h\\ %s\\ [%cn]"
	lds = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Ccyan\\ [%cn]" --decorate --date=short
	ld = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Ccyan\\ [%cn]" --decorate --date=relative
	le = log --oneline --decorate
	dr  = "!f() { git diff "$1"^.."$1"; }; f"
	lc  = "!f() { git ll "$1"^.."$1"; }; f"
	diffr  = "!f() { git diff "$1"^.."$1"; }; f"
	standup = log --since yesterday
	co = checkout
	cl = clone
	ci = commit
	pu = push
	br = branch
	cm = commit -m
	sl = stash list
	sa = stash apply
	ss = stash save
	sp = stash pop
	s = stash
	master = checkout master
	ignore = !([ ! -e .gitignore ] && touch .gitignore) | echo $1 >>.gitignore
	done = "!f() { git branch | grep "$1" | cut -c 3- | grep -v done | xargs -I{} git branch -m {} done-{}; }; f"
	chmod = config core.fileMode
	#up = pull --rebase

	# Set Upstream  =====
        su  = "!git branch -u origin/\"$(git rev-parse --abbrev-ref HEAD)\""
        # Push branch =====
        pb  = "!git push origin \"$(git rev-parse --abbrev-ref HEAD)\""
        # pull upstream =====
        up  = "!git pull --rebase origin \"$(git rev-parse --abbrev-ref HEAD)\""

[core]
    editor = vi
```

## ~/.bashrc

```
# Colors
NoColor="\033[0m"
Cyan="\033[0;36m"
Green="\033[0;32m"
Red="\033[0;31m" 
Yellow="\033[0;33m"

# Chars
RootPrompt="\#"
NonRootPrompt="\$"

# Contextual prompt
prompt() {

        USERNAME=`whoami`
        HOSTNAME=`hostname -s`
        #CURRENTPATH=`pwd | sed "s|$HOME|~|g"`

        # Change the Window title
        WINDOWTITLE="$USERNAME@$HOSTNAME"
        echo -ne "\033]0;$WINDOWTITLE\007"

        # Change the dynamic prompt
        #LEFTPROMPT="$Yellow$CURRENTPATH"
        LEFTPROMPT="\[$Cyan\]$USERNAME@$HOSTNAME":"\[$Yellow\]\w"

        GITSTATUS=$(git status 2> /dev/null)
        if [ $? -eq 0 ]; then
                echo $GITSTATUS | grep "not staged" > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                        LEFTPROMPT=$LEFTPROMPT"\[$Red\]"
                else
                        LEFTPROMPT=$LEFTPROMPT"\[$Green\]"
                fi
                # BRANCH=`git describe --contains --all HEAD`
                BRANCH=`git rev-parse --abbrev-ref HEAD`
                LEFTPROMPT=$LEFTPROMPT" ["$BRANCH"]"
        fi

        if [ $EUID -ne 0 ]; then
                PS1=$LEFTPROMPT"\[$NoColor\] "$NonRootPrompt" "
        else
                PS1=$LEFTPROMPT"\[$NoColor\] "$RootPrompt" "
        fi

        # echo -e -n $LEFTPROMPT        
}

# Define PROMPT_COMMAND if not already defined (fix: Modifying title on SSH connections)
if [ -z "$PROMPT_COMMAND" ]; then
        case $TERM in
        xterm*)
                PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
        screen)
                PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
        esac
fi
 
# Main prompt
PROMPT_COMMAND="prompt;$PROMPT_COMMAND"
 
if [ $EUID -ne 0 ]; then
        PS1=$NonRootPrompt" "
else
        PS1=$RootPrompt" "
fi
```




