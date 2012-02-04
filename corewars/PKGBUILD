# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: damir <damir at archlinux dot org>

pkgname=corewars
pkgver=0.9.13
pkgrel=2
pkgdesc="Simulation game where a number of programs try to crash each other"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/corewars/"
license=('GPL2')
depends=('gtk')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}%20%28stable%2C%20tar.gz%29/${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('0a0b8067533b83a96488109ee265f664')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
