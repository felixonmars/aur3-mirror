# Contributor: priorit <archlinux@florian.loitsch.com>
pkgname=ssm
pkgver=0.93
pkgrel=1
pkgdesc="Simple System Monitor for KDE"
url="http://kde-apps.org/content/show.php?content=19441"
license="GPL"
depends=(kdelibs libtool)
makedepends=(automake-legacy)
source=(http://musaraigne.homeip.net/${pkgname}-${pkgver}.tar.gz)
md5sums=('84ccb06ecfcfff04aad58b721b737775')

build() {
	cd $startdir/src/$pkgname
	./configure --prefix=/opt/kde
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
