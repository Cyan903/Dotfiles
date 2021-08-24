# Search from wiki
csh() {
	search_term=$(echo $@ | sed 's/ /+/g')
	curl "https://cheat.sh/${search_term}"
}
