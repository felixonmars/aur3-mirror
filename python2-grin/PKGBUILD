# Maintainer: nickray <nicolas dot stalder at gmail dot com>
# Contributor: meatballhat <daniel.buch@gmail.com>
pkgname=python2-grin
pkgver="1.2.1"
pkgrel=2
pkgdesc="grep + find, or 'A grep program configured the way I like it.'"
arch=(any)
url="http://pypi.python.org/pypi/pypi/$pkgver"
license=("BSD")
depends=('python2')
source=("http://pypi.python.org/packages/source/g/grin/grin-$pkgver.tar.gz"
        "setup.py.patch")
md5sums=('d894426dfbf70bc105388c2a51348199'
         '4cdee46707ba81c4615be44b06902bb3')

build() {
    cd "$srcdir/grin-$pkgver"
    patch setup.py ../setup.py.patch 
    python2 setup.py install --root=$pkgdir/
    install -D -m644 $srcdir/grin-$pkgver/LICENSE.txt \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
