# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
# Constributor: Wilfried Fauvel <wilfried.fauvel at gmail>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
# Contributor: Martti K?hne <mysatyre at gmail dot com>

pkgname=mandelbulber2-svn
_pkg=mandelbulber2
pkgver=104  
pkgrel=1
pkgdesc="An experimental application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems. Early Alpha version"
arch=("i686" "x86_64")
url="https://code.google.com/p/mandelbulber2/"
license=("GPL3")
depends=('qt5-base' 'libjpeg-turbo' 'desktop-file-utils')
makedepends=('subversion' 'imagemagick')
provides=("$_pkg")
conflicts=("$_pkg")
install="${pkgname}.install"
source=("${_pkg}::svn+http://mandelbulber2.googlecode.com/svn/trunk/"
        "mandelbulber2.desktop"
)


pkgver() {
  cd mandelbulber2/mandelbulber2
  svnversion | tr -d [A-z]
}
prepare() {
  cd mandelbulber2/mandelbulber2
  cd Debug
  rm makefile
}

build() {
  cd mandelbulber2/mandelbulber2
  cd Debug
  qmake-qt5 mandelbulber.pro
  make
}

package() {
  cd mandelbulber2/mandelbulber2
  install -m755 -d "${pkgdir}/usr/bin"
  install -D -m644 "${srcdir}/mandelbulber2.desktop" "${pkgdir}/usr/share/applications/mandelbulber2.desktop"

  install -m755 -d "${pkgdir}/usr/share/mandelbulber"
  install -m755 -d "${pkgdir}/usr/share/applications"
  install -m755 -d "${pkgdir}/usr/share/icons"

  cp -ra "$srcdir/mandelbulber2/mandelbulber2/qt" "$pkgdir/usr/share/mandelbulber/qt"
  install -m755 "${srcdir}/mandelbulber2/mandelbulber2/Debug/mandelbulber2" "${pkgdir}/usr/bin/"
}

md5sums=('SKIP'
         '37a38e6e639cf206bdc2dffd304d69d1')
md5sums=('SKIP'
         'f7689a32bec7d429b1c9b6b740a37164')
