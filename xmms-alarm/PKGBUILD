# Contributor: Marco Fister <marco@rda26.net>

pkgname=xmms-alarm
pkgver=0.3.7
pkgrel=1
pkgdesc="An alarm clock for XMMS"
url="http://www.snika.uklinux.net/index.php?show=xmms-alarm"
depends=('glib' 'gtk' 'xmms')
source=(http://www.snika.uklinux.net/xmms-alarm/$pkgname-$pkgver.tar.bz2)
md5sums=('be1a3b60dbab6b1ab5e3e893c22cbe23')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
