#!/bin/bash

INI_FILE=${1}
declare -A param

usageversion () {
progname="`basename \"$0\"`"
  cat >&2 <<END

Usage: $progname

Options:
     -c,  --csv           print csv  format
     -t,  --tsv           print tsv  format
     -j,  --json          print json format

     -h,  --help          print this message
     -v,  --version       print this message

Description:
     

Exsample:
  # $progname /etc/mysql/my.cnf -t
    client	port	3306
    client	socket	/var/run/mysqld/mysqld.sock
    mysqld_safe	socket	/var/run/mysqld/mysqld.sock
    mysqld_safe	nice	0

END
}

function print_tsv() {
  printf "${1}\t${2}\t${3}\n"
}

function print_csv() {
  printf "${1},${2},${3}\n"
}

function main(){
  grep -ve "^#" -e "^$" $INI_FILE |while IFS='= ' read var val ;do
    if [[ $var == \[*] ]] ;then
      section="$(echo $var | sed -e 's/\[//;s/\]//')"
    elif [[ $var ]] ;then
      if [ $format == 'csv' ] ;then
        print_csv $section $var $val
      elif [ $format == 'json' ] ;then
        param["$var"]="$val"
      else
        print_tsv $section $var $val
      fi
    fi
  done
  if [ $format == 'json' ] ;then
    printf {"responseBean": { "$section": { "$var": "param["$var"]", "$var": "param["$var"]"}}}
  fi
}  

# main
while true ; do
    case "$2" in
        -h|--help)    usageversion;   exit 0 ;;
        -v|--version) usageversion;   exit 0 ;;
        -c|--csv)  format=csv ; main ;  exit 0 ;;
        -t|--tsv)  format=tsv ; main ;  exit 0 ;;
        -j|--json) format=json; main ;  exit 0 ;;
        *)         format=tsv ; main ;  exit 0 ;;
    esac
done
