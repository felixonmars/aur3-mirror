# Contributor: maksvlad <maksvlad[at]yahoo.com>

pkgname=modemmanager-anydata
pkgver=20100507
pkgrel=1
pkgdesc="Modem Management system with Anydata CDMA modem plugin"
arch=(i686 x86_64)
license=('GPL')
url="http://cgit.freedesktop.org/ModemManager/"
depends=('dbus-glib' 'glib2' 'hal')
makedepends=('pkgconfig')
options=('')
provides=('modemmanager')
conflicts=('modemmanager')

source=('http://cgit.freedesktop.org/ModemManager/ModemManager/snapshot/ModemManager-b8f0f403499b185c7bd37a19e8bbf907344ac904.tar.bz2')
md5sums=('e71939dc8b140d4eac8fe5a8ea48560e')

build() {
#    unzip ModemManager-anydata.zip
  cd ${srcdir}/ModemManager-b8f0f403499b185c7bd37a19e8bbf907344ac904

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --disable-static

    make || return 1
    make DESTDIR="${pkgdir}" install || return 1

}