# Contributor: Joao Enes <joaoenes@mail.pt>

pkgname=kpictorial
pkgver=0.9.1
pkgrel=1
pkgdesc="Logical game"
url="http://members.chello.at/roland.lezuo/kpictorial.html"
depends=('kdelibs')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f4c7d7de8bac9ff6432ecbc91ba3478f')
arch=('i686')
licence="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
