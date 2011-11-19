pkgname=bzr-xmloutput
pkgver=0.8.8
pkgrel=1
pkgdesc="A Bazaar plugin that provides a option to generate XML output for builtins commands"
arch=('i686' 'x86_64')
url="https://launchpad.net/bzr-xmloutput"
license=('GPL')
depends=('bzr')
makedepends=('python2')
source=(https://launchpad.net/bzr-xmloutput/trunk/${pkgver}/+download/$pkgname-$pkgver.tar.gz)
md5sums=('fecef8ac64fa5de903ddde0333200e5e')

build() {
  install -d -m755 "$pkgdir/usr"
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
