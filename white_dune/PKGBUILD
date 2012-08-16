# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=white_dune
pkgver=0.31beta560
pkgrel=1
pkgdesc="Low level VRML97 tool with simple NURBS/SuperFormula 3D Modeller"
arch=('i686' 'x86_64')
url="http://vrml.cip.ica.uni-stuttgart.de/dune/"
license=('GPL')
depends=('libjpeg' 'libpng' 'mesa' 'lesstif' 'libxmu' 'desktop-file-utils')
install=white_dune.install
source=(http://129.69.35.12/dune/$pkgname-$pkgver.tar.gz)
md5sums=('58ebc6887ecd6c669abf77a82fdd51ed')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr \
    --with-helpurl="/usr/share/doc/white_dune/index.html" \
    --with-protobaseurl="/usr/share/doc/white_dune"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 bin/* "$pkgdir"/usr/bin/
  install -d -m755 "$pkgdir"/usr/share/{applications,doc,pixmaps,man/man1}

  install -m644 man/* "$pkgdir"/usr/share/man/man1
  install -m644 desktop/kde/*.desktop "$pkgdir"/usr/share/applications/
  install -m644 desktop/kde/*.png "$pkgdir"/usr/share/pixmaps/
  cp -r  docs "$pkgdir"/usr/share/doc/white_dune
}
