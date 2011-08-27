# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=libarc
pkgver=2.0.2
pkgrel=1
pkgdesc="Archive library"
arch=('i686')
url="http://www.onicos.com/staff/iz/release/#libarc"
license=('GPL2')
depends=()
source=(http://www.onicos.com/staff/iz/release/$pkgname-$pkgver.tar.gz)
md5sums=('ab4fcc3f3430af13cca599c6545c7a21') 

build() {
  cd $srcdir/$pkgname-$pkgver

  make || return 1
  make PREFIX=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
