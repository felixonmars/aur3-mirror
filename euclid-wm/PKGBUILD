#Maintained by BKLive <benjamin dot kuhns at gmail dot com>

pkgname=euclid-wm
pkgver=0.4.3
pkgrel=1
pkgdesc="A minimalist, tiling window manager for X11"
arch=('i686' 'x86_64')
url="http://euclid-wm.sourceforge.net/index.php"
license=('custom')
depends=('libx11' 'libxinerama')
conflicts=('euclid-wm' 'start-euclid')
provides=('euclid-wm' 'start-euclid')
source=(http://euclid-wm.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('4dfe7313f0554b891e34980206763ee4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

