# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Andreas Amereller <andreas.amereller.dev@googlemail.com>
pkgname=mingw32-protobuf
pkgver=2.5.0
pkgrel=1
pkgdesc="A way of encoding structured data in an efficient yet extensible format (MinGW32)"
arch=('any')
url=https://code.google.com/p/protobuf/
license=('APACHE')
groups=()
depends=('mingw32-gcc' 'mingw32-zlib' 'protobuf')
makedepends=()
provides=('mingw32-protobuf')
conflicts=()
replaces=()
backup=()
options=(!strip !buildflags)
install=
source=("https://protobuf.googlecode.com/files/protobuf-$pkgver.tar.bz2")
noextract=()
md5sums=('a72001a9067a4c2c4e0e836d0f92ece4')

build() {
cd "$srcdir/protobuf-$pkgver"
./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 --with-protoc=protoc
make
}

package() {
cd "$srcdir/protobuf-$pkgver"
make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
