# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=last-git
_gitname="last"
pkgver=.
pkgrel=1
pkgdesc="Prints the last line of a file"
arch=('any')
url="https://github.com/vanceza/last"
license=('BSD' 'MIT')
depends=()
makedepends=(git)
source=("git://github.com/vanceza/last.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/last ${pkgdir}/usr/bin/last-line
}
