# Maintainer: Arturo Martinez

pkgname=bluez-git-wiimote
pkgver=20111229
pkgrel=2
pkgdesc="Libraries and tools for the Bluetooth protocol stack"

url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dbus-core')
makedepends=('gstreamer0.10-base' 'libusb-compat' 'libnl' 'libsndfile')
optdepends=("gstreamer0.10-base: bluetooth GStreamer support"
	"alsa-lib: Audio bluetooth devices support"
	"dbus-python: to run bluez-simple-agent"
	"pygobject: to run bluez-simple-agent"
	"libusb-compat: USB adapters support"
	"cups: CUPS backend"
	"libnl: netlink plugin")

conflicts=('bluez' 'bluez-libs' 'bluez-utils')
provides=('bluez=4.97' 'bluez-libs' 'bluez-utils')
replaces=('bluez' 'bluez-libs' 'bluez-utils')

options=('!libtool' 'emptydirs')
backup=(etc/bluetooth/{main,rfcomm,audio,network,input,serial}.conf
        'etc/conf.d/bluetooth' 'etc/dbus-1/system.d/bluetooth.conf')
source=('bluetooth.conf.d'
        'rc.bluetooth' '0001-Fix-wiimote-device_get_address-to-use-new-API.patch' 
'0002-Detect-Wii-Remotes-by-device-name.patch' )
md5sums=('7412982b440f29fa7f76a41a87fef985'
         '8f9498707f809506928b2e480d3b6789'
	'1e98cc7494b375152ad0d97fd77ddd45'
	'af9cfa5ce79201510a9bfbda6e7ed71e')

_gitroot="git://git.kernel.org/pub/scm/bluetooth/bluez.git"
_gitname="bluez"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."


  cd ${srcdir}/${_gitname}
 patch -p1 -i $srcdir/0001-Fix-wiimote-device_get_address-to-use-new-API.patch || return 1
 patch -p1 -i $srcdir/0002-Detect-Wii-Remotes-by-device-name.patch || return 1 
 
  ./bootstrap || return 1
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
    --enable-wiimote
  make
}
  
package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install || return 1

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
