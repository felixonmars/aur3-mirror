# Maintainer: Mladen Pejakovic <pejakm@gmail.com>

pkgname=manitou-ui
pkgver=1.3.0
pkgdesc="Database-driven email system: user interface"
pkgrel=2
arch=(i686 x86_64)
url="http://www.manitou-mail.org/"
license=(GPL)
makedepends=()
depends=('qt4' 'qtwebkit' 'postgresql' "manitou-mdx=${pkgver}")
options=()
source=(http://www.manitou-mail.org/source/${pkgname}-${pkgver}.tar.gz
        "fix_sed_regexps.patch")
md5sums=('1ee93cdfe054fdecc58661effa1e660d'
         '63296e7aaf94eccee036d5843ff00f3f')

build(){
  cd ${srcdir}/manitou-${pkgver}
  # fix build: https://github.com/manitou-mail/manitou-mail-ui/commit/f699adac91daf6200ed3d578b5c644b99238b758
  patch -Np0 -i ${srcdir}/fix_sed_regexps.patch
  export QTDIR=/usr/lib/qt4
  ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/manitou-${pkgver}
  make DESTDIR="${pkgdir}" install
}
