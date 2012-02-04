# Maintainer:  TDY <tdy@gmx.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=pyopenal
pkgver=0.1.6
pkgrel=3
pkgdesc="Python bindings for OpenAL"
arch=('any')
url="http://home.gna.org/oomadness/en/pyopenal/"
license=('LGPL')
depends=('freealut' 'python2')
makedepends=('setuptools')
source=(http://download.gna.org/$pkgname/PyOpenAL-$pkgver.tar.gz)
md5sums=('51992fc62df474614ea6eb724061f392')

build() {
  cd "$srcdir/PyOpenAL-$pkgver"
  sed -i '7,16 d' setup.py
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
