# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=glc-pulseaudio-git
pkgver=20120828
pkgrel=1
pkgdesc="An ALSA & OpenGL capture tool for Linux. (with pulseaudio support)"
arch=('i686' 'x86_64')
url="https://github.com/swick/glc"
install=glc-git.install
source=('Copyright')
license=('CUSTOM')
depends=('libpng' 'alsa-lib' 'libgl')
makedepends=('cmake' 'git' 'mesa')
provides=('glc')
conflicts=('glc')
md5sums=('d706bd101063967583d3e4f98e0bf14a')
_gitname="glc"
_gitroot="https://github.com/swick/glc.git"

build() {
	cd $srcdir
	mods=('glc' 'glc-support' 'elfhacks' 'packetstream')
	for mod in ${mods[@]}; do
		msg2 "Gitting $mod"
		[ -d "$mod" ] && rm -rf "$mod"
		if [ "$mod" == "glc" ]; then
			git clone "git://github.com/swick/$mod" -b pulseaudio || return 1
		else
			git clone "git://github.com/nullkey/$mod" || return 1
		fi
	done
	
	ln -sf $srcdir/elfhacks $srcdir/glc/elfhacks
	ln -sf $srcdir/packetstream $srcdir/glc/packetstream
	ln -sf $srcdir/glc-support $srcdir/glc/support
	
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
		msg2 "Building $mod"
		[ -d $mod/build ] || mkdir $mod/build
		cd $mod/build
		
		cmake .. \
			-DCMAKE_INSTALL_PREFIX:PATH="${DESTDIR}" \
			-DCMAKE_BUILD_TYPE:STRING="Release" \
			-DCMAKE_C_FLAGS_RELEASE:STRING="${CFLAGS}" > /dev/null \
			-DMLIBDIR="${MLIBDIR}" \
			|| return 1
		make || return 1
		cd ../..
	done
}

package() {
	cd "$srcdir"
	mods=('elfhacks' 'packetstream' 'glc')
	for mod in ${mods[@]}; do
		msg2 "Packaging $mod"
		cd $mod/build
		make install || return 1
		cd ../..
	done
	
	install -d -m755 "$pkgdir/usr/share/glc/scripts"
	install -d -m755 "$pkgdir/usr/share/licenses/glc-git"
	
	install -m755 "glc/scripts/capture.sh" "$pkgdir/usr/share/glc/scripts/capture.sh"
	install -m755 "glc/scripts/play.sh"    "$pkgdir/usr/share/glc/scripts/play.sh"
	install -m755 "glc/scripts/encode.sh"  "$pkgdir/usr/share/glc/scripts/encode.sh"
	install -m644 "Copyright"              "$pkgdir/usr/share/licenses/glc-git/Copyright"
}

