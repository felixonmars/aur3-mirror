# $Id: PKGBUILD 149110 2012-02-05 18:51:36Z dan $
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=sglib
pkgver=1.0.4
pkgrel=0
pkgdesc="Simple Generic Library for C"
arch=('any')
license=('GPL')
url="http://sourceforge.net/projects/sglib/"
source=("http://sourceforge.net/projects/sglib/files/latest/download?source=files")
md5sums=('2758e855351d9143023b0971fc04000b')

package() {
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname/$pkgver/
  cd "$srcdir/sglib-$pkgver"
  cp -rv doc "$pkgdir"/usr/share/doc/$pkgname/$pkgver/ 
  cp -rv samples "$pkgdir"/usr/share/doc/$pkgname/$pkgver/
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/$pkgver/
  install -Dm644 sglib.h "$pkgdir"/usr/include/sglib.h
}
