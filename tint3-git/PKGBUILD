# Maintainer: Ted Meyer <tmathmeyer@gmail.com>

_pkgname=tint3
pkgname=${_pkgname}-git
pkgver=2
pkgrel=1
pkgdesc='An independant status bar for X11 (works best with bspwm)'
arch=('x86_64')
url="https://github.com/tmathmeyer/${_pkgname}"
license=('GPL')
depends=()
makedepends=('git')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/tmathmeyer/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname/src"
    make update
}

package() {
    installDir="$pkgdir/usr/local/bin"
    fontDir="$pkgdir/usr/share/fonts/TTF"
    install -dm755 "$installDir"
    install -dm755 "$fontDir"
    install -m755 "$srcdir/$_pkgname/src/fonts/sakamoto-11.bdf" "$fontDir/sakamoto-11.bdf"
    install -m755 "$srcdir/$_pkgname/src/tint3" "$installDir/tint3"
}