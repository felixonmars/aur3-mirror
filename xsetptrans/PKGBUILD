# Contributor: irgal <irgal@fird.net>

pkgname=xsetptrans
pkgver=0.3
pkgrel=1
pkgdesc="Set transparent image from root"
arch=('i686' 'x86_64')
depends=('libx11')
license=('GPL2')
groups=('system')
url="http://8-p.info/"
source=("http://8-p.info/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6834369f0903aadf1e7a38082611a233')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
