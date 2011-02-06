#!/bin/bash
#
# Auto par2 and unrar (c) 2008-2010 Ike Devolder
#

## some functions to make it look nicer
success() { echo -e "\e[1;32m$1\e[0;39;49m"; }

info() { echo -e "\e[1;33m$1\e[0;39;49m"; }

error() { echo -e "\e[1;31m$1\e[0;39;49m"; }

function elementExistsPar()
{
  if [ -z "$1" ]
  then
    return
  fi
  for i in ${arrTmp[@]}
  do
    if [ $i == $1 ]
    then
      return 1
    fi
  done
  return 0
}

function repairByPars()
{
  info "  >> repairing by ${1}";
  echo "    par2repair ${1}";
  par2repair "${1}" 1>/tmp/par2unrar.log 2>&-;
  if [ $? -eq 0 ]; then
    success "    success";
    tmp=`echo ${1//\.par2/}`;
    tmp=`echo ${tmp//\.vol*/}`;
    info "  >> removing pars";
    rm -f ${tmp}*[Pp][Aa][Rr]2;
  else
    error "    failed";
    tmp=`echo ${1//\.par2/}`;
    tmp=`echo ${tmp//\.vol*/}`;
    cat /tmp/par2unrar.log | egrep "Target.*(missing|damaged)|able to repair";
  fi
  rm -f /tmp/par2unrar.log
}

## script information
info "+--------------------------------------------------------------------+";
info "| This script will try to automaticaly repair by the parfiles in the |";
info "| current directory and then try to unrar the files in the current   |";
info "| directory. when successfull the par and rar files will be removed. |";
info "| Use this script at your own risk, the author is not responsible    |";
info "| for possible dataloss.                    2008 - 2010 Ike Devolder |";
info "+--------------------------------------------------------------------+";
echo

## repair files
info "<< Start trying to repair files >>";
pars=()
arrTmp=()
IFS=$'\n'
for par in *.[Pp][Aa][Rr]2;do
  exist=0;
  tmp=`echo ${par//\.par2/}`;
  tmp=`echo ${tmp//\.vol*/}`;
  elementExistsPar ${tmp}
  if [ $? -eq 0 ]; then
    pars=( "${pars[@]}" "${par}" )
    arrTmp=( "${arrTmp[@]}" "${tmp}" )
  fi
done
for par in ${pars[@]}; do
  repairByPars ${par}
done

## extract files
rars=(`ls -1 * | egrep "part0?0?0?0?1\."` `ls -1 *.rar 2>&- | grep -v part`);
info "<< Start unrar >>";
for filename in ${rars[@]}; do
  info "  >> extract ${filename}";
  echo "    unrar x ${filename}";
  unrar x -y ${filename} 1>&- 2>&-;
  if [ $? -eq 0 ]; then
    success "    success"
    tmp=`echo ${filename//part*\.rar/}`;
    tmp=`echo ${tmp//rar/}`;
    info "  >> removing rars";
    rm -f ${tmp}*r??;
  else
    error "    failed";
  fi
done

## finish
info "<< hopefully all your files are repaired and extracted >>";

