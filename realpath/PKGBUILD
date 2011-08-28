# Maintainer : Thomas Weißschuh < thomas_weissschuh || lavabit || com >
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=realpath
pkgver=1.15
pkgrel=2
pkgdesc="return the canonicalized absolute pathname"
url="http://packages.debian.org/stable/realpath"
arch=(any)
license=(GPL)
depends=('glibc')
makedepends=('po4a')
source=(http://ftp.debian.org/debian/pool/main/r/realpath/${pkgname}_$pkgver.tar.gz)
sha1sums=('27174ef37d846761a12ebd81af1398327ee824b9')

build()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  make VERSION=${pkgver} all
}

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  make VERSION=${pkgver} DESTDIR=${pkgdir} install
}
