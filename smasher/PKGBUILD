# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Maciej Ciemborowicz <moonkey[at]op[dot]pl>

pkgname=smasher
pkgver=1.1.7
pkgrel=1
pkgdesc="A wxGTK beat slicer for creating audio loops"
arch=('i686' 'x86_64')
url="http://smasher.sourceforge.net/"
license=('LGPL')
depends=('wxgtk' 'libmad' 'csound')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1ce86343882060eff307469e92017ff4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
