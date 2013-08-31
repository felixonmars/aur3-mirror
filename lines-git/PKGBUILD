# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=lines-git
_gitname="lines"
pkgver=0.0.0
pkgrel=1
pkgdesc="Select a simple range of lines from a file"
arch=('any')
url="https://github.com/vanceza/lines"
license=('BSD' 'MIT')
depends=()
makedepends=(git)
source=("git://github.com/vanceza/lines.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  cd local_repo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
