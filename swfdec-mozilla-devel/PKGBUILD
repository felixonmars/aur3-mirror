#Maintainer: Jan de Groot <jgc@archlinux.org>
#Contributer: Andrew Krawchyk <krawch_a@denison.edu>

pkgname=swfdec-mozilla-devel
_pkgname=swfdec-mozilla
pkgver=0.9.2
pkgrel=2
pkgdesc="development package of the free plugin for Mozilla browsers that uses the Swfdec library for playing SWF files"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=("swfdec-devel>=$pkgver")
source=(http://swfdec.freedesktop.org/download/swfdec-mozilla/0.9/${_pkgname}-${pkgver}.tar.gz)
provides=('swfdec-mozilla=0.9.2')
conflicts=('swfdec-mozilla')
options=('!libtool')
md5sums=('5e19c365d02f1ece2e7caec13c2b23d4')

build() {
  cd ${startdir}/src/${_pkgname}-${pkgver}
  ./configure  --prefix=/usr --disable-static --with-plugin-dir=/usr/lib/mozilla/plugins/
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
