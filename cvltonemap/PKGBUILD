# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=cvltonemap
pkgver=0.2.4
pkgrel=1
pkgdesc="Interactive tone mapping tool for HDR images using GPU power"
arch=('i686' 'x86_64')
url="http://cvtool.sourceforge.net/"
license=('GPL3')
depends=('cvtool' 'qt')
optdepends=('pfstools: support for RGBE, EXR, TIFF, PFM and DCRAW')
source=(http://downloads.sourceforge.net/sourceforge/cvtool/$pkgname-$pkgver.tar.bz2 \
        $pkgname.desktop)
md5sums=('53da314c208ee78fbf72f898a63355e4'
         'eee66e728e905e2cdfcd11b3deb009bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's|qt4/Qt|Qt|g' configure
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -D -m644 src/appicon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  rm "$pkgdir"/usr/share/info/dir
}

# vim:set ts=2 sw=2 et:
