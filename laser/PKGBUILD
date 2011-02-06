
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=laser
pkgver=0.2.4
pkgrel=4
pkgdesc="Reach targets with a light ray using little optical elements."
arch=('i686' 'x86_64')
url="http://bookeldor.livejournal.com/"
license=('GPL')
makedepends=('docbook2x' 'intltool')
depends=('libgnomeui' 'librsvg' 'hicolor-icon-theme' 'cairo')
source=(http://bookeldor-net.info/laser/${pkgname}_${pkgver}.tar.gz)
md5sums=('88b4e4d3e123b0d77aa5984e4c7ab496')
install=(laser.install)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-xevents
make || return 1
make DESTDIR=${pkgdir} install
}
