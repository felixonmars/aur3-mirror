# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=xrdr-git
_pkgname=xrdr
pkgver=2.1
pkgrel=1
pkgdesc='Xrandr wrapper written in Bash'
arch=('any')
url='https://github.com/pschmitt/xrdr'
license=('GPL3')
depends=('dzen2' 'sed' 'awk')
source=("git+https://github.com/pschmitt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 xrdr ${pkgdir}/usr/bin/xrdr
}

