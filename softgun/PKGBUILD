pkgname=softgun
pkgver=0.16
pkgrel=3
pkgdesc="A software ARM intended to emulate complete embedded systems"
arch=('i686' 'x86_64')
url="http://softgun.sourceforge.net/"
license=('GPL')
depends=('zlib')
install=(softgun.install)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('1cdb15ccbeaba112b46d381f41d21dc7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  make || return 1

  # Makefile assumes that this directory exists...
  mkdir -p ${startdir}/pkg/usr/bin || return 1
  make prefix=$startdir/pkg/usr install || return 1

  mkdir -p ${startdir}/pkg/usr/share/${pkgname} || return 1
  install -m644 configs/* ${startdir}/pkg/usr/share/${pkgname}/ || return 1
  install -m644 README ${startdir}/pkg/usr/share/${pkgname}/ || return 1
}
