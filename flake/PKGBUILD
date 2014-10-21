# Maintainer: Lukas Martini <lutoma@ohai.su>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>

pkgname=flake
pkgver=0.11
pkgrel=3
pkgdesc="Open-source FLAC audio encoder, faster then libFLAC"
arch=("i686" "x86_64")
url="http://flake-enc.sourceforge.net/"
license=("LGPL")
depends=('glibc')
source=(http://downloads.sourceforge.net/flake-enc/$pkgname-$pkgver.tar.bz2)
md5sums=('a01f663adf897f872df71e1c28b7ae79')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make -j1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
