# Maintainer: Jan Seifert <jan.seifert@firma.seznam.cz>

pkgname=python2-fastrpc
pkgver=3.1.1
pkgrel=1
pkgdesc="Python binding for the fastrpc library"
arch=('x86_64')
license=('LGPL')
url="http://fastrpc.sourceforge.net/"
depends=('python2' 'libfastrpc')
source=("http://prdownloads.sourceforge.net/fastrpc/python-fastrpc-$pkgver.tar.gz" "version.patch")
md5sums=('f39a5dea2af84a3e449cb3261cb08537' 'a5618fc49cd540f0cb5f153fe1ec751f')

package() {
    cd "$srcdir/python-fastrpc"
    patch -p1 < ../version.patch
    python2 setup.py install --root="$pkgdir" --optimize=1
}
