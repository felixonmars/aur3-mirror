pkgname=libbls
pkgver=830
pkgrel=1
pkgdesc="Efficient editable buffer library"
arch=('i686' 'x86_64')
url="https://launchpad.net/libbls"
license=('LGPL3')
depends=()
makedepends=('bzr' 'python2')

build() {
   cd "$srcdir"

   msg "Connecting to Bazaar server...."

   rm -rf $pkgname/
   bzr branch lp:$pkgname

   msg "Bazaar checkout done or server timeout"
   msg "Starting build..."

   rm -rf "$srcdir/$pkgname-build"
   cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
   cd "$srcdir/$pkgname-build"

   ./waf configure --prefix=/usr
   ./waf
}

package() {
   cd "$srcdir/$pkgname-build"

   ./waf install --destdir="$pkgdir/"
}
