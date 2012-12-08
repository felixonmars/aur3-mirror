# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.8.11
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="http://www.rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('sh' 'gcc-libs')
makedepends=('gcc-ada' 'autogen')
options=('!libtool')
install=adasockets.install
source=(https://www.github.com/downloads/samueltardieu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('aaa427d453b8c4e9592d5bd009775a43')

build() {
  cd $srcdir/${pkgname}-${pkgver} || return 1
  ./configure --prefix=/usr
  make || return 1

  make DESTDIR=${pkgdir} install || return 1
  install -D -m 644 GMGPL ${pkgdir}/usr/share/licenses/$pkgname/GNAT_Modified_GPL || \
    return 1
}

# vim:set ts=2 sw=2 et:
