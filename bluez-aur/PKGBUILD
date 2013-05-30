# Maintainer : Mark E. Lee

## Changelog
## Added install file 
## Added 'libical' dependency


pkgname='bluez-aur'
pkgver='5.5'
pkgrel='1'
pkgdesc='Official Linux Bluetooth Protocol Stack'
arch=('any')
url='http://www.bluez.org'
replaces=('bluez-libs' 'bluez-utils')
provides=('bluez-libs' 'bluez-utils')
depends=('dbus-core' 'systemd-tools' 'libical' 'glib2')
makedepends=('gstreamer0.10-base' 'libusb-compat' 'libsndfile' 'libusbx')
license=('GPL')
source=("http://ftp.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz"
        'bluez.install')
md5sums=('b5aec2d8df0d713c577c7abf3c69dab7'
         'ddb6a3636d5706a447283eedc40e0c86')

build() {
  cd "${srcdir}/${pkgname%-aur}-${pkgver}"/;  ## enter the source directory of bluez; remove "aur" from the pkgname
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/lib \
    --enable-usb \
    --enable-tools \
    --enable-cups \
    --mandir=/usr/share/man \
    --localstatedir=/var
  make clean && make;  ## clean the make directory and make the package
}

package() {
  install="bluez.install"
  cd "${srcdir}/${pkgname%-aur}-${pkgver}"/;  ## enter the source directory of bluez; remove "aur" from the pkgname
  make DESTDIR="${pkgdir}" install;  ## install the files into the package directory
}
