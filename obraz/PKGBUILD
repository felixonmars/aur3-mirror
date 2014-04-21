# Maintainer: Andreas Vinter-Hviid <andreas.vinterhviid@gmail.com>
# Contributer: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=obraz
pkgver=0.9
pkgrel=1
pkgdesc="Static site generator in a single Python file similar to Jekyll"
arch=(any)
url="http://obraz.pirx.ru/"
license=('MIT')
depends=('python' 'python-yaml' 'python-jinja' 'python-markdown' 'python-docopt')
source=("http://pypi.python.org/packages/source/o/obraz/obraz-$pkgver.tar.gz")
md5sums=('170996688885ba5343b5acee22459e61')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build || return 1
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root=$pkgdir --optimize=1 || return 1
}

