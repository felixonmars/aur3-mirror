# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=xrdr-git
_pkgname=xrdr
pkgver=2.5.1.r0.gb63d470
pkgrel=1
pkgdesc='Xrandr wrapper written in Bash'
arch=('any')
url='https://github.com/pschmitt/xrdr'
license=('GPL3')
depends=('dzen2' 'sed' 'awk' 'xorg-xrandr' 'bash')
source=("git+https://github.com/pschmitt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 xrdr ${pkgdir}/usr/bin/xrdr
}

