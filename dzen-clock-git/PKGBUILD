# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=dzen-clock-git
_gitname="dzen-clock"
pkgver=1.189007d
pkgrel=1
pkgdesc="A clock"
arch=('any')
url="https://github.com/vanceza/dzen-clock"
license=('BSD' 'MIT')
depends=(dzen2 util-linux)
makedepends=(git)
source=("git://github.com/vanceza/dzen-clock.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/clock ${pkgdir}/usr/bin/dzen-clock
}
