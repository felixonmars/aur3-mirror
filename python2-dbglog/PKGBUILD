# Maintainer: Jan Seifert <jan.seifert@firma.seznam.cz>

pkgname=python2-dbglog
pkgver=1.5.3
pkgrel=1
pkgdesc="Python binding for the libdbglog library"
arch=('x86_64')
license=('LGPL3')
url="http://dbglog.sourceforge.net/"
depends=('python2' 'libdbglog')
source=("http://prdownloads.sourceforge.net/dbglog/python-dbglog-$pkgver.tar.bz2?download" "version.patch")
md5sums=('225614eb83eec1e1c5e5c048f780c22e' '9e34462c024fe48c5065ebb3f2e68f5a')

package() {
    cd "$srcdir/python-dbglog"
    patch -p1 < ../version.patch
    python2 setup.py install --root="$pkgdir" --optimize=1
}
