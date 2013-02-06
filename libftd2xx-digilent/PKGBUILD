# Maintainer: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=libftd2xx-digilent
pkgver=1.0.4
pkgrel=1
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('GPL')
depends=('glibc' 'libusb>=1.0.8')
options=(!strip)
source=(http://www.ftdichip.com/Drivers/D2XX/Linux/libftd2xx${pkgver}.tar.gz
        55-ft2232.rules)
md5sums=('348bc4e27783cba67d0a8bf80ab280c4'
         '5c6d646c3c5b28db1c3b880a04d4d79c')

# Since directory name is i386, not i686
_CARCH=${CARCH}
[ "${CARCH}" == "i686" ] && _CARCH=i386

package() {
  install -d "${pkgdir}"/usr/{lib,include}

  install -Dm755 "${srcdir}"/libftd2xx1.0.4/build/${_CARCH}/${pkgname}.so.${pkgver} "${pkgdir}"/usr/lib/${pkgname}.so.${pkgver}
  ln -sf /usr/lib/${pkgname}.so.${pkgver} "${pkgdir}"/usr/lib/${pkgname}.so
  
  install -Dm644 "${srcdir}"/libftd2xx1.0.4/build/${_CARCH}/${pkgname}.a "${pkgdir}"/usr/lib/${pkgname}.a
  
  install -m644 "${srcdir}"/libftd2xx1.0.4/{ftd2xx,WinTypes}.h "${pkgdir}"/usr/include/
  install -D -m755 "${srcdir}"/55-ft2232.rules "${pkgdir}"/etc/udev/rules.d/55-ft2232.rules
}
