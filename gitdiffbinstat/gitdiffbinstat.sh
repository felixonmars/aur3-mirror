#!/bin/bash


#    gitdiffbinstat - gets a git diff --shortstat-like output for changed binary files
#    Copyright (C) 2012  Matthias Krüger

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 1, or (at your option)
#    any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA  02110-1301 USA



# function to get calculates bytes into kbytes, mbytes etc
sizecalc() {
	outputunit=b
	input=$1
	color=$2
	if [ ${input} == 0 ] ; then
		echo -n ""
	else
		outputval=${input}
		((outputkilo=${outputval}/1024))
		if [ ! "${outputkilo}" == 0 ] ; then
			outputunit=kb
			outputval=${outputkilo}
			((outputmega=${outputkilo}/1024))
			if [ ! "${outputmega}" == 0 ] ; then
				outputunit=Mb
				outputval=${outputmega}
				((outputgiga=${outputmega}/1024))
				if [ ! "${outputgiga}" == 0 ] ; then
					outputunit=Gb
					outputval=${outputgiga}
				fi
			fi
		fi
		echo "${NC}(${color}${outputval} ${outputunit}${NC})"
	fi
}

# function to get correct singular/plural form of stuff
pluralsingular() {
	number=$1
	word1=$2
	word2=$3
	if [ -z "${word2}" ] ; then # 12 foo
		if [ "${number}" == "1" ] ; then # 1 foo
			word1="${word1}"
		else
			word1="${word1}s" # 3 foos
		fi
		echo "${number} ${word1}" #  echo 3 foos
	else
		if [ "${word2}" == "HIDE" ] ; then
			if [ "${number}" == "1" ] ; then # echo 1 uber foo
				word1="${word1}" # 1 uber foo
			else
				word1="${word1}s" #  3 uber foos
			fi
			echo "${word1}"  # uber
		else
			if [ "${number}" == "1" ] ; then # echo 1 uber foo
				word2="${word2}" # 1 uber foo
			else
				word2="${word2}s" #  3 uber foos
			fi
			echo "${number} ${word1} ${word2}" # echo 1 uber foo
		fi
	fi
}

# colors
RED='\e[033;31m'
GREEN='\e[033;32m'
GREENUL='\e[4;32m'
WHITEUL='\e[4;02m'
NC='\e[0m'


# the thing we feed into the script
obj=$1

# in order to avoid conflicts when starting the script twice, get unix time + nanoseconds and
# append them to the diffstat file
timestamp=`date +%s%N`

diffstat=/tmp/gitdiffstat.${timestamp}
diffstat_awkbin=/tmp/gitdiffstat_awkbin.${timestamp}
diffstat_renames=/tmp/gitdiffstat_renames.${timestamp}
diffstat_adds_dels_mods=/tmp/gitdiffstat_addsdelsmods.${timestamp}
diffstat_M100_awkbin=/tmp/gitdiffstat_M100_awkbin.${timestamp}
# If no argument is given, print this how-to.
if [ -z "${obj}" ] ; then
	echo "Usage: \"gitdiffbinstat [<commit/branch/tag/HEAD>]\""
	echo "Make sure to be in a git repo!"
	exit 1
fi

# Check if we are actually in a git repo
if [[ $(git rev-parse --is-inside-work-tree) != "true" ]] >& /dev/null ; then
	echo "fatal: Not a git repository!"
	echo "Make sure to be in a git repo!"
	exit 2
fi


# Check if git can associated the input with anything usefull
if [ ! `git rev-parse --quiet --verify ${obj}` ] ; then
	echo "fatal: git could not associate '${obj}' with anything useful"
	exit 3
fi

# get current branch
curbranch=`git branch | awk '/^\*\ /' | sed -e 's/\*\ //'`
# get current commit hash
curcommit=`git rev-parse HEAD`
# print what we compare with   git diff
objhash=`git log -1 --format="%H" ${obj}`
objbranch=`git symbolic-ref HEAD 2>&1`
if [[ ! "${objbranch}" == *HEAD* ]] ; then
	curbranch=`echo ${objbranch:11}`
else
	curbranch=${objhash}
fi

echo " ${curbranch} -> ${obj}"
echo " ${curcommit} -> ${objhash}"


# ${PWD} = directory we are currently in

gitrootdirpre=`git rev-parse --show-toplevel`
# if we have a dir named "…·µ@", this part of the script will fail, but I think it's quite unlikely
# and yes, it's a hack
gitrootdir=`echo -n ${gitrootdirpre} | tr "/" "…·µ@"`
pwd2=`echo ${PWD} | tr "/" "…·µ@"`
dir=`echo  ${pwd2} | sed  s/^${gitrootdir}// | tr "…·µ@" "/" | sed -e 's/^\//.\//'`
if [ -z "${dir}" ] ; then
	dir=./
fi
printf " Recursively getting stat for path \"${dir}\" from repo root"



# get the actuall diff we are going to process
git diff ${obj} --stat ./ > ${diffstat} ; printf .



# If there are no changes, exit
checksum=`awk '/\ *Bin\ /' "${diffstat}" | wc -l`
if [ "${checksum}" == "0" ] ; then
	printf "\n"
	echo " No binary files changed, exiting..."
	rm ${diffstat}
	exit 1
fi

# get the remaining diffs...
git diff ${obj} -M100% -l999999 --stat=1000,2000 --diff-filter="R" ./  | awk '/>/' > ${diffstat_renames} ; printf . &
git diff ${obj} -M100% -l999999 --stat=1000,2000 --diff-filter="A|M|D" ./  > ${diffstat_adds_dels_mods} ; printf . &
git diff ${obj} -M100% --diff-filter="M" --stat  | awk '/\ *Bin/' > ${diffstat_M100_awkbin} ; printf . &
cat ${diffstat} | awk '/\ \|\ *Bin\ /' > ${diffstat_awkbin} ; printf . &
wait
printf "\n"

# how many files changed?
git_diffstat_normal=`tail -1 "${diffstat}"`
overall_changed_files_amount=`echo ${git_diffstat_normal} | awk '{print $1}'`
overall_changed_files_amount_output=`pluralsingular ${overall_changed_files_amount} file`
echo " ${overall_changed_files_amount_output} changed in total"


# text file changes (insertions, deletions, ratio)
	# generate our own  git diff --shortstat
git_diffstat_insertions=`echo ${git_diffstat_normal} | tr "," "\n" | awk /insertion/ | grep -o "[0-9]*"` || git_diffstat_insertions="0"
git_diffstat_deletions=`echo ${git_diffstat_normal} | tr "," "\n" | awk /deletion/ | grep -o "[0-9]*"` || git_diffstat_deletions="0"
	echo "${git_diffstat_insertions}" > /dev/null &
	echo "${git_diffstat_deletions}" > /dev/null &
	wait

git_status_change_rate=`expr ${git_diffstat_insertions} - ${git_diffstat_deletions}`
git_status_change_files_amount=`echo ${git_diffstat_normal} | awk '{print $1}'`
global_text_insertions=`echo ${git_diffstat_normal} | tr "," "\n" | awk /insertion/ | grep -o "[0-9]*"` || global_text_insertions="0"
global_text_deletions=`echo ${git_diffstat_normal} | tr "," "\n" | awk /deletion/ | grep -o "[0-9]*"` || global_text_deletions="0"
	echo "${git_status_change_rate}" > /dev/null &
	echo "${git_status_change_files_amount}" > /dev/null &
	echo "${global_text_insertions}" > /dev/null &
	echo "${global_text_deletions}" > /dev/null &
	wait

global_text_ratio=`expr $global_text_insertions - $global_text_deletions`

git_status_text_file_change_amount=`cat "${diffstat}" | sed -e '/\ *Bin\ /d' -e '/)$/d' | wc -l`
git_status_text_file_change_amount_output=`pluralsingular ${git_status_text_file_change_amount} text file`


if [ "${git_status_change_rate}" -gt 0 ] ; then
	git_status_change_rate_end="${GREEN}+${git_status_change_rate} lines${NC}"
elif [ "${global_text_ratio}" == 0 ] ; then
	git_status_change_rate_end="±${git_status_change_rate} lines"
else
	git_status_change_rate_end="${RED}${git_status_change_rate} lines${NC}"
fi


insertions1=`pluralsingular ${global_text_insertions} insertion HIDE`
deletions1=`pluralsingular ${global_text_deletions} deletion HIDE`
	echo "${insertions1}" > /dev/null &
	echo "${deletions1}" > /dev/null &
	wait
echo -e "  ${git_status_text_file_change_amount_output} changed, ${GREEN}${global_text_insertions}${NC} ${insertions1}(${GREEN}+${NC}), ${RED}${global_text_deletions}${NC} ${deletions1}(${RED}-${NC}) => [${git_status_change_rate_end}]"


# did we rename text files?
git_diffstat_addsdelsmods=`tail -1 "${diffstat_adds_dels_mods}"`
addsdelsmods_text_insertions=`echo ${git_diffstat_addsdelsmods} | tr "," "\n" | awk /insertion/ | grep -o "[0-9]*"` || addsdelsmods_text_insertions="0"
addsdelsmods_text_deletions=`echo ${git_diffstat_addsdelsmods} | tr "," "\n" | awk /deletion/ | grep -o "[0-9]*"` || addsdelsmods_text_deletions="0"
	echo "${addsdelsmods_text_insertions}" > /dev/null &
	echo "${addsdelsmods_text_deletions}" > /dev/null &
	wait

renamed_textlines_insertions=`expr $global_text_insertions - $addsdelsmods_text_insertions`
renamed_textlines_deletions=`expr $global_text_deletions - $addsdelsmods_text_deletions`
	echo "${renamed_textlines_insertions}" > /dev/null &
	echo "${renamed_textlines_deletions}" > /dev/null &
	wait

if [[ $renamed_textlines_insertions != $renamed_textlines_deletions ]] ; then
	echo "ERROR: renamed_textlines_insertions \!= renamed_textlines_deletions"
	exit
fi


textfiles_renamed=`awk '/.*0$/' ${diffstat_renames} | wc -l`

if [ ${textfiles_renamed} != "0" ] ; then # yes, we did
	textfiles_renamedx2=`calc -p ${textfiles_renamed}*2`
	textfiles_modified=`cat ${diffstat_adds_dels_mods} | grep -v "bytes$\|)$" | wc -l`
		echo "${textfiles_renamedx2}" > /dev/null &
		echo "${textfiles_modified}" > /dev/null &
		wait

	# renames
	textfiles_renamed_out=`pluralsingular ${textfiles_renamed} file HIDE`
	lines_textfiles_renamed_out=`pluralsingular ${renamed_textlines_insertions} line HIDE`
	echo -e "   ${textfiles_renamedx2} due to renaming of ${WHITEUL}${textfiles_renamed}${NC} text ${textfiles_renamed_out} [${WHITEUL}${renamed_textlines_insertions}${NC} ${lines_textfiles_renamed_out} moved]"
	# everything but renames
	textfiles_modified_out=`pluralsingular ${textfiles_modified} text file`
	insertions2=`pluralsingular ${addsdelsmods_text_insertions} insertion HIDE`
	deletions2=`pluralsingular ${addsdelsmods_text_deletions} deletion HIDE`
		echo "${textfiles_modified_out}" > /dev/null &
		echo "${insertions2}" > /dev/null &
		echo "${deletions2}" > /dev/null &
		wait

	echo -e "   ${textfiles_modified_out} modified, ${GREEN}${addsdelsmods_text_insertions}${NC} ${insertions2}(${GREEN}+${NC}), ${RED}${addsdelsmods_text_deletions}${NC} ${deletions2}(${RED}-${NC}) => [${git_status_change_rate_end}]"
fi


# binary files changed, general stats
binary_files_change_amount=`cat ${diffstat_awkbin} | wc -l`
binary_file_modified_size_before=`cat ${diffstat_awkbin} | awk '{ sum+=$4} END {print sum}'`
binary_file_modified_size_after=`cat ${diffstat_awkbin} | awk '{ sum+=$6} END {print sum}'`
	echo "${binary_files_change_amount}" > /dev/null &
	echo "${binary_file_modified_size_before}" > /dev/null &
	echo "${binary_file_modified_size_after}" > /dev/null &
	wait

binary_file_modified_size_before_size=`sizecalc ${binary_file_modified_size_before}`
binary_file_modified_size_after_size=`sizecalc ${binary_file_modified_size_after}`
binary_file_modified_size_rate=`expr ${binary_file_modified_size_after} - ${binary_file_modified_size_before}`
	echo "${binary_file_modified_size_before_size}" > /dev/null &
	echo "${binary_file_modified_size_after_size}" > /dev/null &
	wait


if [ "${binary_file_modified_size_rate}" -gt 0 ] ; then
	binary_file_modified_size_rate_end="${GREEN}+${binary_file_modified_size_rate} b${NC} `sizecalc ${binary_file_modified_size_rate} ${GREEN}`"
elif [ "${binary_file_modified_size_rate}" == 0 ] ; then
	binary_file_modified_size_rate_end="±${binary_file_modified_size_rate} b `sizecalc ${binary_file_modified_size_rate} ${NC}`"
else
	binary_file_modified_size_rate_end="${RED}${binary_file_modified_size_rate} b${NC} `sizecalc ${binary_file_modified_size_rate} ${RED}`"
fi

echo -e "  ${binary_files_change_amount} binary files changed ${RED}${binary_file_modified_size_before} b${NC} `sizecalc ${binary_file_modified_size_before} ${RED}` -> ${GREEN}${binary_file_modified_size_after} b${NC}`echo -n " " ; sizecalc ${binary_file_modified_size_after} ${GREEN}` => [${binary_file_modified_size_rate_end}]" | sed s/\ \ -/\ -/


# did we add/remove/modify binary files?
binary_files_added_amount=`cat ${diffstat} | awk '/Bin\ 0\ ->\ /' | wc -l`
binary_files_removed_amount=`cat ${diffstat} | awk '/\ ->\ 0\ bytes$/' | wc -l`
	echo "${binary_files_added_amount}" > /dev/null &
	echo "${binary_removed_added_amount}" > /dev/null &
	wait

binary_files_amount_change_ratio_pre=`expr ${binary_files_added_amount} - ${binary_files_removed_amount}`
binary_files_modified_amount=`expr ${binary_files_added_amount} + ${binary_files_removed_amount} - ${binary_files_change_amount} | sed s/^-//`
	echo "${binary_files_amount_change_ratio_pre}" > /dev/null &
	echo "${binary_files_modified_amount}" > /dev/null &
	wait


if [ "${binary_files_amount_change_ratio_pre}" -gt 0 ] ; then
	binary_files_amount_change_ratio_end="${GREEN}+${binary_files_amount_change_ratio_pre} files${NC}"
elif [ "${binary_files_amount_change_ratio_pre}" == 0 ] ; then
	binary_files_amount_change_ratio_end="±${binary_files_amount_change_ratio_pre} files"
else
	binary_files_amount_change_ratio_end="${RED}${binary_files_amount_change_ratio_pre} files${NC}"
fi

binary_files_added_amount_out=`pluralsingular ${binary_files_added_amount} file HIDE`
binary_files_removed_amount_out=`pluralsingular ${binary_files_removed_amount} file HIDE`
binary_files_modified_amount_out=`pluralsingular ${binary_files_modified_amount} file HIDE`
	echo "${binary_files_added_amount_out}" > /dev/null &
	echo "${binary_files_removed_amount_out}" > /dev/null &
	echo "${binary_files_modified_amount_out}" > /dev/null &
	wait

echo -e "   ${GREEN}${binary_files_added_amount}${NC} binary ${binary_files_added_amount_out} added, ${RED}${binary_files_removed_amount}${NC} binary files removed, ${binary_files_modified_amount} binary ${binary_files_modified_amount_out} modified => [${binary_files_amount_change_ratio_end}]"




# did we rename binary files?
binary_files_renamed_amount=`awk '/\ \|\ *Bin\ .*\ ->\ /' ${diffstat_renames} | wc -l`
if  [ "${binary_files_renamed_amount}" != "0" ] ; then  # yes, we did
	binary_files_renamed_size_before=`awk '/\ \|\ *Bin\ .*\ ->\ /' ${diffstat_renames} | awk '{ sum+=$6} END {print sum}'`
	binary_files_renamed_size_after=`awk '/\ \|\ *Bin\ .*\ ->\ /' ${diffstat_renames} | awk '{ sum+=$8} END {print sum}'`
		echo "${binary_files_renamed_size_before}" > /dev/null &
		echo "${binary_files_renamed_size_after}" > /dev/null &
		wait

	binary_files_renamed_size_after_size=`sizecalc ${binary_files_renamed_size_after}`
	binary_files_renamed_amount_out=`pluralsingular ${binary_files_renamed_amount} file HIDE`

	echo -e "    ${WHITEUL}${binary_files_renamed_amount}${NC} binary ${binary_files_renamed_amount_out} renamed [moved ${WHITEUL}${binary_files_renamed_size_after} b${NC} `sizecalc ${binary_files_renamed_size_after} ${WHITEUL}`]"

	if [[ $binary_files_renamed_size_after != $binary_files_renamed_size_before ]] ; then
		echo "ERROR   binary_files_renamed_size_after \!= binary_files_renamed_size_before"
		exit
	fi
fi

# how many bytes changed when
# we added binary files
binary_files_size_added=`cat ${diffstat} | awk '/\ *Bin\ 0/' | awk '{ sum+=$6} END {print sum}'`
if [ -z "$binary_files_size_added" ] ; then
	binary_files_size_added=0
else
	binary_files_size_added_size=`sizecalc ${binary_files_size_added}`
fi
# we removed binary files
binary_files_size_removed=`cat ${diffstat} | awk '/\ 0\ bytes$/' | awk '{ sum+=$4} END {print sum}'`
if [ -z "$binary_files_size_removed" ] ; then
	binary_files_size_removed=0
else
	binary_files_size_removed_size=`sizecalc ${binary_files_size_removed}`
fi
# we changed binary files
binary_files_size_changed_before=`cat ${diffstat_M100_awkbin} | awk '{ sum+=$4} END {print sum}'`
if [ -z "$binary_files_size_changed_before" ] ; then
	binary_files_size_changed_before=0
else
	binary_files_changed_before_size=`sizecalc ${binary_files_size_changed_before}`
fi

binary_files_size_changed_after=`cat ${diffstat_M100_awkbin} | awk '{ sum+=$6} END {print sum}'`
if [ -z "$binary_files_size_changed_after" ] ; then
	binary_files_size_changed_after=0
else
	binary_files_changed_after_size=`sizecalc ${binary_files_size_changed_after}`
fi

binary_files_added_removed_ratio_pre=`expr $binary_files_size_added - $binary_files_size_removed`

if [ "${binary_files_added_removed_ratio_pre}" -gt 0 ] ; then
	binary_files_added_removed_ratio="${GREEN}+${binary_files_added_removed_ratio_pre} b${NC} `sizecalc ${binary_files_added_removed_ratio_pre} ${GREEN}`"
elif [ "${binary_files_added_removed_ratio_pre}" == 0 ] ; then
	binary_files_added_removed_ratio="${binary_files_added_removed_ratio_pre} b`sizecalc ${binary_files_added_removed_ratio_pre} ${NC}`"
else
	binary_files_added_removed_ratio="${RED}${binary_files_added_removed_ratio_pre} b${NC} `sizecalc ${binary_files_added_removed_ratio_pre} ${RED}`"
fi


binary_files_changed_before_after_ratio_pre=`expr $binary_files_size_changed_after - $binary_files_size_changed_before`

if [ "${binary_files_changed_before_after_ratio_pre}" -gt 0 ] ; then
	binary_files_changed_before_after_ratio="${GREEN}+${binary_files_changed_before_after_ratio_pre} b${NC} `sizecalc ${binary_files_changed_before_after_ratio_pre} ${GREEN}`"
elif [ "${binary_files_changed_before_after_ratio_pre}" == 0 ] ; then
	binary_files_changed_before_after_ratio="${binary_files_changed_before_after_ratio_pre} b`sizecalc ${binary_files_changed_before_after_ratio_pre} ${NC}`"
else
	binary_files_changed_before_after_ratio="${RED}${binary_files_changed_before_after_ratio_pre} b${NC} `sizecalc ${binary_files_changed_before_after_ratio_pre} ${RED}`"
fi



binary_files_added_removed__changed_before_after__ratio=`expr $binary_files_added_removed_ratio_pre + $binary_files_changed_before_after_ratio_pre`

if [ "${binary_files_added_removed__changed_before_after__ratio}" -gt 0 ] ; then
	binary_files_added_removed__changed_before_after__ratio="${GREEN}+${binary_files_added_removed__changed_before_after__ratio} b${NC} `sizecalc ${binary_files_added_removed__changed_before_after__ratio} ${GREEN}`"
elif [ "${binary_files_added_removed__changed_before_after__ratio}" == 0 ] ; then
	binary_files_added_removed__changed_before_after__ratio="${binary_files_added_removed__changed_before_after__ratio} b`sizecalc ${binary_files_added_removed__changed_before_after__ratio} ${NC}`"
else
	binary_files_added_removed__changed_before_after__ratio="${RED}${binary_files_added_removed__changed_before_after__ratio} b${NC} `sizecalc ${binary_files_added_removed__changed_before_after__ratio} ${RED}`"
fi

# binary file changes without file renames

echo -e "    ${GREEN}${binary_files_size_added} b${NC} `sizecalc ${binary_files_size_added} ${GREEN}` added in new files, ${RED}${binary_files_size_removed} b${NC} `sizecalc ${binary_files_size_removed} ${RED}` removed => [$binary_files_added_removed_ratio]"
echo -e "    file modifications: ${RED}${binary_files_size_changed_before} b${NC}`echo -n " " ; sizecalc ${binary_files_size_changed_before} ${RED}` -> ${GREEN}${binary_files_size_changed_after} b${NC}`echo -n " " ; sizecalc ${binary_files_size_changed_after} ${GREEN}` => [$binary_files_changed_before_after_ratio]" | sed s/\ \ -/\ -/ | sed s/\ \ =/\ =/ # <- get rid of this!
echo -e "    / ==>  [${binary_files_added_removed__changed_before_after__ratio}]"

# remove the diffstat, we don't need it anymore
rm ${diffstat} ${diffstat_renames} ${diffstat_adds_dels_mods} ${diffstat_awkbin} ${diffstat_M100_awkbin}
