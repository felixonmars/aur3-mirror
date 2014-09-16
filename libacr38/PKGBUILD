pkgname=libacr38
pkgver=1.0.8
pkgrel=1
pkgdesc="PC/SC Drivers for ACR38 smart card reader"
arch=('i686' 'x86_64')
url="http://www.acs.com.hk/en/driver/4/acr38-smart-card-reader/"
license=("LGPL")
depends=('pcsclite>=1.3.3 libusb-compat')
source=(http://www.acs.com.hk/download-driver-unified/6258/ACS-Unified-Driver-Lnx-Mac-108-P.zip)
md5sums=('0b235156a66f280a81f949b0c9bb3052')

package() {
    cd $srcdir/ACS-Unified-Driver-Lnx-Mac-108-P/
    tar -jxvf acsccid-$pkgver.tar.bz2
    cd acsccid-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc --oldincludedir=/usr/include/libusb-1.0
    make || return 1
    make DESTDIR=$pkgdir usbdropdir=/usr/lib/pcsc/drivers install
}
