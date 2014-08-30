# Maintainer: Noel Kuntze <noel@familie-kuntze.de>

pkgname=libpe-git
pkgver=1
pkgrel=1
pkgdesc='The library pev is based on.'
arch=('i686' 'x86_64')
url='http://pev.sourceforge.net/'
license=('GPL')
depends=('glibc' 'openssl' 'pcre')
source=('libpe.zip::https://github.com/merces/libpe/archive/master.zip')
md5sums=('SKIP')

build() {
  cd "${srcdir}/libpe-master"
  #./configure --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/libpe-master"
  install -d ${pkgdir}/usr/lib

  #make DESTDIR=${pkgdir} install
  sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" Makefile
  sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" Makefile
  make install
}

