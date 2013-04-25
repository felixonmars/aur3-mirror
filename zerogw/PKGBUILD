# Maintainer: Paul Colomiets <pc@gafol.net>

pkgname=zerogw
pkgver=0.6.2
pkgrel=2
pkgdesc="A http/zeromq gateway"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/zerogw"
license=('MIT')
depends=('zeromq2' 'libyaml' 'openssl' 'libev' 'mime-types')
makedepends=('coyaml' 'libwebsite>=0.2.20' 'python-pyzmq>=2.1.9' 'mime-types')
backup=("etc/zerogw.yaml")
source=(https://github.com/tailhook/zerogw/archive/v$pkgver.tar.gz)
md5sums=('0e4097ad4a76ac85999cfbdfc1745fa8')

build() {
  cd $srcdir/$pkgname-$pkgver
  LDFLAGS="$LDFLAGS -Wl,--no-as-needed" ./waf configure --prefix=/usr
  ./waf build
}

check() {
  cd $srcdir/$pkgname-$pkgver
  ./waf test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
