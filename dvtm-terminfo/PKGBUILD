# Maintainer: Eric Mrak <mail at ericmrak dot info>

pkgname=dvtm-terminfo
_pkgname=dvtm
pkgver=0.14
pkgrel=2
pkgdesc='Terminfo files for dvtm'
arch=('any')
url='http://www.brain-dump.org/projects/dvtm/'
groups=('modified')
license=('MIT')
makedepends=('ncurses')
source=("http://www.brain-dump.org/projects/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('44ec5176b1996fdffd97cabe9a35ea0c')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    TERMINFO="${pkgdir}/usr/share/terminfo"
    mkdir -p "$TERMINFO"
    env TERMINFO="$TERMINFO" tic -s dvtm.info
}
