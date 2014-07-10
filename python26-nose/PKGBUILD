pkgname=python26-nose
pkgver=1.3.3
pkgrel=1
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='http://readthedocs.org/docs/nose/'
license=('LGPL2.1')
makedepends=('python26' 'python26-distribute')
source=("http://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz")
md5sums=('42776061bf5206670cb819176dc78654')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
}

package() {
  depends=('python26' 'python26-distribute')
  cd "$srcdir/nose-$pkgver"
  python2.6 setup.py install --prefix=/usr --root="${pkgdir}"
  rm "$pkgdir/usr/bin/nosetests"
  rm -rf "$pkgdir/usr/share"
}

