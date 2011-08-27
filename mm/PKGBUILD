# $Id: PKGBUILD,v 1.11 2007/02/23 23:29:18 jgc Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=mm
pkgver=1.4.2
pkgrel=1
pkgdesc="A shared memory abstraction library"
arch=(i686 x86_64)
depends=('glibc')
license=('custom')
options=('!libtool')
source=(ftp://ftp.ossp.org/pkg/lib/mm/mm-${pkgver}.tar.gz)
md5sums=('bdb34c6c14071364c8f69062d2e8c82b')
url="http://www.ossp.org/pkg/lib/mm/"

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
