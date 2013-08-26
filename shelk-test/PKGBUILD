# Contributor: Artem A Klevtsov <unikum.pm@gmail.com>

pkgname=shelk-test
pkgver=1.5.2
pkgrel=1
pkgdesc="Shelk-test is a program is designed for creating and editing tests, followed by tests of knowledge."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/Shelk-test?content=144619"
license=('GPL2')
depends=('qt4')
source=("http://sourceforge.net/projects/shelk-test/files/$pkgver/$pkgname-$pkgver-src.tar.gz")
md5sums=('0e8143a7767d6996ab806b51b013a8ce')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  #make INSTALL_ROOT="${pkgdir}" install
  install -Dm 755 usr/bin/${pkgname}-${pkgver} ${pkgdir}/usr/bin/${pkgname}-${pkgver}
  install -Dm 644 usr/share/applications/${pkgname}-${pkgver}.desktop ${pkgdir}/usr/share/applications/${pkgname}-${pkgver}.desktop
  install -Dm 644 usr/share/doc/${pkgname}-${pkgver}/shelk-help.html ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/shelk-help.html
  install -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/timage
  install -Dm 644 usr/share/doc/${pkgname}-${pkgver}/timage/* ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/timage/
  install -d ${pkgdir}/usr/share/${pkgname}-${pkgver}
  install -Dm 644 usr/share/${pkgname}-${pkgver}/*.* ${pkgdir}/usr/share/${pkgname}-${pkgver}/
  install -Dm 644 usr/share/${pkgname}-${pkgver}/tests/test1.xwt ${pkgdir}/usr/share/${pkgname}-${pkgver}/tests/test1.xwt
  install -d ${pkgdir}/usr/share/${pkgname}-${pkgver}/tempfile
  install -d ${pkgdir}/usr/share/${pkgname}-${pkgver}/languages/russian
  install -Dm 644 usr/share/${pkgname}-${pkgver}/languages/russian/* ${pkgdir}/usr/share/${pkgname}-${pkgver}/languages/russian/
}
