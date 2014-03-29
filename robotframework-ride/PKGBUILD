# Contributor: Thomas Robinson <robinsthom@gmail.com>
pkgname=robotframework-ride
pkgver=1.3
pkgrel=1
pkgdesc="Lightweight and intuitive test data editor for Robot Framework"
arch=('i686' 'x86_64')
url="https://github.com/robotframework/RIDE"
license=('APACHE')
depends=('robotframework' 'wxpython2.8')
source=("https://pypi.python.org/packages/source/r/robotframework-ride/$pkgname-$pkgver.tar.gz")
md5sums=('07ce5c215b4ec82044a453d466bc472e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
