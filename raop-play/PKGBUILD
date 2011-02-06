# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=raop_play
pkgname=raop-play
pkgver=0.5.1
pkgrel=1
pkgdesc="music file player for Apple Airport Express."
arch=('i686' 'x86_64')
url="http://raop-play.sourceforge.net/"
license=('unknown')
groups=('apple')
depends=('openssl' 'fltk' 'glib2' 'libsamplerate' 'libid3tag')
makedepends=('bash' 'make' 'gcc')
optdepends=('mpg321' 'ogg123' 'faad' 'flac')
provides=('airplay')
conflicts=('raop-play-svn')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/$pkgname/$_pkgname/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz" "conf.patch" "glib.patch")
noextract=()
md5sums=('921f89c1d61f2a22e737e8431df63301'
         '6dba81d86c3404d797f55561592fe6b3'
         '3ef00f6de4daf6a11558827a5577d8fe')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	patch -Np1 -i $srcdir/conf.patch
	patch -Np1 -i $srcdir/glib.patch

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
