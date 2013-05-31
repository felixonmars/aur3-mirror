# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=spell
pkgver=1.1
pkgrel=1
pkgdesc="A spell checking program which prints each misspelled word on a line of its own."
arch=('i686' 'x86_64')
url="http://savannah.gnu.org/projects/spell/"
license=('GPL3')
depends=('glibc')
install="$pkgname.install"
source=("http://ftp.gnu.org/gnu/spell/spell-$pkgver.tar.gz")
md5sums=('c1dc2c4fd30b28d6480279b79a6fb889')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" \
       infodir="$pkgdir/usr/share/info" install
}
