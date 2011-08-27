# Contributor: Pierre Maréchal <smokeshield at swing dot be>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=libfprint-unstable
pkgver=0.4.0
_srcpkgname=libfprint
_srcpkgver=0.4.0
pkgrel=1
pkgdesc="Library for fingerprint readers"
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=('LGPL')
groups=('fprint')
depends=('libusb' 'imagemagick>=6.4.8.10')
conflicts=('libfprint' 'libfprint-nightly')
provides=('libfprint')
arch=('i686' 'x86_64')
install=fprint.install
source=('http://cgit.freedesktop.org/libfprint/libfprint/snapshot/v_0_4_0.tar.bz2' '50-fprint.rules')
options=()

build() {
	cd $startdir/src/v_0_4_0
	./autogen.sh
	./configure --prefix=/usr
	make 
}

check(){
	cd $startdir/src/v_0_4_0
	make check
}

package() {
	cd $startdir/src/v_0_4_0
	make DESTDIR=$pkgdir install 
	install -D -m644 $srcdir/50-fprint.rules $pkgdir/etc/udev/rules.d/70-fprint.rules
}
md5sums=('e21b1096bf5645528dda6d5839b217b7'
         '61782233ddd830cd07451e39833555c8')
