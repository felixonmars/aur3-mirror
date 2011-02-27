pkgname=ut2004-anthology
pkgver=3369
_pkgverrel=2
pkgrel=1
pkgdesc="Unreal Tournament 2004, installation from Unreal Anthology"
url="http://www.unrealtournament.com/"
license="custom"
depends=('libstdc++5' 'sdl' 'openal')
makedepends=('unshield')
arch=('i686' 'x86_64')
source=(http://treefort.icculus.org/ut2004/ut2004-lnxpatch${pkgver}-${_pkgverrel}.tar.bz2 ut2004-32.desktop ut2004-64.desktop)
install='ut2004.install'
md5sums=('0fa447e05fe5a38e0e32adf171be405e'
         'a6e9fe48b4d3e63544ea57f6f759a324'
         'f2cb1b42606b330ac521017f4c13e228')


#Define if not a mounted path.
cddir=

#Folder to which it should be installed.
#setupdir=$startdir/pkg/opt/ut2004
setupdir=$pkgdir/opt/ut2004

#Language to install... if available on disk.
lang="English"

###############################################################################
# Internal script definitions
###############################################################################

packages=(
	4_UT2004_Animations
	4_UT2004_Benchmark
	4_UT2004_ForceFeedback
	4_UT2004_Help
	4_UT2004_Help_English
	4_UT2004_KarmaData
	4_UT2004_Manual_English
	4_UT2004_Maps
	4_UT2004_Music
	4_UT2004_Sounds_All
	4_UT2004_Sounds_English
	4_UT2004_Speech_English
	4_UT2004_StaticMeshes
	4_UT2004_System_All
	4_UT2004_System_English
	4_UT2004_Textures
	4_UT2004_Web
)




build() {

	echo Finding data directory.
	if [ -z $cddir ]; then
		if cddir=$(findAnthology); then
			echo Anthology DVD found in: ${cddir};
		else
			echo 'Anthology not found, aborting.'
			exit 1
		fi
	else
		echo Anthology defined as ${cddir}
	fi


	echo Preparing data.
	mkdir -p "$setupdir"
	cd "$setupdir"
	linkCabs ./


	echo Extracting data.
	extractPackages data1.cab


	echo Removing setup files
	cleanUp


	echo Renaming directories
	renameDirs 4_UT2004_


	echo Getting everything in the right place
	for f in *_All; do
		mv "$f" "$( echo $f | sed "s/_All//" )"
	done

	for f in *_${lang}; do
		newname=$( echo $f | sed "s/_${lang}//" )
		[[ ! -d $newname ]] && mkdir $newname
		mv $f/* $newname/
		rmdir "$f"
	done


	echo Now that everything is in the right place...

	echo Installing linux patch
	cd "${srcdir}/UT2004-Patch"
	for f in *; do
		cp -rf "$f" "${setupdir}/"
	done
	cd "${setupdir}"

	echo Putting some library links
	cd System
	ln -s /usr/lib/*openal.so openal.so
	ln -s /usr/lib/libSDL-1.2.so.0 libSDL-1.2.so.0

	echo "Please replace this line with your CDkey without dashes." > CDkey


	install -d "$pkgdir/usr/share/{applications,pixmaps}"
	# Install Icon File
	install -D -m 644 "$pkgdir/opt/ut2004/Help/Unreal.ico" \
		"$pkgdir/usr/share/pixmaps/Unreal.ico"

	# Install Desktop file
	if [ "$CARCH" == "x86_64" ]; then
		install -D -m 644 "$srcdir/ut2004-64.desktop" \
			"$pkgdir/usr/share/applications/ut2004.desktop"
	else
		install -D -m 644 "$srcdir/ut2004-32.desktop" \
			"$pkgdir/usr/share/applications/ut2004.desktop"
	fi


	echo All done!


	return 0;
}


###############################################################################
# Functions
###############################################################################

function findAnthology() {
	IFS=$'\n'
	for mp in $(cat /proc/mounts); do
		mp=$(echo $mp | cut -d ' ' -f 2)
		[[ -f $mp/AutoRunData/Unreal.ico ]] && echo $mp && return 0
	done
	return 1
}

function linkCabs() {
	ln -s $cddir/Disk1/Data1.hdr $1
	for f in $cddir/Disk*/data*.cab; do
		ln -s $f $1
	done
}

function extractPackages() {
	for package in "${packages[@]}"; do
		#echo Extracting: $package from $1
		unshield -D2 -g "$package" x "$1"
	done
}

function cleanUp() {
	for f in *.cab; do
		unlink $f;
	done
	unlink Data1.hdr
}
function renameDirs() {
	for f in ${1}*; do
		mv $f $(echo $f | sed -e "s/${1}//")
	done
}


