# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=qof
pkgver=0.8.7
pkgrel=1
pkgdesc="Provides a set of C Language utilities for performing generic structured complex queries"
arch=('i686' 'x86_64')
url="http://qof.alioth.debian.org/"
license=('GPL')
depends=('glib2' 'libxml2>=2.5.10')
makedepends=('doxygen' 'libxslt')
options=('!libtool' '!makeflags')
source=(http://ftp.de.debian.org/debian/pool/main/q/qof/$pkgname\_$pkgver.orig.tar.gz)
md5sums=('4f32eaf1fa92819fccb1590fdc2233a5')
sha1sums=('ad30a0e0879b13590f436111ff502c0c6673df17')

build() {
cd "$srcdir/qof-$pkgver"
./configure --prefix=/usr --disable-sqlite || return 1
make warnFLAGS="" || return 1
make DESTDIR="$pkgdir" install || return 1
}
