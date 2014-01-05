pkgname=python2-sql
pkgver=r82.fa73dd3e45dd
pkgrel=1
pkgdesc="a python2 sql library"
arch=('any')
url="https://code.google.com/p/python-sql/"
license=('GPL3')
depends=('python2')
optdepends=()
makedepends=('python2' 'mercurial')
md5sums=('SKIP')
source=('hg+https://code.google.com/p/python-sql/')
pkgver() {
    cd $srcdir/python-sql
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
package() {
    cd $srcdir/python-sql
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
