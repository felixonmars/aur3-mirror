# Contributor: Alexandre Défossez <alexandre.defossez at google famous mailing service>
pkgname=pydoctor
pkgver=0.5
pkgrel=1
pkgdesc="API documentation generator for Python using static analysis"
arch=('any') # python
url="https://pypi.python.org/pypi/pydoctor"
license=('MIT')
depends=('python2' 'nevow>=0.9.18' 'twisted' 'zope-interface')
optdepends=("epydoc: Restructured Text parser")
source=(
"https://pypi.python.org/packages/source/p/pydoctor/pydoctor-$pkgver.tar.gz"{,.asc}
)
md5sums=(76652703e59f8ee4e767f33d3510ba81 SKIP)

build() {
  cd "$srcdir/pydoctor-$pkgver"
  python2 setup.py build
} 

package(){
  cd "$srcdir/pydoctor-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
