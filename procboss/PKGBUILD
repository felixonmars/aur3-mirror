# Maintainer: Paul Colomiets <paul@colomiets.name>

pkgname=procboss
pkgver=0.2.13.1
pkgrel=1
pkgdesc="A process supervisor"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/procboss"
license=('MIT')
makedepends=('coyaml' 'docutils')
depends=('libyaml')
backup=("etc/bossd.yaml")
source=(https://github.com/downloads/tailhook/procboss/$pkgname-$pkgver.tar.gz)
md5sums=('b407a6d1f482be258583eeaba4c19591')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -d -m755 $pkgdir/usr/share/procboss/examples
  install -m644 ./examples/services/* "$pkgdir/usr/share/$pkgname/examples"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
