# Search from wiki
csh() {
	search_term=$(echo $@ | sed 's/ /+/g')
	curl "https://cheat.sh/${search_term}"
}

# Alias
alias ll="ls -l"
alias myip="curl https://checkip.amazonaws.com"
alias clearfull="cat /dev/null > ~/.bash_history && history -c && exit"

# Style
neofetch

# Powerline shell isn't my thing rn.
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi