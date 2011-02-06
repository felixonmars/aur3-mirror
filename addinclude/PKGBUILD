# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=addinclude
pkgver=0.7
pkgrel=3
pkgdesc="A utility to easily add includes to C header- and sourcefiles"
arch=('x86_64' 'i686')
url="http://addinclude.roboticoverlords.org/"
license=('GPL')
makedepends=('go' 'upx')
source=("http://$pkgname.roboticoverlords.org/$pkgname-$pkgver.tbz2")
md5sums=('3ad426d00d9e69fadb630d1951a9adf1')
options=(!strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  msg2 "Compiling..."
  GOROOT=/usr/lib/go make || return 1
  # Compress the executable to stop makepkg from
  # complaining about references to $srcdir
  msg2 "Compressing..."
  upx addinclude
  install -Dm755 "$pkgname" \
    "$pkgdir/usr/bin/$pkgname" || return 1
  msg2 "Packaging..."
  install -Dm644 "$pkgname.1.gz" \
    "$pkgdir/usr/share/man/man1/$pkgname.1.gz" || return 1
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
}

# vim:set ts=2 sw=2 et:
