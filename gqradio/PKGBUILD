#written by daeltar, <lukas@daeltar.org>, http://daeltar.org
#mantenedor ramonsoares, <arch@ramonsoares.com>
pkgname=gqradio
pkgver=1.9.2
pkgrel=2
arch=('i686')
pkgdesc="GQradio interfaces with radio cards through the video4linux. Stations can be tuned manually, set to presets, or auto seek can find the next available frequency. The application supports theming (skins), and includes a built-in skin editor. Skin formats are similar to GQmpeg."
license=('GPL')
url="http://gqmpeg.sourceforge.net/radio.html"
depends=('gtk2>=2.4')
md5sums=('10fded1c080cadd1b260a592772bcbb6')
source=(http://downloads.sourceforge.net/project/gqmpeg/gqradio/1.9.2/gqradio-1.9.2.tar.gz)

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
