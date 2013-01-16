# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Fabio Linux <fbo.linux [at] gmail [dot] com>

pkgname=fbrun
pkgver=1.5
pkgrel=5
pkgdesc="A simple run utility from Fluxbox"
arch=('i686' 'x86_64')
url="http://www.fluxbox.org/"
license=('MIT')
depends=('gcc-libs' 'imlib2>=1.0.0' 'libxft' 'libxpm' 'libxrandr' 'libxinerama')
makedepends=('pkgconfig')
conflicts=('fluxbox')
source=(http://downloads.sourceforge.net/fluxbox/fluxbox-1.3.3.tar.bz2
        $pkgname-$pkgver.diff)
md5sums=('f555ca6f9dd8414a908fbf4f8bc93619'
         '6cf8ae5bc1fb9496217e008c028eef29')

build() {
  cd "$srcdir/fluxbox-1.3.3"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  ./configure --prefix=/usr \
      --enable-kde \
      --enable-gnome \
      --enable-xft \
      --enable-xinerama \
      --enable-imlib2 \
      --enable-nls
  # make -C util/$pkgname
  make
}

package() {
  cd "$srcdir/fluxbox-1.3.3"
  install -Dm755 util/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
