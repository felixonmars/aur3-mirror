# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Based on python-markdown by Angel 'angvp' Velasquez

pkgname=python3-markdown
_pkgbasename=Markdown
pkgver=2.0.3
pkgrel=2
pkgdesc="Python 3 implementation of John Gruber's Markdown."
arch=('any')
url='http://www.freewisdom.org/projects/python-markdown/'
license=('BSD')
depends=('python>=3.0')
source=(http://pypi.python.org/packages/source/M/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz
        2to3-markdown.patch)
md5sums=('751e8055be2433dfd1a82e0fb1b12f13'
         'c96e9e3aaeb6633b24d5a4bc795bb59d')

build() {
  cd $srcdir/$_pkgbasename-$pkgver
  patch -p0 < $srcdir/2to3-markdown.patch
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv $pkgdir/usr/bin/markdown $pkgdir/usr/bin/markdown3
}
