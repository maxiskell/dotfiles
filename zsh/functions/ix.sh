# http://ix.io/ helper
ix() {
  local opts
  local OPTIND
  [ -f "$HOME/.netrc" ] && opts='-n'
  while getopts ":hd:i:n:" x; do
      case $x in
          h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
          d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
          i) opts="$opts -X PUT"; local id="$OPTARG";;
          n) opts="$opts -F read:1=$OPTARG";;
      esac
  done
  shift $(($OPTIND - 1))
  [ -t 0 ] && {
      local filename="$1"
      shift
      [ "$filename" ] && {
          curl $opts -F f:1=@"$filename" $* ix.io/$id
          return
      }
      echo "^C to cancel, ^D to send."
  }
  curl $opts -F f:1='<-' $* ix.io/$id
}
