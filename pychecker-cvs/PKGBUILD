# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=pychecker-cvs
pkgver=20101019
pkgrel=2
pkgdesc="Python code checker"
url="http://pychecker.sourceforge.net/"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('python2' 'cvs')
provides=('pychecker')

source=()
md5sums=()

_cvsroot=":pserver:anonymous@pychecker.cvs.sourceforge.net:/cvsroot/pychecker"
_cvsmod="pychecker"

build() {
    cd $srcdir
    msg "Connecting to $_cvsmod.sourceforge.net CVS server..."
    if [ -d $_cvsmod/CVS ]; then
        cd $_cvsmod
        cvs -z3 update -d || return 1
    else
        cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod || return 1
    fi

    msg "CVS checkout done"
    msg "Starting make..."

    cp -r $srcdir/$_cvsmod $srcdir/$_cvsmod-build

    cd $srcdir/$_cvsmod-build
    python2 setup.py install --root=$pkgdir

    rm -rf $srcdir/$_cvsmod-build
}
