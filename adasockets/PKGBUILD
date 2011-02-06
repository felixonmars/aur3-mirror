# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=adasockets
pkgver=1.8.8
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="BSD sockets in Ada"
url="http://www.rfc1149.net/devel/adasockets"
license=('custom:GNAT_Modified_GPL')
depends=('gcc-ada' 'sh')
makedepends=('autogen')
source=(http://www.rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('01351fafa823d8960e912e0f6cde5fc5')

build() {
  cd $srcdir/${pkgname}-${pkgver} || return 1
  ./configure --prefix=/usr
  make || return 1

  make DESTDIR=${pkgdir} install || return 1
  install -D -m 644 GMGPL ${pkgdir}/usr/share/licenses/$pkgname/GNAT_Modified_GPL || \
    return 1
}

