# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=python-typecheck
_pkgname=typecheck
pkgver=0.3.5
pkgrel=1
pkgdesc="Powerful run-time typechecking facilities for Python functions, methods and generators"
arch=('i686')
url="http://oakwinter.com/code/typecheck/"
license=('MIT')
depends=('python')
source=(
"http://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

md5sums=('2723d15fe2f0dfc3b93362bcdbf634bc')


build() { 
    cd $srcdir/${_pkgname}-$pkgver
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
    #install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
