# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=delaboratory-source
_pkgname=delaboratory
pkgver=0.5
pkgrel=1
pkgdesc="Adjust photos Non-destructively. Modify color/contrast using curves, mixer, and blending with floating-point precision per channel. Compiled from source-code version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/delaboratory"
license=('GPL3')
depends=('wxgtk' 'libxml2' 'libtiff')
makedepends=('wxgtk' 'libxml2' 'libtiff')
conflicts=('delaboratory')
source=(http://delaboratory.googlecode.com/files/$_pkgname-$pkgver.tar.gz
$_pkgname.desktop)
sha256sums=('f195ad001d58e14a0074897912bcd5bbc6993f2a1d25ff677693fe2b15fd441f'
            '2561c5e5872e2636e34da046b0389a2267297b3c7f625d603d0f5f4a6a1172ab')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s|\/usr\/local\/bin|$pkgdir\/usr\/bin|" Makefile # correct for $pkgdir
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
