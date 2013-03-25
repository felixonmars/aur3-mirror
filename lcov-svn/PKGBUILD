# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Jordi De Groof <jordi dot degroof at gmail dot com>

pkgname=lcov-svn
pkgver=20130325
pkgrel=1
pkgdesc="front-end for GCC's coverage testing tool gcov"
arch=('i686' 'x86_64' 'armv7h')
url="http://ltp.sourceforge.net/coverage/lcov.php"
license=('GPL')
depends=('perl')
makedepends=('cvs')
provides=('lcov')
conflicts=('lcov')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@ltp.cvs.sourceforge.net:/cvsroot/ltp"
_cvsmod="utils/analysis/lcov"

build() {
    cd "$srcdir"
    msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

    if [[ -d "$_cvsmod/CVS" ]]; then
        cd "$_cvsmod"
        cvs -z3 update -d
    else
        cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
        cd "$_cvsmod"
    fi

    msg "CVS checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_cvsmod-build"
    cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
    cd "$srcdir/$_cvsmod-build"

    make PREFIX="$pkgdir" install || return 1
}
