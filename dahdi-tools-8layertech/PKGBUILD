#
# Created by: Joel Bryan Juliano <jbjuliano@8layertech.com>,
#                                <joelbryan.juliano@gmail.com>
#
# This package is part of 8ix Zenith CE project.
# For more information, visit http://www.8layertech.com
#
pkgname=dahdi-tools-8layertech
pkgver=2.2.0
pkgrel=2
pkgdesc="DAHDI tools for Asterisk"
arch=('i686' 'x86_64')
url="http://www.asterisk.org/"
license=('GPL2')
depends=('dahdi-8layertech' 'libnewt' 'libusb' 'perl')
backup=('etc/dahdi/genconf_parameters' 'etc/system.conf')
source=("http://downloads.digium.com/pub/telephony/dahdi-tools/releases/dahdi-tools-${pkgver}.tar.gz"
        "dahdi_cfg")
md5sums=('a018f452f3851a312ff51705ac44de37'
         'b316117d714341e10f9ea6cfab0119d2')

build() {
  cd "$srcdir/dahdi-tools-${pkgver/_/-}"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D -m755 "$srcdir"/dahdi_cfg "$pkgdir"/etc/rc.d/dahdi_cfg
  install -D -m644 xpp/genconf_parameters "$pkgdir"/etc/dahdi/genconf_parameters
  make DESTDIR="$pkgdir/" config
}

# vim:set ts=2 sw=2 et:
