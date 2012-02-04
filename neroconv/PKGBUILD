# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=neroconv
pkgver=1.00
pkgrel=2
pkgdesc="A program which converts Nero image files (nrg) to ISO9660"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/neroconv/"
license=('GPL2')
depends=('qt3')
source=(http://download.berlios.de/$pkgname/${pkgname}_${pkgver/\./_}.tar.bz2)
md5sums=('f52ac48163dee7781f050d9776cab53b')

build() {
  cd $srcdir/$pkgname
  # we need Qt3
  . /etc/profile.d/qt3.sh || return 1
  export PATH="$QTDIR/bin:$PATH"
  # make and install
  qmake || return 1
  sed -i 's_$(QTDIR)/bin/__' Makefile
  sed -i 's_( cd $(QTDIR)/src/moc && $(MAKE) )__' Makefile
  make || return 1
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
