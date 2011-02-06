# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=dact
pkgver=0.8.42
pkgrel=1
pkgdesc="Dynamic Adaptive Compression Tool"
arch=('i686' 'x86_64')
url="http://www.rkeene.org/oss/dact/"
license=('GPL2')
depends=('bzip2' 'zlib')
source=(http://www.rkeene.org/files/oss/dact/release/${pkgname}-${pkgver}.tar.gz)
md5sums=('60d6ea03a08d14108ee155d2fbf1eadc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make 
  make DESTDIR=${pkgdir} bindir=${pkgdir}/usr/bin datadir=${pkgdir}/usr/share sysconfdir=${pkgdir}/etc mandir=${pkgdir}/usr/share/man libdir=${pkgdir}/usr/lib install
}
