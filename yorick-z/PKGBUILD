# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-z
_pkgshonam=z
pkgver=1.2
pkgrel=1
pkgdesc="yorick support for zlib, png and jpeg"
arch=('i686' 'x86_64')
license=('GPL')
url="http://yorick.sourceforge.net/"
groups=('science' 'yorick-all')
depends=('yorick' 'libpng' 'libjpeg')
makedepends=('yorick')
source=(http://sourceforge.net/projects/yorick/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz/download)
md5sums=('c842856044a0b07fb7262a168dd956a4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  yorick -batch make.i || return 1
  ./configure || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
