# Note: Normal esd will work fine instead of esd-oss, but esd-oss is the OSS
#       version of esd, so... :)  Grab it in the AUR.

# Maintainer:  Devin Cofer <ranguvar.archlinux.us>
# Contributor: Hugo Doria  <hugo@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=mpg123-oss
_pkgname=mpg123
pkgver=1.13.2
pkgrel=1
pkgdesc="A console-based real-time MPEG-1/2/3 audio player (OSS version)"
arch=('i686' 'x86_64')
url="http://www.mpg123.org/"
license=('GPL2' 'LGPL2')

makedepends=('esound-oss' 'sdl')
depends=('oss')
optdepends=('esound-oss: For additional audio support'
            'sdl: For additional audio support')

provides=('mpg321' "mpg123=$pkgver")
conflicts=('mpg321' 'mpg123')
replaces=('mpg321')

source=("http://downloads.sourceforge.net/sourceforge/mpg123/mpg123-$pkgver.tar.bz2")
sha256sums=('c4677653adb656e0f15a7b6dafa5c166eeeb1dc6c20b9a9a6d02efa83afc0d01')


options=('libtool')
build() {
	cd "$srcdir"/$_pkgname-$pkgver

	./configure --prefix=/usr --with-audio="oss esd sdl"
	make
}
package() {
	cd "$srcdir"/$_pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
