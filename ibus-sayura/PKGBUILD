# Contributor: Kesara Nanayakkara Rathnayake <kesara@kesara.lk>

pkgname=ibus-sayura
pkgver=1.3.1
pkgrel=1
pkgdesc="Sinhala Transe IME engine for ibus."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/ibus-sayura/"
license=('GPL')
depends=('ibus')
source=(https://fedorahosted.org/releases/i/b/ibus-sayura/$pkgname-$pkgver.tar.gz)
md5sums=('97074cccdaad1332d470aee92fac645e');

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
