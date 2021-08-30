# Search from wiki
csh() {
	search_term=$(echo $@ | sed 's/ /+/g')
	curl "https://cheat.sh/${search_term}"
}

# Clear full
clearfull() {
	cat /dev/null > ~/.bash_history && history -c && exit
}

# Alias
alias ll="ls -l"
alias myip="curl https://checkip.amazonaws.com"
