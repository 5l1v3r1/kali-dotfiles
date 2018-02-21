# basic shortcuts
alias ll='ls -lFh'
alias la='ls -alFh'
alias l1='ls -1'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias cat='ccat'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd-='cd -'
alias mkdir='mkdir -p -v'
alias cpr='cp -Rv'
alias cprs='rsync -r --info=progress2'
alias ch='printf "\033c"'
alias src='source ~/.bashrc'
alias ex='extract'


# system administration
alias free='free -mt'
alias ps='ps auxf'
alias ht='htop'
alias cputemp='sensors | grep Core'
alias vpncfg='sudo openvpn --config'


# directories
alias h='cd ~/'
alias dk='cd ~/Scrivania'
alias dl='cd ~/downloads'
alias p='cd ~/programming'
alias pen='cd ~/pentest'
alias t='cd ~/tools'
alias v='cd /opt/vpn'
alias fm='thunar $PWD'


## systemctl commands
# running services
alias scrun='sudo systemctl -t service -a --state running --no-page --no-legend'

# failed units
alias scfailed='sudo systemctl --failed | head -n -6 | tail -n -1'

# status of service
alias scstatus='sudo systemctl status'

# start service
function scstart {
    sudo systemctl start "$1"
    sudo systemctl status "$1"
}

# stop service
function scstop {
    sudo systemctl stop "$1"
    sudo systemctl status "$1"
}

# restart service
function screstart {
    sudo systemctl restart "$1"
    sudo systemctl status "$1"
}


# function extract for common archive formats
function extract {
    if [[ -z "$1" ]]; then
        # display usage if no parameters given
        echo "Usage: extract <archive file>"
        return 1
    else
        for n in "$@"; do
            if [[ -f "$n" ]]; then
                case "${n%,}" in
                    *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                                tar xvf "$n"       ;;
                    *.lzma)     unlzma ./"$n"      ;;
                    *.bz2)      bunzip2 ./"$n"     ;;
                    *.rar)      unrar x -ad ./"$n" ;;
                    *.gz)       gunzip ./"$n"      ;;
                    *.zip)      unzip ./"$n"       ;;
                    *.z)        uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                                7z x ./"$n"        ;;
                    *.xz)       unxz ./"$n"        ;;
                    *.exe)      cabextract ./"$n"  ;;
                    *)
                echo "extract: '$n' - unknown archive format"
                return 1
                esac
            else
                echo "'$n' - file does not exist"
            return 1
            fi
        done
    fi
}
