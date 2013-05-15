# Contributor: Sebastian Benvenuti <sebastianbenvenuti@gmail.com>
pkgname=johnny
pkgver=1.1.3
pkgrel=1
pkgdesc="GUI for John the Ripper"
url="http://openwall.info/wiki/john/johnny"
arch=('any')
license="GPL"
depends=('qt4' 'john')
source=("http://openwall.info/wiki/_media/john/$pkgname$pkgver.tar.gz"
        "johnny-128.png"
        "johnny.desktop")
md5sums=('c9d13005df987d2487dbd1b06df264ed'
         '24db229679d72a303ad1c9dd8c238cab'
         '1650c897ad0fa04aebc29d9ab5a1a879')

build() {
  cd "${srcdir}/$pkgname$pkgver"
  /usr/lib/qt4/bin/qmake
  make
}

package() {
  cd "${srcdir}/$pkgname$pkgver"
  mkdir -p "${pkgdir}/opt/$pkgname"
  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${srcdir}/$pkgname$pkgver/*.o "${pkgdir}/opt/$pkgname/"
  mv ${srcdir}/$pkgname$pkgver/johnny* "${pkgdir}/opt/$pkgname/"
  mv "${srcdir}/johnny-128.png" "${pkgdir}/opt/$pkgname/"
  cat "${srcdir}/johnny.desktop" > "${pkgdir}/usr/share/applications/johnny.desktop"
  chmod 777 "${pkgdir}/usr/share/applications/johnny.desktop"
}
