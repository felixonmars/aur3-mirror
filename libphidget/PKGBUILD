pkgname=libphidget
pkgver=2.1.8.20150410
pkgrel=1
pkgdesc="A library for Phidgets sensors and controllers"
arch=('i686' 'x86_64')
url="http://www.phidgets.com/"
license=('LGPL3')
depends=('libusb-compat');
source=("http://www.phidgets.com/downloads/libraries/${pkgname}_${pkgver}.tar.gz")
md5sums=('a1ee9be405179370767d70c8304c3ac8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-jni
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/etc/udev/rules.d/"
  make DESTDIR="${pkgdir}" install
  install -m 644 udev/99-phidgets.rules "${pkgdir}/etc/udev/rules.d/"
}
