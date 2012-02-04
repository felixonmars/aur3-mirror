# Contributor: Liu Zhiyou <fdyuelie (at) gmail.com>

pkgname=ibus-fbterm
pkgver=0.9.1
pkgrel=1
pkgdesc="A input method for FbTerm based on iBus."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus-fbterm/"
license=('GPL2')
depends=('ibus' 'fbterm')
install=ibus-fbterm.install
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make                           || return 1
  make DESTDIR=${pkgdir} install || return 1
}

md5sums=('966e4f275500979b78dd1303e96ca32d')
