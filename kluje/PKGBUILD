# Contributor:  Evgeny Fedorov <applesin07@yandex.ru>
pkgname=kluje
pkgver=0.8
pkgrel=1
pkgdesc="KLuJe is a client for LiveJournal-based sites such as LiveJournal.com"
url="http://kluje.sourceforge.net/"
license="GPL"
arch=('i686')
depends=('kdelibs')
source=(http://dfn.dl.sourceforge.net/sourceforge/kluje/kluje-0.8.tar.gz)
md5sums=('983a4942848c5e84605bfe54b90ec852')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
