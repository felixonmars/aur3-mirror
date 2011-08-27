# Contributor: Charlie S. <staticsunn@gmail.com>

pkgname=qvwm
pkgver=1.1.12
pkgrel=1
pkgdesc="qvwm provides a strong solution for a Windows 95/98 like environment on X Window System."
arch=(i686 x86_64)
url="http://www.csg.is.titech.ac.jp/~kourai/qvwm/"
license=('Unknown')
depends=('libx11')
source=($url/archive/qvwm/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('688c44ca560e42315879f5b373d94a38')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
