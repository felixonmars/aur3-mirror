# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=cvlview
pkgver=1.0.1
pkgrel=1
pkgdesc="2D and 3D viewer for arbitrary data sets using GPU power"
arch=('i686' 'x86_64')
url="http://cvtool.sourceforge.net/"
license=('GPL3')
depends=('cvtool' 'qt' 'glew')
#optdepends=('pfstools: support for RGBE, EXR, TIFF, PFM and DCRAW')
source=(http://downloads.sourceforge.net/cvtool/$pkgname-$pkgver.tar.bz2 \
        $pkgname.desktop)
md5sums=('29a372194a3c38e1379e3ff2f146c809'
         'a262652909bb906ca27dd16e72f2cd50')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -D -m644 src/icons/appicon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  rm "$pkgdir"/usr/share/info/dir
}

# vim:set ts=2 sw=2 et:
