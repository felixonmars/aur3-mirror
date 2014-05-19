pkgname=python2-urlobject
pipname=URLObject
pkgver=2.3.4
pkgrel=1
pkgdesc="A utility class for manipulating URLs."
arch=(any)
url="http://github.com/zacharyvoase/urlobject"
license=('PD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/U/${pipname}/${pipname}-${pkgver}.tar.gz")
md5sums=('df81709eca2041d40f511ffba4da88d1')
conflicts=('python2-urlobject-git')

package() {
  cd "$srcdir/$pipname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

