# Maintainer: Your Name <youremail@domain.com>
pkgname=xoris
pkgver=0.1e
pkgrel=1
pkgdesc="grabs color from the screen & dumps it to stdout"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/xoris/"
license=('custom:X11')
depends=('libx11')
optdepends=('netpbm: for rgb.txt')
makedepends=(imake)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f1e8abbb5e57f66f52335a37f5405207')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make

  cat >showrgb <<EOF
#!/bin/sh
# showrgb - fake showrgb, dropped from Xorg
cat /usr/share/netpbm/rgb.txt
EOF
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
  install -D -m755 showrgb "${pkgdir}/usr/bin/showrgb"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
