# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>

pkgname=texml
pkgver=2.0.2
pkgrel=1
pkgdesc="Convert TeXML to LaTeX or ConTeXt"
arch=('i686' 'x86_64')
url="http://getfo.org/texml/"
license=('MIT')
depends=('python2')
makedepends=('setuptools')
source=(http://prdownloads.sourceforge.net/getfo/$pkgname-$pkgver.tar.gz?download)
md5sums=('fe10f2084becece6b23fc92f29fb1ba6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
  sed -i -e "s/python texml.py/texml/" $pkgdir/usr/bin/texml.py
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp license.txt $pkgdir/usr/share/licenses/$pkgname/
}
