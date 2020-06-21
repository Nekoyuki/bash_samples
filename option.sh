BASENAME=`echo $1|sed 's/\.[^\.]*s//'`

# Help
#*********************************
function usage() {
cat <<_EOT_
Usage: 
  $BASENAME [-l <loop>] [-v <vdd>] hoge
  $BASENAME -h

Description:
  Argument perser

Options:"
  -l, --loop <loop>
  -v, --vdd <vdd>
  -h, --help

_EOT_
    exit 1
}

# Options
#*********************************
while (( $# > 0 ))
do
    case $1 in
        -h | --help)
            usage
            exit 1
            ;;
        -l | --loop)
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "$BASENAME: '-l|--loop' option requires an argument" 1>&2
                exit 1
            fi
            LOOP=$2
            shift 2
            ;;
        -v | --vdd)
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "$BASENAME: '-v|--vdd' option requires an argument" 1>&2
                exit 1
            fi
            VDD=$2
            shift 2
            ;;
        -- | -)
            shift 1
            argv+=( "$@" )
            break
            ;;
        -*)
            echo "$BASENAME: unrecognized option '$1'" 1>&2
            echo "Try '$BASENAME --help' for more information." 1>&2
            exit 1
            ;;
        *)
            argv+=( "$1" )
            shift
            ;;
    esac
done

if [ ${#argv[@]} -eq 0 ]; then
    usage
fi

echo "LOOP=${LOOP}"
echo "VDD=${VDD}"
echo "argv=${argv[@]}"
