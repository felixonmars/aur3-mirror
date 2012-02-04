# Contributor: flx <effelleks@googlemail.com>
pkgname=nvi-unicode
_pkgname=nvi
pkgver=1.81.6
pkgrel=1
pkgdesc="A reimplementation of the ex/vi text editors with unicode support."
arch=('i686')
url="http://www.kotnet.org/~skimo/nvi/"
license=('custom')
conflicts=('nvi')
depends=()
options=(!libtool)
source=(http://www.kotnet.org/~skimo/nvi/devel/$_pkgname-$pkgver.tar.bz2 \
		db47-hack.patch)

build() {
  cd "$startdir/src/$_pkgname-$pkgver/"
  patch -p1 <../db47-hack.patch
  cd ./build.unix
  ../dist/configure --prefix=/usr --program-prefix=n --enable-widechar
  make || return 1
  make DESTDIR="$startdir/pkg" install
  install -D -m644 ../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('88d1e23115ee9f2961186b62e55f5704'
         'f9dd0ee3b00e1a9915c49acc5a241a6d')

## vim:set ts=2 sw=2 et:
