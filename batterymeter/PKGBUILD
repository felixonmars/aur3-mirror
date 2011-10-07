# Contributor: Peter Hatina (phatina) <phatina (at) gmail.com>
pkgname=batterymeter
pkgver=0.2
pkgrel=2
arch=('any')
pkgdesc="QT4 battery meter"
url="http://batterymeter.googlecode.com"
license=('GPL')
depends=('qt>=4.4')
makedepends=('make' 'svn' 'libacpi')
source=('http://batterymeter.googlecode.com/files/batterymeter-src-0.2.tar.gz')
md5sums=('7308e12c5b90589f0e8be0214e26b67f')

build() {
  cd ${srcdir}/${pkgname}/src

  qmake || return 1
  make || return 1
  make install INSTALL_ROOT=${pkgdir} || return 1
}
