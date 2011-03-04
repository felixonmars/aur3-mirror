# Maintainer: Dave Kil <dave at thekilempire dot com>
# Contributor: ianux <ianux@free.fr>

pkgname=bin32-puae-git
pkgver=20110304
pkgrel=1
pkgdesc="Amiga emulator for *nix systems - successor of E-UAE"
arch=('i686' 'x86_64')
url="http://github.com/GnoStiC/PUAE"
license=('GPL')
depends=('lib32-gtk2>=2.0.0' 'lib32-gtk' 'lib32-sdl' 'lib32-alsa-lib' 'lib32-mesa' 'lib32-qt')
makedepends=('zlib' 'pkgconfig' 'mesa' 'awk' 'make' 'gcc-multilib' 'git')
conflict=('e-uae' 'uae')
source=()
md5sums=()

_gitroot="http://github.com/GnoStiC/PUAE.git"
_gitname="PUAE"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	#
	# BUILD HERE
	#
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
	export CFLAGS=$(echo $CFLAGS | sed 's/x86-64/i686/g')
	export CXXFLAGS=$(echo $CXXFLAGS | sed 's/x86-64/i686/g')
	export MAKEFLAGS="-j1"

	./bootstrap.sh
	./configure --with-sdl --with-sdl-gl --with-sdl-gfx --with-sdl-sound --enable-drvsnd \
	            --with-qt --enable-cd32 --enable-gayle --enable-scsi-device --enable-ncr \
		    --enable-a2091 --with-caps --enable-amax --prefix=/usr \
		    --libdir=/usr/lib32 --target=i686-pc-linux-gnu --host=i686-pc-linux-gnu
	make || return 1
} 

package() {
	cd "$srcdir/$_gitname-build/src"
	install -Dm755 uae      $pkgdir/usr/bin/uae
	install -Dm755 readdisk $pkgdir/usr/bin/readdisk
	install -Dm755 make_hdf $pkgdir/usr/bin/make_hdf

	cd "$srcdir/$_gitname-build/docs"
	install -Dm644 bsdsocket.txt     $pkgdir/usr/share/doc/e-uae/bsdsocket.txt
	install -Dm644 cmd-line.txt      $pkgdir/usr/share/doc/e-uae/cmd-line.txt
	install -Dm644 compiling.txt     $pkgdir/usr/share/doc/e-uae/compiling.txt
	install -Dm644 configuration.txt $pkgdir/usr/share/doc/e-uae/configuration.txt
	install -Dm644 floppies.txt      $pkgdir/usr/share/doc/e-uae/floppies.txt
	install -Dm644 joystick.txt      $pkgdir/usr/share/doc/e-uae/joystick.txt
	install -Dm644 keyboard.txt      $pkgdir/usr/share/doc/e-uae/keyboard.txt
	install -Dm644 make_hdf.txt      $pkgdir/usr/share/doc/e-uae/make_hdf.txt
	install -Dm644 scsi.txt          $pkgdir/usr/share/doc/e-uae/scsi.txt
}
