# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=addinclude
pkgver=0.9
pkgrel=1
pkgdesc="A utility to easily add includes to C header- and sourcefiles"
arch=('x86_64' 'i686')
url="http://addinclude.roboticoverlords.org/"
license=('GPL')
makedepends=('go' 'upx')
source=("http://$pkgname.roboticoverlords.org/$pkgname-$pkgver.tbz2")
md5sums=('18bf5f4627606c8da5843a6d89b318ab')
options=(!strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  msg2 "Compiling..."
  GOROOT=/usr/lib/go make || return 1
  # Workaround for strip not working correctly
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
