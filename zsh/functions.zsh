function ex()
{
	if [ -f $1 ] ; then
	case $1 in
		*.tar.gz)  tar xzf $1   ;;
		*.rar)     unrar x $1   ;;
		*.gz)      gunzup $1    ;;
		*.tar)     tar xf $1    ;;
		*.zip)     unzip $1     ;;
		*.tar.xz)  tar xf $1    ;;
		*)   echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
	echo "'$1' is no a valid file"
	fi
}
