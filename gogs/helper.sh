#!/bin/bash 

# $1 = package name
# $2 = target directory path
# $3 = branch/commit/revision string, if empty then maste ist used
function go_get {
  if [[ $1 == github.com* ]]
  then 
    get_git $1 $2 $3
  elif [[ $1 == code.google.com* ]]
  then 
    if [[ $3 == "master" ]]
    then
      hg clone https://$1 $2
    else
      hg clone https://$1 -r $3 $2
    fi
  else
    echo "ERROR"
  fi
}

# $1 = git package
# $2 = target directory path
# $3 = branch/commit/revision string, if empty then maste ist used
function get_git {
  git clone https://$1 $2
  if [[ $3 != "master" ]] && [[ ${3:1} == commit* ]]
  then
    cd $2
    git checkout ${3:8:7}
  fi
}

# Read the .gopmfile file and clone the branch/commits of the depends
# $1 = .gopmfile file path
# $2 = target directory path
function get_gopm {
  local startStr=""

  while read line
  do
    if [[ $startStr == 'X' ]] && [[ $line == '' ]]
    then
      break
    elif [[ $startStr == 'X' ]]
    then
      IFS="=" read -a array <<< "$line"
      if [[ ${array[1]} != "" ]]
      then
        go_get ${array[0]} "$2/${array[0]}" ${array[1]}
      else
	#echo ${array[0]}
        #echo "$2/${array[0]}"
        go_get ${array[0]} "$2/${array[0]}" master
      fi
    elif [[ $line == '[deps]' ]]
    then
      startStr="X"
    fi
  done <$1
}