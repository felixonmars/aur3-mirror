# Maintainer: Axper Jan <483ken _at_ gmail

pkgname=objobf
pkgver=0.5.0
pkgrel=2
pkgdesc="x86/Linux ELF relocatable object obfuscator"
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20040406115208/http://www.team-teso.net/projects/objobf/"
license=('LGPL')
source=(
  "https://web.archive.org/web/20040217131820/http://www.team-teso.net/projects/objobf/objobf-0.5.0.tar.bz2"
  "objobf.patch")
md5sums=(
  'ba6b6f098f2c1e48c6946c6b13f568bb'
  'bb0a9de3bc6ed44a849709f5dfcd9516')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/objobf.patch 

  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

package() {
  install -D "$srcdir/$pkgname-$pkgver/src/objobf" "$pkgdir/usr/bin/objobf"

  # Manpage
  install -m 644 -D "$srcdir/$pkgname-$pkgver/doc/objobf.1" "$pkgdir/usr/share/man/man1/objobf.1"
  gzip "$pkgdir/usr/share/man/man1/objobf.1"

  # Docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp --no-preserve=mode $srcdir/$pkgname-$pkgver/doc/{CHANGES,FAQ,LINKING,README} "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
