# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=retry-git
_gitname="retry"
pkgver=1.1a85463
pkgrel=1
pkgdesc="Retry a command"
arch=('any')
url="https://github.com/vanceza/retry"
license=('BSD' 'MIT')
depends=()
makedepends=(git)
source=("git://github.com/vanceza/retry.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
