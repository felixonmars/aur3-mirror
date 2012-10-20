# Maintainer Isak Karlsson <isak.karlsson@gmail.com>
_pkgname=ubuntuone-couch
pkgname=python2-ubuntuone-couch
pkgver=0.3.0
pkgrel=3
pkgdesc="Library and command line utilities to access a user's CouchDB data on the Ubuntu One servers."
arch=('any')
url="https://launchpad.net/ubuntuone-couch"
license=('GPL')
depends=('ubuntuone-client')
makedepends=('python2-distutils-extra' 
	     'python2-distribute')
source=("https://launchpad.net/ubuntuone-couch/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        '14_13.diff'
	'15_14.diff'
  '16_15.diff')
md5sums=('a30dedc90772c60ce59351254f1beacc' 
	 '8319ea5df52e43decc8ced6ef4a982b8'
	 '4260a4803e39c1e5b5870df0b52d0150'
   '4c89b2c626977a028d79683bb675c5eb')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p0 -i ../../14_13.diff
  patch -p0 -i ../../15_14.diff
  patch -p0 -i ../../16_15.diff
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}