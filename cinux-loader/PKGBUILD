# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: <dotb52 at gmail dot com>

pkgname=cinux-loader
pkgver=2.02
pkgrel=2
pkgdesc="A console application written in C that download automatic files from file hosting services like RapidShare."
arch=('i686' 'x86_64')
url="http://cinux-loader.sourceforge.net/"
license=('GPL3')
depends=('curl' 'pcre' 'openssl' 'gocr' 'imagemagick')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/CinuxLoader/${pkgver}/${pkgname}-source-${pkgver}.tar.bz2/download)
md5sums=('89c39943a9d6c42acc6282a6c39d706d')

build() {
  cd ${srcdir}/${pkgname}-source-${pkgver}
  ./configure --prefix=/usr sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/${pkgname}-source-${pkgver}
  make DESTDIR=${pkgdir} install
}