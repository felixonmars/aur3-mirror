# Maintainer: browcio <browcio.pl[at]gmail[dot]com>
pkgname=telepathy-sunshine
pkgver=0.2.0
pkgrel=2
pkgdesc="Gadu-Gadu connection manager"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/telepathy/telepathy-sunshine"
groups=('telepathy')
license=('GPL3')
depends=('python2-telepathy' 'twisted')
optdepends=('pyopenssl: SSL support')
source=("http://telepathy.freedesktop.org/releases/telepathy-sunshine/${pkgname}-${pkgver}.tar.gz")
md5sums=('2615bb78170c4310029a2ea3cef71816')

build() {
  cd $pkgname-$pkgver
  
	./configure --prefix="/usr" --libexecdir="/usr/lib/telepathy"
	make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
