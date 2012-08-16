pkgname=net-shaper
pkgver=2012.08.10
pkgrel=1
pkgdesc="Arch Linux network traffic shaper scripts"
arch=('any')
url="http://www.mbse.eu/linux/homeserver/network/net-shaper/"
license=('GPL')
depends=(iproute2)
source=(conf.shaper rc.shaper)

backup=(etc/conf.d/shaper)

build() {
  install -Dm755 $srcdir/rc.shaper $pkgdir/etc/rc.d/shaper
  install -Dm644 $srcdir/conf.shaper $pkgdir/etc/conf.d/shaper
}

md5sums=('4ff0454ff11c7a3d72b3012508e966a3'
         '25378233dc9a603ccc697b3f5e3b1cc9')

