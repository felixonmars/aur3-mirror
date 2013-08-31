# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=webcam-picture-git
_gitname="webcam-picture"
pkgver=2.0e3c936
pkgrel=1
pkgdesc="Take a single still frame picture from the webcam"
arch=('any')
url="https://github.com/vanceza/webcam-picture"
license=('BSD' 'MIT')
depends=(mplayer)
makedepends=(git)
source=("git://github.com/vanceza/webcam-picture.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/$_gitname ${pkgdir}/usr/bin
}
