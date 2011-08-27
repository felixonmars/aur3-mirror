# Contributor: Geuten Edouard <edouard@grima.be>
# Contributor: Thibaud de Borggraef <thibaud.deborggraef@telenet.be>

pkgname=libacr38ucontrol
pkgver=1.7.10
pkgrel=2
pkgdesc="PC/SC Drivers for ACR38 smart card reader"
arch=('i686' 'x86_64')
url="http://www.acs.com.hk/drivers-manual.php?driver=ACR38"
license=("LGPL")
depends=('pcsclite')
source=(http://www.acs.com.hk/drivers/eng/ACR38U_driver_Lnx_1710_P.tar.gz)
md5sums=('386ad8025ce226433526f03ed910946d')

build() {
cd $startdir/src/ACR38_LINUX_100710_P
./configure --prefix=/usr --sysconfdir=/etc
make || return 1
make DESTDIR=$startdir/pkg usbdropdir=$startdir/pkg/usr/lib/pcsc/drivers install
} 
