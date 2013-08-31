# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=random-git
_gitname="random"
pkgver=0.0.0
pkgrel=1
pkgdesc="Picks a random line from a file"
arch=('any')
url="https://github.com/vanceza/random"
license=('BSD' 'MIT')
depends=(python)
makedepends=(git)
source=("git://github.com/vanceza/random.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  cd local_repo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
