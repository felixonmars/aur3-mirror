# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=owns-git
pkgver=1.fb0b726
pkgrel=1
pkgdesc="See who owns a command in Arch Linux"
arch=('any')
url="https://github.com/vanceza/owns"
license=('BSD' 'MIT')
depends=(pacman)
makedepends=(git)
source=("git://github.com/vanceza/owns.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/owns\? ${pkgdir}/usr/bin/owns\?
}
