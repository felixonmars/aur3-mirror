# Contributor: Ross Eldridge <ptepid@ptepid.org>
pkgname=crashtest
pkgver=1.1
pkgrel=5
pkgdesc="Educational car crash simulation"
url="http://www.stolk.org/crashtest/"
license="GPL"
depends=('ode' 'plib' 'fltk' 'alsa-lib')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=(i686 x86_64)
source=("http://www.stolk.org/crashtest/${pkgname}-${pkgver}.tar.gz"
	"crashtest-1.1-archlinux.patch")
md5sums=('f739c1599a25d9a5c19e8f3289de00dd'
	 '63ced985919a8332eabb78bb3586c913')

build() {
  cd $srcdir/$pkgname-$pkgver/src-crashtest
  patch -p2 < $srcdir/crashtest-1.1-archlinux.patch
  make || return 1
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/bin
  mv $pkgdir/usr/games/crashtest $pkgdir/usr/bin
  rmdir $pkgdir/usr/games
}
