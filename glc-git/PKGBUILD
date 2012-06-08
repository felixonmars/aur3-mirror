# Maintainer: doorknob60 < doorknob60 at gmail dot com >
# Contributor: kumico <kumico@kh.nu>
pkgname=glc-git
pkgver=20120607
pkgrel=1
pkgdesc="An ALSA & OpenGL capture tool for Linux. (-git version)"
arch=('i686' 'x86_64')
url="https://github.com/nullkey/glc"
install=glc-git.install
source=('Copyright')
license=('CUSTOM')
depends=('libpng' 'alsa-lib' 'libgl')
makedepends=('cmake' 'git' 'mesa')
provides=('glc')
conflicts=('glc')

md5sums=('d706bd101063967583d3e4f98e0bf14a')
sha1sums=('8df4c92df2a6ddefccc5ee16d05298c7e8351094')

_gitname="glc"
_gitroot="git://github.com/nullkey/glc.git"

build() {
	cd $srcdir
	mods=('glc' 'glc-support' 'elfhacks' 'packetstream')
	for mod in ${mods[@]}; do
		msg "Gitting $mod"
		if [ -d "$mod" ]; then
			cd "$mod"
			git pull origin || return 1
			cd ..
		else
			git clone "git://github.com/nullkey/$mod" || return 1
		fi
	done
	
	ln -sf $srcdir/elfhacks $srcdir/glc/elfhacks
	ln -sf $srcdir/packetstream $srcdir/glc/packetstream
	ln -sf $srcdir/glc-support $srcdir/glc/support
	
	msg "GIT checkout done or server timeout"
	msg "Starting Build Sequence"
	
	DESTDIR=$pkgdir/usr
	MLIBDIR="lib"
	if [ $CARCH == "x86_64" ]; then
		CFLAGS="$CFLAGS -m64"
	fi
		MLIBDIR="lib"
	
	export CMAKE_INCLUDE_PATH="$srcdir/glc/elfhacks/src:$srcdir/glc/packetstream/src"
	export CMAKE_LIBRARY_PATH="$srcdir/glc/elfhacks/build/src:$srcdir/glc/packetstream/build/src"
	
	mods=('elfhacks' 'packetstream' 'glc')
	for mod in ${mods[@]}; do
		msg "Building $mod..."
		[ -d $mod/build ] || mkdir $mod/build
		cd $mod/build
		
		cmake .. \
			-DCMAKE_INSTALL_PREFIX:PATH="${DESTDIR}" \
			-DCMAKE_BUILD_TYPE:STRING="Release" \
			-DCMAKE_C_FLAGS_RELEASE_RELEASE:STRING="${CFLAGS}" > /dev/null \
			-DMLIBDIR="${MLIBDIR}" \
			|| return 1
		make || return 1
		cd ../..
	done
	
	
	for mod in ${mods[@]}; do
		msg "Installing $mod to pkgdir..."
		cd $srcdir/$mod/build
		make install || return 1
	done
	
	install -d -m755 $pkgdir/usr/share/glc/scripts
	install -m755 $srcdir/glc/scripts/capture.sh $pkgdir/usr/share/glc/scripts/capture.sh
	install -m755 $srcdir/glc/scripts/play.sh $pkgdir/usr/share/glc/scripts/play.sh
	install -m755 $srcdir/glc/scripts/encode.sh $pkgdir/usr/share/glc/scripts/encode.sh
	install -d -m755 $pkgdir/usr/share/licenses/glc-git
	install -m644 $srcdir/Copyright $pkgdir/usr/share/licenses/glc-git/Copyright
}

