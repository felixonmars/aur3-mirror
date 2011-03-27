#!/bin/bash
# Script Name: paccheck
# Original creator: IgnorantGuru http://igurublog.wordpress.com
# Modified by Bernard Baeyens (berbae) to work with pacman >=3.5
# Requires: wget curl
# License: GNU GENERAL PUBLIC LICENSE Version 3 http://www.gnu.org/licenses/gpl-3.0.txt

# Compare pacman sync and package cache to these mirrors:
# Copy desired mirrors from /etc/pacman.d/mirrorlist and place in single quotes

# For best results, set the first mirror to the same mirror you use in pacman,
#   and use tier 1 mirrors in general
#   http://www.archlinux.org/mirrors/
#   https://www.archlinux.de/?page=MirrorStatus
# Or you can save these to /etc/paccheck/mirrorlist
defmir=(
	'http://mirror.aarnet.edu.au/pub/archlinux/$repo/os/$arch'
	'ftp://ftp5.gwdg.de/pub/linux/archlinux/$repo/os/$arch'
	'http://ftp.tku.edu.tw/Linux/ArchLinux/$repo/os/$arch'
    )

tmp="/tmp/paccheck.tmp"
mirrorlist="/etc/paccheck/mirrorlist"

# Uncomment to hard code $arch
#arch="x86_64"

##############################################################################

help()
{
	cat << EOF
paccheck version 0.8.13
Compares Arch Linux pacman sync and package cache to multiple mirrors to help
detect compromised mirrors

Usage: paccheck [OPTIONS]
OPTIONS:
--install PKG [...] Download packages (without sync) and check ONLY those
                    packages, then offer to install
--compare 'MIRROR'  Fully download and compare all non-expired packages in
                    pacman's pkg cache to MIRROR.  Can alternatively be
                    listed in $mirrorlist as "compare=MIRROR".
                    MIRROR can also be local dir with packages in MIRROR/pkg/
--targets           Limit check and download to current update targets only
--verbose           Show debugging output
--keep              Don't remove temporary files in $tmp
--alt-size          Use alternate slower test of package sizes (useful due
                    to stat bug with btrfs which gives inaccurate results)
--skip-size         Skip test of package sizes
--no-sync           No pacman update - mainly for use in scripts. paccheck
                    requires an updated pacman sync and package cache.
                    Before running "paccheck --no-sync" be sure to run:
                        sudo pacman -Sy
                        sudo pacman -w --noconfirm -Su

Full System Update Procedure:
   1) Run paccheck and examine report
   2) If no package MISMATCH then run "sudo pacman -Su" to update your system

Desired mirrors may be configured in $mirrorlist

NOTE: paccheck only tests these official repositories (if configured):
      core extra community community-staging community-testing
      gnome-unstable kde-unstable multilib multilib-testing staging testing

Exit Status:
    3  Package MISMATCH, download failures, or other errors
    2  Packages missing from some mirrors
    1  Out of sync mirrors (DATABASE CONTENT MISMATCH) or other warnings
    0  All OK

Instructions and updates:
http://igurublog.wordpress.com/downloads/script-paccheck/

EOF
	exit
}

# Parse options
cmx=0
while [ "$1" != "" ];
do
	if [ "${1:0:1}" = "-" ]; then
		case "$1" in
			--help | -help | -h )
				help
				exit
				;;
			--keep )
				keep=1;;
			--diag )
				# unadvertised - repeat the analysis, no download
				# run paccheck with --keep before using --diag
				diag=1;;
			--brief )
				# unadvertised - download a few compare files, not all -
				# for testing purposes only! 
				brief=1;;
			--sample )
				sample=1;;
			--verbose )
				verbose=1;;
			--skip-size )
				skipsize=1;;
			--alt-size )
				altsize=1;;
			--no-sync )
				nosync=1;;
			--targets )
				targets=1;;
			* )
				if [ "${1:0:9}" = "--compare" ]; then
					a="${1:9}"
					a="${a#=}"
					if [ "$a" = "" ]; then
						if [ "${2:0:1}" = "-" ] || [ "$2" = "" ]; then
							echo "ERROR: Option --compare requires an argument"
							exit 3
						fi
						a="$2"
						shift
					fi
					if [ "$a" != "${a%//os/}" ] && [ "${a:0:1}" != "/" ]; then
						a="${a%//os/}/\$repo/os/\$arch"
					elif [ "$a" = "${a/\/os\//}" ] && [ "${a:0:1}" != "/" ]; then
						if [ "$a" = "${a%/}" ]; then
							a="$a/\$repo/os/\$arch"
						else
							a="$a\$repo/os/\$arch"
						fi
					fi
					if [ "$a" = "${a/\$repo//}" ] && [ "${a:0:1}" != "/" ]; then
						echo "ERROR: invalid mirror $a"
						exit 3
					fi
					cmpmir[$cmx]="$a"
					(( cmx++ ))
				elif [ "${1:0:9}" = "--install" ]; then
					a="${1:9}"
					a="${a#=}"
					if [ "$a" = "" ]; then
						if [ "${2:0:1}" = "-" ] || [ "$2" = "" ]; then
							echo "ERROR: Option --install requires an argument"
							exit 3
						fi
					else
						pkglist="$pkglist $a"
					fi
					while [ "$2" != "" ] && [ "${2:0:1}" != "-" ]; do
						pkglist="$pkglist $2"
						shift
					done
				else
					echo "ERROR: Unknown option $1"
					exit 3
				fi
				;;
		esac
	else
		echo "ERROR: Unrecognized argument $1"
		exit 3
	fi
	shift
done

if [ "$(whoami)" = "root" ]; then
	echo "do not run as root"
	exit 3
fi

if [ "$arch" = "" ]; then
	arch=`grep "^CARCH=" /etc/makepkg.conf | sed 's/^CARCH=\"*\([A-Za-z0-9_]*\)\"*/\1/'`
fi
if [ "$arch" = "" ]; then
	echo "ERROR: could not determine \$arch"
	exit 3
fi

if [ -e "$mirrorlist" ]; then
	echo
	echo "Reading mirrors from $mirrorlist..."
	unset mir
	IFSOLD="$IFS"
	IFS=$'\n'
	mlist=`cat "$mirrorlist"`
	mx=0
	for l in $mlist; do
		if [ "$l" != "" ]; then
			# remove whitespace and comments
			while [[ $"${l:0:1}" =~ [[:blank:]] ]]; do
				l="${l:1}"
			done
			l="${l%%#*}"
			lenl="${#l}"
			(( lenl -= 1 ))
			while [[ $"${l:lenl:1}" =~ [[:blank:]] ]]; do
				l="${l:0:lenl}"
				lenl="${#l}"
				(( lenl -= 1 ))
			done
			l="${l%%[[:blank:]]}"
			ll="${l,,}"
			compare=0
			if [ "${ll:0:7}" = "compare" ]; then
				l="${l:7}"
				compare=1
			fi
			l="${l#*=}"
			while [ "${l:0:1}" = " " ]; do
				l="${l## }"
			done
			if [ "$l" != "" ]; then
				if [ "$l" = "${l/\/os\///}" ] && [ "${l:0:1}" != "/" ]; then
					if [ "$l" = "${l%/}" ]; then
						l="$l/\$repo/os/\$arch"
					else
						l="$l\$repo/os/\$arch"
					fi
				fi
				if [ "$l" = "${l/\$repo//}" ] && [ "${l:0:1}" != "/" ]; then
					echo "ERROR: invalid mirror $l"
					exit 3
				elif [ "$l" != "" ]; then
					if (( compare == 1 )); then
						cmpmir[$cmx]="$l"
						(( cmx++ ))
					elif [ "$l" != "" ]; then
						mir[$mx]="$l"
						(( mx++ ))
					fi
				fi
			fi
		fi
	done
	IFS="$IFSOLD"
fi
if [ "${mir[0]}" = "" ]; then
	mir="${defmir[@]}"
fi

# Read pacman defaults
dbpath=`grep "^DBPath.*=" /etc/pacman.conf | sed 's/^DBPath[[:blank:]]*=[[:blank:]]*\(.*\)/\1/'`
cachedir=`grep "^CacheDir.*=" /etc/pacman.conf | sed 's/^CacheDir[[:blank:]]*=[[:blank:]]*\(.*\)/\1/'`
dbpath="${dbpath%% }"
dbpath="${dbpath%%/}"
cachedir="${cachedir%% }"
cachedir="${cachedir%%/}"
if [ "$dbpath" = "" ]; then
	dbpath="/var/lib/pacman/sync"
fi
if [ "$cachedir" = "" ]; then
	cachedir="/var/cache/pacman/pkg"
fi

# Run pacman
echo
echo "NOTE: pacman must be synced and needed packages downloaded"
echo "      for paccheck to work properly."
if (( diag != 1 )) && (( nosync != 1 )) && [ "$pkglist" = "" ]; then
	# Sync
	echo "pacman sync..."
	echo ">>> sudo pacman -Sy"
	sudo pacman -Sy
	if [ $? != 0 ]; then
		echo "ERROR: pacman error"
		exit 3
	fi
	# Download needed packages without installing
	echo
	echo "Download needed packages without installing..."
	echo ">>> sudo pacman -w --noconfirm -Su"
	sudo pacman -w --noconfirm -Su
	if [ $? != 0 ]; then
		echo "ERROR: pacman error"
		exit 3
	fi
elif [ "$pkglist" != "" ]; then
	targetlist=`pacman -p --print-format '%n-%v' -S $pkglist`
	if [ "$targetlist" = "" ]; then
		echo "ERROR: package download list is empty"
		exit 3
	fi
	echo "Download needed packages without installing..."
	echo ">>> sudo pacman -w --noconfirm -S $pkglist"
	if (( diag != 1 )); then
		sudo pacman -w --noconfirm -S $pkglist
		if [ $? != 0 ]; then
			echo "ERROR: pacman error"
			exit 3
		fi
	fi
fi
if (( targets == 1 )); then
	n=$'\n'
	uptargets=`pacman -p --print-format '%n-%v' -Su`
	uptargets="${uptargets/:: Starting full system upgrade...$n/}"
	if [ "$targetlist" = "" ]; then
		targetlist="$uptargets"
	else
		targetlist="$targetlist$n$uptargets"
	fi
	if [ "$targetlist" = "" ]; then
		echo "ERROR: there are no targets for update"
		exit 3
	fi
fi
targetcnt=0
if [ "$targetlist" != "" ]; then
	echo
	echo "TARGET LIST:  (only these packages will be checked)"
	echo "$targetlist"
	IFSOLD="$IFS"
	IFS=$'\n'
	for t in $targetlist; do
		target[$targetcnt]="$t"
		(( targetcnt++ ))
		test=`find $cachedir -mindepth 1 -maxdepth 1 -type f -name "$t*.pkg.tar.*"`
		if [ "$test" = "" ]; then
			misstargets="$misstargets\n    $t"
		fi
	done
	IFS="$IFSOLD"
fi

# Get repo list
unset repolist
for repo in  core extra community community-staging community-testing \
             gnome-unstable kde-unstable multilib multilib-testing staging \
             testing; do
	if [ -d "$dbpath/$repo" ]; then
		repolist="$repolist $repo"
	fi
done
if [ "$repolist" = "" ]; then
	echo "ERROR: No repos found in $dbpath"
	exit 3
fi
repolist="$repolist "

# Display db timestamps
echo
echo "Timestamps:"
for repo in $repolist; do
	if [ ! -e "$dbpath/$repo.db" ]; then
		echo "ERROR: missing $dbpath/$repo.db - use pacman -Sy"
		exit 3
	else
		ts=`stat -c %y "$dbpath/$repo.db"`
		echo "$dbpath/$repo.db: ${ts/.000000000/}"
	fi
done
echo

trapexit()
{
	# remove temp folder
	if [ -d "$tmp" ]; then
		if (( keep != 1 )) && (( diag != 1 )); then
			rm -rf "$tmp"
		else
			echo
			echo "Keeping temp files in $tmp"
		fi
		echo
		echo "paccheck stopped"
	fi
	exit 3
}

trap trapexit SIGINT SIGTERM SIGQUIT SIGHUP

# Download db files from mirrors

addtier1()
{
	tx=0
	while (( tx < tier1cnt )); do
		t="${tier1[$tx]}"
		if [ "$1" = "$t" ] || [ "${1#*.}" = "$t" ]; then
			return
		fi
		(( tx++ ))
	done
	tier1[$tier1cnt]="$1"
	#echo ">>>>TIER1 ADD: ${tier1[$tier1cnt]}"
	(( tier1cnt++ ))
	tier1[$tier1cnt]="${1#*.}"
	#echo ">>>>TIER1 ADD: ${tier1[$tier1cnt]}"
	(( tier1cnt++ ))
}

istarget()
{
	if (( targetcnt == 0 )) || [ "$targetlist" = "" ]; then
		return 0
	fi
	for t in "${target[@]}"; do
		if [ "$t" = "$1" ]; then
			return 0
		fi
	done
	return 1
}

echo "========== DOWNLOADING ============"
if (( diag != 1 )); then
	rm -rf "$tmp"
fi
mkdir -p "$tmp"
olddir="$(pwd)"
tier1cnt=0
x=0
while [ "${mir[$x]}" != "" ]; do
	m="${mir[$x]}"
	(( y = x + 1 ))
	# add $repo/os/$arch if needed
	if [ "$m" = "${m/\/os\//}" ]; then
		if [ "$m" = "${m%/}" ]; then
			m="$m/\$repo/os/\$arch"
		else
			m="$m\$repo/os/\$arch"
		fi
		mir[$x]="$m"
	fi
	if (( diag != 1 )); then
		mdir="$m"
		mdir="${mdir#*://}"
		mdir="${mdir%%/*}"
		tdir="$tmp/mirror-$y-$mdir"
		mkdir -p "$tdir"	
		cd "$tdir"
		if [ $? = 0 ]; then
			# Get & parse mirror info
			unset upstream country infourl
			echo
			echo "Downloading info on $mdir"
			mdom="$mdir"
			xm=0
			while [ "$mdom" != "${mdom/./}" ]; do
				infourl[$xm]="http://www.archlinux.org/mirrors/$mdom/"
				(( xm++ ))
				mdom="${mdom#*.}"
			done
			if (( verbose == 1 )); then
				echo "wget --no-verbose --tries=1 --connect-timeout=30 -O mirror-info.html \
			          ${infourl[@]}"
			fi
			test=`wget --no-verbose --tries=1 --connect-timeout=30 -O mirror-info.html \
			          "${infourl[@]}" 2>&1`
			if [ -s "mirror-info.html" ]; then
				tier=`grep -m 1 "<td>Tier [0-9]<\/td>" mirror-info.html | \
				      sed 's/.*<td>\(Tier [0-9]\).*/\1/'`
				if [ "$tier" = "" ]; then
					tier=`grep -m 1 "<td>Untiered<\/td>" mirror-info.html | \
					      sed 's/.*<td>\(Untiered\).*/\1/'`
				fi
				if [ "$tier" != "" ]; then
					if [ "$tier" = "Tier 1" ]; then
						addtier1 "$mdir"
					elif [ "$tier" = "Tier 2" ]; then
						info=`grep -e "<th>" -e "title=" "mirror-info.html"`
						a="${info##*<th>Upstream:</th>}"
						a="${a%%<th>*}"
						b="${a##*title=\"Mirror details for }"
						c="${b%%\"*}"
						if [ "$a" != "$info" ] && [ "$b" != "$a" ] && [ "$c" != "$b" ]; then
							upstream="Upstream: $c"
							addtier1 "$c"
						fi
					else
						upstream="Upstream: unknown"
					fi
					info=`grep -e "<th>" -e "<td>" "mirror-info.html"`
					a="${info##*<th>Country:</th>}"
					a="${a%%<th>*}"
					b="${a##*<td>}"
					c="${b%%</td>*}"
					if [ "$a" != "$info" ] && [ "$b" != "$a" ] && [ "$c" != "$b" ]; then
						country="($c)"
					fi
					echo "$tier $country $upstream" > mirror-info.txt  
				fi
			else
				echo "ERROR: Could not retrieve mirror info (this error is not critical)"
				echo "$test"
			fi	
			# Get mirror db's
			repocnt=0
			unset rmir
			for repo in $repolist; do
				eval rmir[$repocnt]="$m/$repo.db"
				(( repocnt++ ))
			done
			wget --no-verbose --tries=2 --connect-timeout=30 -N "${rmir[@]}"
		else
			echo "ERROR: cannot enter directory $tdir"
			exit 3
		fi
	fi
	(( x++ ))
done

echo

# Compare db files
echo "=========== ANALYZING ============="
x=1
for m in ${mir[@]}; do
	checkpkg=0
	mdir="$m"
	mdir="${mdir#*://}"
	mdir="${mdir%%/*}"
	tdir="$tmp/mirror-$x-$mdir"
	info=`cat "$tdir/mirror-info.txt" 2> /dev/null`
	echo
	echo "$mdir:  $info"
	for repo in $repolist; do
		echo -n "    $repo.db: "
		ftest="$tdir/$repo.db"
		fvar="$dbpath/$repo.db"
		if [ ! -s "$ftest" ]; then
			echo "DOWNLOAD FAILED"
			baddownload=1
		else
			if [ "$(stat -c %Y "$ftest")" != "$(stat -c %Y "$fvar")" ]; then
				echo -n "timestamp mismatch   "
			fi
			cmp -s "$ftest" "$fvar"
			err="$?"
			if [ "$err" = 0 ]; then
				echo "OK"
			elif [ "$err" = 1 ]; then
				echo "CONTENT MISMATCH"
				contents=1
				checkpkg=1
			else
				echo "COMPARE ERROR"
				errors=1
			fi
		fi
	done
	if (( checkpkg == 1 )); then
		# Mismatch so compare package version and desc
		echo "    Scanning package database (due to database mismatch)..."
		allok=1
		ccnt=0
		for repo in $repolist; do
			fdb="$dbpath/$repo.db"
			if [ -s "$fdb" ]; then
				mkdir -p "$tdir/db/$repo"
			fi
			ftest="$tdir/$repo.db"
			if [ -s "$ftest" ]; then
				mkdir -p "$tdir/test/$repo"
			fi
		done
		flist=`find "$cachedir" -maxdepth 1 -type f -name "*.pkg.tar.*z" | sort`
		if [ "$flist" = "" ]; then
			echo "      WARNING: No packages found in $cachedir"
			allok=0
		fi
		for f in $flist; do
			pkg="$(basename "$f")"
			pkg="${pkg%-$arch.pkg.tar.xz}"
			pkg="${pkg%-any.pkg.tar.xz}"
			pkg="${pkg%-$arch.pkg.tar.gz}"
			pkg="${pkg%-any.pkg.tar.gz}"
			if [ "$pkg" != "" ]; then
				if ( istarget "$pkg" ); then
					foundrepo=0
					foundreponame=""
					for repo in $repolist; do
					    cd $tdir/db/$repo
					    if tar xf $dbpath/$repo.db $pkg/desc 2>/dev/null; then
						foundrepo=1
						foundreponame=$repo
						dsync=$tdir/db/$repo/$pkg
						break
					    fi
					done
					repo=$foundreponame
					if [[ "$foundrepo" == "1" ]]; then
						if [ "$repo" = "" ] || [ "$repolist" != "${repolist/ $repo //}" ]; then
							foundrepo=0
							foundreponame=""
							for repo in $repolist; do
							    cd $tdir/test/$repo
							    if tar xf $tdir/$repo.db $pkg/desc 2>/dev/null; then
								foundrepo=1
								foundreponame=$repo
								dtest=$tdir/test/$repo/$pkg
								break
							    fi
							done
							repo=$foundreponame
							if [[ "$foundrepo" == "1" ]]; then
								(( ccnt++ ))
								cmp -s "$dtest/desc" "$dsync/desc"
								err="$?"
								if [ "$err" = 1 ]; then
									echo "      $repo/$pkg: @@@@@@@@@@ MISMATCH @@@@@@@@@@@"
									badpkgs="$badpkgs\n    $repo/$pkg  ($mdir)"
									allok=0
								elif [ "$err" = 0 ]; then
									if (( verbose == 1 )); then
										echo "      $repo/$pkg: OK"
									fi
								elif [ "$err" != 0 ]; then
									echo "      $repo/$pkg: COMPARE ERROR"
									errors=1
									allok=0
								fi
							else
								echo "      $repo/$pkg: MISSING"
								misspkgs="$misspkgs\n    $repo/$pkg  ($mdir)"
								allok=0
							fi
						elif (( verbose == 1 )); then
							echo "      $repo/$pkg: ignored - repo not official"
						fi
					elif (( verbose == 1 )); then
						echo "      $pkg: expired from sync"
					fi
				elif (( verbose == 1 )); then
					echo "      $pkg: ignored - not a target"
				fi
			else
				echo "      FILE ERROR: $f"
				errors=1
				allok=0
			fi
		done
		if (( allok == 1 )); then
			echo "      OK - All $ccnt packages match in database"
		fi
	fi
	(( x++ ))
done

# Check package sizes
if (( skipsize != 1 )); then
	echo
	echo "Checking package sizes..."
	allok=1
	scnt=0
	if (( altsize != 1 )); then
		if [[ "$(stat -f -c %T "$cachedir")" =~ btr ]]; then
			echo "NOTE: btrfs filesystem detected on $cachedir - switching"
			echo "      to slower alternate size method (--alt-size)."
			altsize=1
		fi
	fi
	for repo in $repolist; do
		fdb="$dbpath/$repo.db"
		if [ -s "$fdb" ]; then
			mkdir -p "$tdir/db/$repo"
		fi
	done
	flist=`find "$cachedir" -maxdepth 1 -type f -name "*.pkg.tar.*z" | sort`
	if [ "$flist" != "" ]; then
		for f in $flist; do
			pkg="$(basename "$f")"
			pkg="${pkg%-$arch.pkg.tar.xz}"
			pkg="${pkg%-any.pkg.tar.xz}"
			pkg="${pkg%-$arch.pkg.tar.gz}"
			pkg="${pkg%-any.pkg.tar.gz}"
			if [ "$pkg" != "" ]; then
				if ( istarget "$pkg" ); then
					foundrepo=0
					foundreponame=""
					for repo in $repolist; do
					    cd $tdir/db/$repo
					    if tar xf $dbpath/$repo.db $pkg/desc 2>/dev/null; then
						foundrepo=1
						foundreponame=$repo
						dsync=$tdir/db/$repo/$pkg
						break
					    fi
					done
					repo=$foundreponame
					if [[ "$foundrepo" == "1" ]]; then
						pkgsize=`sed -n '1h;1!H;${;g;s/%CSIZE%\x0A\([0-9]\)/pkgsize=\1/;p;}' \
								"$dsync/desc" 2>/dev/null | grep -m 1 "^pkgsize=" \
								| sed 's/^pkgsize=\([0-9]\)/\1/'`
						if (( altsize != 1 )); then
							actualsize="$(stat -c %s "$f")"
						else
							actualsize=`cat "$f" | wc -c`
						fi
						if [ "$pkgsize" != "" ]; then
							(( scnt++ ))
							if [ "$actualsize" != "$pkgsize" ]; then
								echo "    $repo/$pkg: @@@@@@@@ SIZE MISMATCH @@@@@@@@@"
								sizepkgs="$sizepkgs\n    $repo/$pkg  (cache $(stat -c %s "$f") != db $pkgsize)"
								allok=0
							elif (( verbose == 1 )); then
								echo "    $repo/$pkg: OK"
							fi
						else
							echo "    $repo/$pkg: ERROR: no size found in database"
							errors=1
							allok=0
						fi
					fi
				elif (( verbose == 1 )); then
					echo "    $pkg: ignored - not a target"
				fi
			fi
		done
	else
		echo "    WARNING: No packages found in $cachedir"
		allok=0
	fi
	if (( allok == 1 )); then
		echo "    OK - All $scnt packages are the correct size"
	fi	
fi

# Full download compare
if [ "${cmpmir[0]}" != "" ]; then
	echo
	echo "=========== COMPARING ============="
fi
x=0
while [ "${cmpmir[$x]}" != "" ]; do
	m="${cmpmir[$x]}"
	if [ "${m:0:1}" = "/" ]; then
		# local compare
		# files must already be downloaded to localdir/pkg/
		localcompare=1
		tdir="$m"
		mdir="$m"
	else
		localcompare=0
		(( y = x + 1 ))
		mdir="$m"
		mdir="${mdir#*://}"
		mdir="${mdir%%/*}"
		tdir="$tmp/compare-$y-$mdir"
		echo
		echo "Downloading full packages on $mdir:"
		mkdir -p "$tdir"
		cd "$tdir"
		# Prepare download
		echo "create-dirs" > "$tdir/curl.conf"
		echo "connect-timeout=30" >> "$tdir/curl.conf"
		echo "fail" >> "$tdir/curl.conf"
		#echo "-#" >> "$tdir/curl.conf"  # progress bar
	fi
	unset cpkgcnt cpkg
	for repo in $repolist; do
		fdb="$dbpath/$repo.db"
		if [ -s "$fdb" ]; then
			mkdir -p "$tdir/db/$repo"
		fi
	done
	flist=`find "$cachedir" -maxdepth 1 -type f -name "*.pkg.tar.*z" | sort`
	if [ "$flist" != "" ]; then
		for f in $flist; do
			pkgf="$(basename "$f")"
			pkg="${pkgf%-$arch.pkg.tar.xz}"
			pkg="${pkg%-any.pkg.tar.xz}"
			pkg="${pkg%-$arch.pkg.tar.gz}"
			pkg="${pkg%-any.pkg.tar.gz}"
			if [ "$pkg" != "" ]; then
				if ( istarget "$pkg" ); then
					foundrepo=0
					foundreponame=""
					for repo in $repolist; do
					    cd $tdir/db/$repo
					    if tar xf $dbpath/$repo.db $pkg/desc 2>/dev/null; then
						foundrepo=1
						foundreponame=$repo
						dsync=$tdir/db/$repo/$pkg
						break
					    fi
					done
					repo=$foundreponame
					if [[ "$foundrepo" == "1" ]]; then
						if [ "$repo" = "" ] || [ "$repolist" != "${repolist/ $repo //}" ]; then
							#if [ "$dsync" = "$tdir/db/$repo/$pkg" ]; then
								if (( localcompare != 1 )); then
									echo "-o pkg/$pkgf" >> "$tdir/curl.conf"
									eval echo "url=$m/$pkgf" >> "$tdir/curl.conf"
								fi
								cpkg[$cpkgcnt]="$pkgf"
								(( cpkgcnt++ ))
								if (( brief == 1 )) && (( cpkgcnt > 3 )); then
									echo "    WARNING: DIAGNOSTIC BRIEF MODE - NOT ALL FILES TESTED"
									break
								fi
							#fi
						elif (( verbose == 1 )); then
							echo "    $repo/$pkg: ignored - repo not official"
						fi
					elif (( verbose == 1 )); then
						echo "    $repo/$pkgf: expired from sync"
					fi
				elif (( verbose == 1 )); then
					echo "    $pkg: ignored - not a target"
				fi
			fi
		done		
	fi
	# Download
	cd "$tdir"
	if (( diag != 1 )) && (( localcompare == 0 )) && (( cpkgcnt != 0 )); then
		curl --config "$tdir/curl.conf"
		if (( brief == 1 )); then
			echo "Paused - press Enter to compare..."
			read
		fi
	elif (( cpkgcnt == 0 )) && (( localcompare == 0 )); then
		echo "    (nothing to download)"
	fi
	# Compare
	echo
	echo "Comparing full packages on $mdir:"
	cmpmsg=0
	ccnt=0
	for p in "${cpkg[@]}"; do
		pname="${p%-$arch.pkg.tar.xz}"
		pname="${pname%-any.pkg.tar.xz}"
		pname="${pname%-$arch.pkg.tar.gz}"
		pname="${pname%-any.pkg.tar.gz}"
		if [ ! -s "$tdir/pkg/$p" ]; then
			echo "    $pname: DOWNLOAD FAILED"
			baddownload=1
			cmpmsg=1
		else
			#echo "cmp -s \"$tdir/pkg/$p\" \"$cachedir/$p\""
			(( ccnt++ ))
			cmp -s "$tdir/pkg/$p" "$cachedir/$p"
			err=$?
			if [ $err = 1 ]; then
				echo "    $pname: @@@@@@ MISMATCH @@@@@@@"
				badcmp="$badcmp\n    $pname  ($mdir)"
				cmpmsg=1
			elif [ "$err" = 0 ]; then
				if (( verbose == 1 )); then
					echo "    $pname: OK"
				fi
			else
				echo "    $pname: COMPARE ERROR"
				errors=1
				cmpmsg=1
			fi
		fi
	done
	if (( cmpmsg != 1 )); then
		if (( ccnt == 0 )); then
			echo "    WARNING: There were no packages to compare"
		else
			echo "    OK - All $ccnt packages are present and identical"
		fi
	fi
	(( x++ ))
done

# remove temp folder
cd "$olddir"
if (( keep != 1 )) && (( diag != 1 )); then
	rm -rf "$tmp"
else
	echo
	echo "Keeping temp files in $tmp"
fi

echo
echo "============ SUMMARY =============="
echo
if [ "$badpkgs" != "" ]; then
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "THE FOLLOWING PACKAGES HAVE MISMATCHES - THIS IS BAD - this may indicate"
	echo "compromised mirrors (including your default pacman mirror):"
	echo -e "$badpkgs"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo
	error3=1
fi
if [ "$sizepkgs" != "" ]; then
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "THE FOLLOWING PACKAGES IN PACMAN'S PKG CACHE ARE THE WRONG SIZE - this"
	echo "indicates they are corrupt, or they or the database has been tampered"
	echo "with:"
	echo -e "$sizepkgs"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo
	error3=1
fi
if [ "$badcmp" != "" ]; then
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "THE FOLLOWING PACKAGES HAVE FULL COMPARE MISMATCHES - THIS IS BAD - this"
	echo "may indicate compromised mirrors (including your default pacman mirror):"
	echo -e "$badcmp"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo
	error3=1
fi
if (( errors == 1 )); then
	echo "THERE WERE ERRORS - This indicates one or more malfunctions."
	echo
	error3=1
fi
if (( baddownload == 1 )); then
	echo "THERE WERE DOWNLOAD FAILURES - This indicates unresponsive mirror(s) or"
	echo "files missing on the mirror(s)."
	echo
	error3=1
fi
if [ "$misstargets" != "" ]; then
	echo "THE FOLLOWING TARGETS ARE NOT IN PACMAN'S PKG CACHE - they could not be"
	echo "tested for authenticity:"
	echo -e "$misstargets"
	echo
	error3=1
fi
if [ "$misspkgs" != "" ]; then
	echo "THE FOLLOWING PACKAGES ARE MISSING FROM THE INDICATED MIRROR - if they"
	echo "are listed as missing from all mirrors above, this indicates they could"
	echo "not be tested for authenticity:"
	echo -e "$misspkgs"
	echo
	error2=1
fi
if (( contents == 1 )); then
	echo "THERE WERE DATABASE CONTENT MISMATCHES - This usually indicates some"
	echo "mirrors were out of date with your pacman sync, but alone does not"
	echo "indicate compromised mirrors."
	echo
	error1=1
fi

if [ "${mir[1]}" = "" ]; then
	echo "WARNING: USING MORE THAN ONE MIRROR IS RECOMMENDED"
	echo
	error1=1
elif (( tier1cnt != 0 )) && (( tier1cnt < 4 )); then
	echo "WARNING: ALL MIRRORS APPEAR TO USE A SINGLE UPSTREAM MIRROR - For better"
	echo "security, use several Tier 1 mirrors, or Tier 2 mirrors with different"
	echo "upstream mirrors.  See http://www.archlinux.org/mirrors/"
	echo
	error1=1
elif [ "$badpkgs$misspkgs" = "" ] && (( errors + baddownload + contents == 0 )); then
	echo "All OK."
	echo
fi

if (( error3 == 1 )); then
	err=3
elif (( error2 == 1 )); then
	err=2
elif (( error1 == 1 )); then
	err=1
else
	err=0
fi

if (( err > 1 )); then
	echo "System update is NOT recommended until the above issues are addressed."
	echo
fi

if (( diag == 1 )) || (( brief == 1 )); then
	echo "WARNING: DIAGNOSTIC MODE IN USE - results may be incomplete"
fi

if [ "$pkglist" != "" ]; then
	echo
	echo "Install Package List:$pkglist"
	echo "Targets: "
	pacman -p --print-format '    %n-%v' -S $pkglist
	echo
	if (( err < 2 )) && (( diag != 1 )); then
		echo -n "Proceed with installation? [Y/n] "
		read -n 1 s
		echo
		if [ "$s" = "n" ] || [ "$s" = "N" ]; then
			exit $err
		fi
	else
		echo -n "Proceed with installation? [y/N] "
		read -n 1 s
		echo
		if [ "$s" = "" ] || [ "$s" = "n" ] || [ "$s" = "N" ]; then
			exit $err
		fi
	fi
	echo
	echo ">>> sudo pacman --noconfirm -S $pkglist"
	sudo pacman --noconfirm -S $pkglist
	exit $?
fi
exit $err

# CHANGELOG
# 0.8.13:  changed to work with pacman >=3.5
#          default dbpath changed to /var/lib/pacman/sync
#          names of sync database changed from $repo.db.tar.gz to $repo.db
#          changed algorithm to search for desc file in databases
#          using 'tar xf' without untaring the sync databases
# 0.8.12:  corrected --install 'sudo cannot find working dir' msg
#          improved warnings and added All OK scanning msg
# 0.8.11:  added --targets
#          added --install
# 0.8.10:  added local compare
#          include pkg.tar.gz
# 0.8.9:   corrected erroneous compare url
# 0.8.8:   improved mirror info url determination
#          ignore packages not in official repos
#          report repo/package
# 0.8.7:   limited repo selection
#          added --alt-size and --skip-size
#          automatic --alt-size with btrfs
#          added --no-sync for scripts
#          mirrorlist accepts Server= format
#          info for untiered mirrors
#          PKGBUILD creates /etc/paccheck/mirrorlist
# 0.8.6:   added retries, connect timeout limits
#          corrected extract error on download failed
#          reuse http/ftp connection
#          added --keep
#          added --compare 'MIRROR'
#          added --verbose
#          added interrupt trap to remove tmp folder
#          get DBPath and CacheDir from pacman.conf
# 0.8.5:   corrected erroneous exit statuses
# 0.8.4:   added mirror tier and upstream info
#          added tier warning
#          added exit statuses
#          added test package sizes
# 0.8.3:   changed default mirrors to tier 1 mirrors
# 0.8.2:   checks all repos
# 0.8.1:   use makepkg.conf to get $arch

