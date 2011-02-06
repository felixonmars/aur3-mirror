# Maintainer: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=python-amara
pkgver=1.2.0.2
pkgrel=1
pkgdesc="A collection of Python/XML processing tools to complement 4Suite"
arch=('i686' 'x86_64')
url="http://uche.ogbuji.net/tech/4Suite/amara/"
depends=('python24' '4suite')
license=('GPL')
source=(ftp://ftp.4suite.org/pub/Amara/Amara-${pkgver}.tar.gz)
md5sums=('79746b8f74b4a996e8e84fc029f9ce89')


build() {
  cd ${srcdir}/Amara-${pkgver}
  python2.4 setup.py install --root=${pkgdir} --system || return 1

}
 
