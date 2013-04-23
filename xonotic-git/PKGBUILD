# Maintainer: M Rawash <mrawash@gmail.com>
# Contributor: MrBougo <bougospam at gmail dot com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>

pkgname=xonotic-git
pkgver=20120131
pkgrel=2
pkgdesc="A free, fast-paced crossplatform first-person shooter"
arch=('i686' 'x86_64')
url="http://xonotic.org"
license=('GPL')
depends=(
	'd0_blind_id-git'
	'libxpm'
	'libjpeg>=8'
	'libpng>=1.4.0'
	'libmodplug'
	'libvorbis'
	'libxxf86dga'
	'libxxf86vm'
	'alsa-lib'
	'sdl'
	'curl'
)
makedepends=('git' 'p7zip' 'zip' 'unzip' 'vorbis-tools' 'sdl' 'mesa' 'imagemagick' 'gmqcc-git')
optdepends=(
	'libtheora: recording in ogv'
	#'d0_blind_id-git: crypto libraries for player authentification'
)
provides=('xonotic')
conflicts=('xonotic')

_gitroot="git://git.xonotic.org/xonotic/xonotic.git"
_gitname="xonotic"
_releasename="git-AUR"
_compression=5

# the jpeg and ogg variables can be modified, the function may also be skipped for raw data
# the values here are also used in the official -low builds
_compress() {
	find $1 -type f -print0 |
		git_src_repo=$2              \
		CACHEDIR="$srcdir"/datacache \
		do_jpeg=true                 \
		jpeg_qual_rgb=80             \
		jpeg_qual_a=97               \
		do_dds=false                 \
		do_ogg=true                  \
		ogg_qual=1                   \
		del_src=true                 \
		xargs -0 "$srcdir"/$_gitname/misc/tools/cached-converter.sh
}

_git_extract() {
	_from=$1
	_to=$2
	shift 2
	{ cd "$_from"; git archive --format=tar HEAD -- "$@"; } \
		| {
			cd "$_to"
			tar xvf -
		}
}

# 7z compresses nicely but can't deal with flags and symlinks
_mkzip() {
	_archive=$1
	shift
	_ziplist=`mktemp`
	find "$@" -xtype f \( -executable -or -type l \) -print > "$_ziplist"
	7za a -tzip -mx=$_compression -x@"$_ziplist" "$_archive" "$@" || true
	zip         -$_compression -y -@<"$_ziplist" "$_archive"      || true
	rm -f "$_ziplist"
}

#credit goes to omgwizard for the shallow clone idea
_update() {
	cd "$srcdir"/$_gitname
	sed 's/git clone/git clone --depth 1/g' --in-place=".PKGBUILD_BU" ./all
	./all update
	mv -f ./all.PKGBUILD_BU ./all
	cd "$OLDPWD"
}

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		#future updates might introduce new subrepos, use shallow cloning anyway
		cd $_gitname && _update
		msg "The local files are updated."
	else
		git clone --depth 1 $_gitroot $_gitname
		cd $_gitname
		touch d0_blind_id.no
		touch netradiant.no
		_update
	fi

	msg "GIT checkout done or server timeout"

	# BUILD

	msg "Copying sources..."

	rm -rf "$srcdir"/src
	mkdir -p "$srcdir"/src/darkplaces "$srcdir"/src/fteqcc
	_git_extract "$srcdir"/$_gitname/fteqcc "$srcdir"/src/fteqcc
	_git_extract "$srcdir"/$_gitname/darkplaces "$srcdir"/src/darkplaces
	_git_extract "$srcdir"/$_gitname/data/xonotic-data.pk3dir "$srcdir"/src \
		qcsrc Makefile check-cvars.sh

	msg "Fetching map binaries..."
	cd "$srcdir"/$_gitname
	./all update-maps

	msg "Compiling the engine..."
	cd "$srcdir"/src/darkplaces
	CC="${CC:-gcc} -g -DSUPPORTIPV6" make release

	msg "Compiling fteqcc..."
	cd "$srcdir"/src/fteqcc
	make all

	msg "Compiling the game code"
	cd "$srcdir"/src/
	make FTEQCC="../../fteqcc/fteqcc.bin" # relative to the directories containing progs.src

	msg "Building data pk3's..."
	rm -rf "$srcdir"/temp # just in case it was interrupted previously
	mkdir "$srcdir"/temp
	cd "$srcdir"/temp
	for _subrepo in font-nimbussansl font-xolonium xonotic-data xonotic-music xonotic-maps; do
		mkdir $_subrepo
		_git_extract "$srcdir"/$_gitname/data/$_subrepo.pk3dir "$srcdir"/temp/$_subrepo
	done

	rm -rf "$srcdir"/temp/xonotic-data/qcsrc
	mv "$srcdir"/src/progs.dat "$srcdir"/src/csprogs.dat "$srcdir"/src/menu.dat "$srcdir"/temp/xonotic-data

	cd "$srcdir"/temp/xonotic-maps
	#2x40 question marks. That's as many as eight tens. And that's terrible.
	for X in "$srcdir"/$_gitname/data/*-????????????????????????????????????????-????????????????????????????????????????.pk3; do
		if [ -f "$X" ]; then
			unzip "$X"
			rm -f maps/*.log maps/*.irc maps/*.lin
		fi
	done

	msg "Compressing data..."
	cd "$srcdir"/temp/
	# don't compress the font files
	for _subrepo in xonotic-data xonotic-music xonotic-maps; do
		_compress $_subrepo "$srcdir"/$_gitname/data/$_subrepo.pk3dir
	done

	msg "Packing data..."
	for _subrepo in font-nimbussansl font-xolonium xonotic-data xonotic-music xonotic-maps; do
		cd "$srcdir"/temp/$_subrepo
		_mkzip "$srcdir"/$_subrepo.pk3 * # this wildcard excludes dot files
	done

	msg "Removing temporary files..."
	rm -rf "$srcdir"/temp
}

package() {
	msg "Installing..."
	mkdir -p "$pkgdir"/opt/$pkgname/
	_git_extract "$srcdir"/$_gitname/ "$pkgdir"/opt/$pkgname \
		Docs \
		server \
		xonotic-linux-glx.sh xonotic-linux-sdl.sh \
		key_0.d0pk
	chmod 755 "$pkgdir"/opt/$pkgname/xonotic-linux-glx.sh \
	          "$pkgdir"/opt/$pkgname/xonotic-linux-sdl.sh

	# Binaries -- those names are needed by the launcher script
	case "$CARCH" in
		x86_64)  _arch="linux64" ;;
		*)       _arch="linux32" ;;
	esac
	install -m755 "$srcdir"/src/darkplaces/darkplaces-glx "$pkgdir"/opt/$pkgname/xonotic-$_arch-glx
	install -m755 "$srcdir"/src/darkplaces/darkplaces-glx "$pkgdir"/opt/$pkgname/xonotic-$_arch-sdl
	install -m755 "$srcdir"/src/darkplaces/darkplaces-dedicated "$pkgdir"/opt/$pkgname/xonotic-$_arch-dedicated

	mkdir -p "$pkgdir"/opt/$pkgname/data/
	mv -f "$srcdir"/*.pk3 "$pkgdir"/opt/$pkgname/data || true # those files are too big to be copied

	# Launch scripts
	mkdir -p "$pkgdir"/usr/bin
	mv -f "$pkgdir"/opt/$pkgname/server/server_linux.sh "$pkgdir"/opt/$pkgname/
	ln -sf /opt/$pkgname/xonotic-linux-glx.sh "$pkgdir"/usr/bin/xonotic-glx
	ln -sf /opt/$pkgname/xonotic-linux-sdl.sh "$pkgdir"/usr/bin/xonotic-sdl
	ln -sf /opt/$pkgname/server_linux.sh "$pkgdir"/usr/bin/xonotic-dedicated
}
