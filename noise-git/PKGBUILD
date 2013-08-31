# Maintainer: Zachary Vance <vanceza@gmail.com>
pkgname=noise-git
_gitname="noise"
pkgver=0.0.0
pkgrel=1
pkgdesc="Play fractal voise, including pink, white, and brown"
arch=('any')
url="https://github.com/vanceza/noise"
license=('BSD' 'MIT')
depends=(sox)
makedepends=(git)
source=("git://github.com/vanceza/noise.git")
md5sums=('SKIP') # Git sources aren't static

pkgver() {
  cd local_repo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/whitenoise ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/pinknoise ${pkgdir}/usr/bin
    install -m755 ${srcdir}/$_gitname/brownnoise ${pkgdir}/usr/bin
}
