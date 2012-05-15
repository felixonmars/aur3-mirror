pkgname=jig
pkgver=1.05
pkgrel=2
pkgdesc="console based jabber client"
arch=('i686' 'x86_64')
url="http://jig.isawsome.net/"
license=('GPL')
depends=('xmpppy' 'python-dnspython')
install=jig.install
source=(http://jig.isawsome.net/jig-1.05.tar.gz
        jig.patch)
md5sums=('a67aa03c519dc678d0e6660d020e4543'
         '68e88eba8f57a5ebfabfaa133539ffd8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/jig.patch"
  install -D -m755 jig.py "$pkgdir/usr/bin/jig.py"
}

# vim:set ts=2 sw=2 et:
