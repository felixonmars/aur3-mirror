# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=python2-typecheck
_pkgname=typecheck
pkgver=0.3.5
pkgrel=1
pkgdesc="Powerful run-time typechecking facilities for Python functions, methods and generators"
arch=('i686' 'x86_64')
url="http://oakwinter.com/code/typecheck/"
license=('MIT')
depends=('python')
source=(
"http://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

md5sums=('2723d15fe2f0dfc3b93362bcdbf634bc')


build() {
    cd $srcdir/${_pkgname}-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
    #install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
