# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=utfs
pkgver=1.959
pkgrel=1
pkgdesc="User TCP FileSystem"
arch=('i686' 'x86_64')
url="http://www.guru-group.fi/~too/sw/utfs/"
license=('GPL2')
depends=('fuse')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a869ba292526c545f1db2ff191e0168b')

build() {
  rm -rf "${srcdir}"/${pkgname}-${pkgver}-build
  cp -R "${srcdir}"/${pkgname}-${pkgver} "${srcdir}"/${pkgname}-${pkgver}-build
  cd "${srcdir}"/${pkgname}-${pkgver}-build
  make all -j1
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}-build
  install -d "${pkgdir}"/usr/
  make PREFIX="${pkgdir}"/usr/ install

  install -d "${pkgdir}"/usr/lib/madde/linux-${CARCH}/madlib
  ln -sf /usr/bin/utfs-server "${pkgdir}"/usr/lib/madde/linux-${CARCH}/madlib/utfs-server
}
