# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=connie
pkgver=0.4.3_rc9
pkgrel=1
pkgdesc="Simple simulation of an electronic organ like e.g. Vox Continental."
arch=('i686' 'x86_64')
url="http://cryptomys.de/horo/Connie/index.html"
license=('GPL')
depends=('confuse' 'jack' 'qt')
source=("https://bitbucket.org/horo/connie/get/tip.tar.gz")
md5sums=('1b30aeeeba51b55066625ec8dee6e158')

build() {
  cd "${srcdir}/${pkgname}"
  
  sed -i "s_pentium3_native_" Makefile qt4/connie_qt4.pro
  make $pkgname_sse

  # experimental Qt4 Gui
  cd qt4 && qmake && make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/man/man1"
  install -Dm 755 ${pkgname}_sse "${pkgdir}/usr/bin/${pkgname}"

  # Man file
  gzip -9 ${pkgname}.1 -c > "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  # experimental Qt4 Gui
  install -Dm 755 qt4/${pkgname}_qt4 "$pkgdir/usr/bin"
}
