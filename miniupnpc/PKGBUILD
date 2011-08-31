# Contributor: Florian Loitsch <archlinux@florian.loitsch.com>
pkgname=miniupnpc
pkgver=1.6
pkgrel=2
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=(i686 x86_64)
url="http://miniupnp.free.fr"
license=('BSD')
depends=('sh')
source=("http://miniupnp.free.fr/files/$pkgname-$pkgver.tar.gz")
md5sums=('88055f2d4a061cfd4cfe25a9eae22f67')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make INSTALLPREFIX=$pkgdir/usr install || return 1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
