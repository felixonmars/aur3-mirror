# Maintainer: queue <queueRAM@gmail.com>

pkgname=qtl866-git
pkgver=r12.4f9fe22
pkgrel=1
pkgdesc="GUI driver for minipro EPROM/device programmer"
url="https://github.com/wd5gnr/qtl866"
arch=('i686' 'x86_64')
license=('GPL')
depends=('minipro')
makedepends=('git')
optdepends=('bless: for binary editing')
source=(${pkgname}::git://github.com/wd5gnr/qtl866.git)
conflicts=('qtl866')
provides=('qtl866')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake qtl866.pro
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/binhexedit" "${pkgdir}/usr/bin/binhexedit"
  install -Dm755 "${srcdir}/${pkgname}/qtl866" "${pkgdir}/usr/bin/qtl866"
}

# vim: ts=2 sw=2 et:
