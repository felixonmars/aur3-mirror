# Contributor: Ryan Coyner <rcoyner@gmail.com>
pkgname=conky-google-reader
pkgver=1.00
pkgrel=1
pkgdesc="A script to display the count of unread Google Reader feeds in conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~m-buck/+junk/conkygooglereader"
license=('GPL')
depends=('python')
install=$pkgname.install
source=(https://launchpad.net/%7Em-buck/+archive/conky/+files/conkygooglereader_$pkgver.tar.gz)
md5sums=('8ebb98464ef010e4b4f14b65a546c4b3')

build() {
  cd $srcdir/src
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 README $pkgdir/usr/share/conkygooglereader/README || return 1
}
