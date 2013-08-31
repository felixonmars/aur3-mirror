# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=rip-chrome-history-git
_gitname="rip-chrome-history"
pkgver=1.306eb9f
pkgrel=1
pkgdesc="Transfer urls and access times from chromium's browser history"
arch=('any')
url="https://github.com/vanceza/rip-chrome-history"
license=('BSD' 'MIT')
depends=()
optdepends=(chromium)
makedepends=(git)
source=("git://github.com/vanceza/rip-chrome-history.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
