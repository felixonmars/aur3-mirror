# Maintainer: Dave Kil <dave at thekilempire dot com>
# Contributor: robb_force <robb_forc at holybuffalo dot net>

pkgname=bin32-e-uae
pkgver=0.8.29.20080820
pkgrel=2
pkgdesc="A version of the Ubiquitous Amiga Emulator, that attempts to bring many of the great features of WinUAE to non-Windows platforms."
url="http://www.rcdrummond.net/uae"
license="GPL"
arch=(x86_64)
conflicts=(e-uae uae)
depends=('lib32-gtk2>=2.0.0' 'lib32-gtk' 'lib32-sdl' 'lib32-alsa-lib' 'lib32-mesa')
makedepends=('zlib' 'pkgconfig' 'mesa' 'awk' 'make' 'gcc-multilib')
source=(http://www.rcdrummond.net/uae/test/20080820/e-uae-0.8.29-20080820.tar.bz2)
sha256sums=('2659972bdd2daf568b533558a029d87c48815ce20eba93187acbf5235953d11c')

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
	export CFLAGS=$(echo $CFLAGS | sed 's/x86-64/i686/g')
	export CXXFLAGS=$(echo $CXXFLAGS | sed 's/x86-64/i686/g')
	export MAKEFLAGS="-j1"

	cd $srcdir/e-uae-0.8.29-20080820
	./configure --enable-bsdsock --enable-scsi-device \
	            --with-sdl --with-sdl-gfx --with-sdl-gl \
	            --with-alsa --prefix=/usr \
		    --libdir=/usr/lib32 --target=i686-pc-linux-gnu --host=i686-pc-linux-gnu
	make || return 1
}

package() {
	cd $srcdir/e-uae-0.8.29-20080820/src
	install -Dm755 uae      $pkgdir/usr/bin/uae
	install -Dm755 readdisk $pkgdir/usr/bin/readdisk
	install -Dm755 make_hdf $pkgdir/usr/bin/make_hdf

	cd $srcdir/e-uae-0.8.29-20080820/docs
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
