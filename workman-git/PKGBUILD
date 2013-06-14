# Maintainer: Geordie Bilkey <himself@thefumon.com>
pkgname=workman-git
_gitname=workman
pkgver=54.fb07f45
pkgrel=1
pkgdesc="The Workman Keyboard Layout created by OJ Bucao."
url="http://www.workmanlayout.com"
arch=('any')
license=('unknown')
depends=('')
source=("git://github.com/deekayen/workman.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${_gitname}/xorg/
  install -Dm644 workman  ${pkgdir}/usr/share/X11/xkb/symbols/workman
  install -Dm644 workman-p  ${pkgdir}/usr/share/X11/xkb/symbols/workman-p
}
