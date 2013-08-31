# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=current-network-git
_gitname="current-network"
pkgver=1.d910aed
pkgrel=1
pkgdesc="Shows the current connected network in Arch Linux"
arch=('any')
url="https://github.com/vanceza/current-network"
license=('BSD' 'MIT')
depends=(netctl)
makedepends=(git)
source=("git://github.com/vanceza/current-network.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
