# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=amsynth
pkgver=1.4.0
pkgrel=1
pkgdesc="Analogue Modeling SYNTHesizer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license=('GPL')
depends=('gtkmm' 'jack' 'liblo')
makedepends=('desktop-file-utils' 'dssi' 'libtool')
install="$pkgname.install"
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('9193d334c89996cf44e98422e03318bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
