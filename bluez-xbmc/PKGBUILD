# $Id$
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname=bluez-xbmc
realname=bluez
pkgver=4.98
pkgrel=3
pkgdesc="Libraries and tools for the Bluetooth protocol stack. Same as extra-package, just added a patch for XBMC."
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dbus-core')
makedepends=('gstreamer0.10-base' 'libusb-compat' 'libsndfile')
optdepends=("gstreamer0.10-base: bluetooth GStreamer support"
	"alsa-lib: Audio bluetooth devices support"
	"dbus-python: to run bluez-simple-agent"
	"pygobject: to run bluez-simple-agent"
	"libusb-compat: USB adapters support"
	"cups: CUPS backend")
conflicts=('bluez' 'bluez-libs' 'bluez-utils')
provides=('bluez' 'bluez-libs' 'bluez-utils')
replaces=('bluez' 'bluez-libs' 'bluez-utils')
options=('!libtool' 'emptydirs')
backup=(etc/bluetooth/{main,rfcomm,audio,network,input,serial}.conf
        'etc/conf.d/bluetooth' 'etc/dbus-1/system.d/bluetooth.conf')
source=("http://www.kernel.org/pub/linux/bluetooth/${realname}-${pkgver}.tar.bz2"
        'bluetooth.conf.d'
        'rc.bluetooth'
        'bluetooth.h.patch'
        'fix-a2dp.patch')
md5sums=('4aca8a0929250212e9a75fb60dd75b05'
         '7412982b440f29fa7f76a41a87fef985'
         '8f9498707f809506928b2e480d3b6789'
         '59be7e17ff24c255ef83d060611bdec5'
         '14eeaefd348c641f78784d8437bce7cf')

build() {
  cd "${srcdir}/${realname}-${pkgver}"
  
  patch -Np1 -i "${srcdir}/fix-a2dp.patch"
  patch -p0 < "${srcdir}/bluetooth.h.patch"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/lib \
    --enable-gstreamer \
    --enable-alsa \
    --enable-usb \
    --enable-tools \
    --enable-bccmd \
    --enable-dfutool \
    --enable-hid2hci \
    --enable-hidd \
    --enable-pand \
    --enable-dund \
    --enable-cups \
    --enable-wiimote \
    --disable-test
  make
}

package() {
  cd ${srcdir}/${realname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm755 ${srcdir}/rc.bluetooth ${pkgdir}/etc/rc.d/bluetooth
  
  install -d ${pkgdir}/etc/bluetooth
  install -m644 network/network.conf \
                input/input.conf \
                audio/audio.conf \
                serial/serial.conf \
    ${pkgdir}/etc/bluetooth/
  
  install -Dm644 ${srcdir}/bluetooth.conf.d \
    ${pkgdir}/etc/conf.d/bluetooth

  # FS#27630
  install -Dm755 test/simple-agent "${pkgdir}"/usr/bin/bluez-simple-agent
  install -Dm755 test/test-device "${pkgdir}"/usr/bin/bluez-test-device
  install -Dm755 test/test-input "${pkgdir}"/usr/bin/bluez-test-input
  sed -i 's#/usr/bin/python#/usr/bin/python2#' \
    "${pkgdir}"/usr/bin/bluez-simple-agent \
    "${pkgdir}"/usr/bin/bluez-test-device \
    "${pkgdir}"/usr/bin/bluez-test-input

  # http://mailman.archlinux.org/pipermail/arch-general/2011-April/019787.html
  rm "${pkgdir}"/lib/udev/rules.d/97-bluetooth.rules
}
