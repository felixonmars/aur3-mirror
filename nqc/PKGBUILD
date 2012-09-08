# Contributor: Stefano Zamprogno <stefano.zamprogno@gmail.com>

pkgname=nqc
pkgver=3.1.r6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Not Quite C used to program Lego's RCX, with USB support"
url="http://bricxcc.sourceforge.net/nqc/"
license=('MPL')
depends=('gcc-libs' 'lego-udev-rules')
options=(docs)
source=(http://bricxcc.sourceforge.net/$pkgname/release/$pkgname-$pkgver.tgz
        nqc.sh)
md5sums=('2ed4b2728ab6f0d21723a466996ce91b'
         'fdf80aeb3b6c81029cb98cc1c858b50c')

build() {
  make -C "$srcdir"
}

package() {
  cd "$srcdir"

  # make install is crappy. we'll do it oursevles
  install -Dm755 "nqc.sh" "$pkgdir/etc/profile.d/nqc.sh"
  install -Dm644 "nqc-man-2.1r1-0.man" "$pkgdir/usr/share/man/man1/nqc.1"
  install -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" "bin"/*
}
