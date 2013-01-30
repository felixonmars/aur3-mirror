# Maintainer: Daniele Paolella <danielepaolella@email.it>
pkgname=alicekeygen
pkgver=0.3
pkgrel=1
pkgdesc="Alice Telecom AGPF router WPA key recovery tool"
arch=(i686 x86_64)
url="http://code.google.com/p/alicekeygen/"
license=('GPL2')
changelog=ChangeLog
source=(http://alicekeygen.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d523f263889dd6de3fed7bc84fa03f7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc alicekeygen.c sha256.c -o alicekeygen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  install alicekeygen "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/alicekeygen"
  install -m 644 agpf_config.txt "$pkgdir/usr/share/alicekeygen"
}

# vim:set ts=2 sw=2 et:
