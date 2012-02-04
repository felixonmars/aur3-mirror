# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python2-html5lib
pkgver=0.90
pkgrel=1
pkgdesc="Library for working with HTML documents"
arch=(any)
url="http://code.google.com/p/html5lib/"
license=(MIT)
depends=('python2')
makedepends=('python2')
source=("http://html5lib.googlecode.com/files/html5lib-$pkgver.zip")
md5sums=('691e6b9ebe15b333a28280974b2ce432')

build() {
  cd $srcdir/html5lib-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
