# Maintainer: Dominik Fuchs <dominik.fuchs (at) wur.nl>
# Contributor: agvares <agvares13@gmail.com>

pkgname=debea
pkgver=1.4.2
pkgrel=1
pkgdesc="Object Relational Mapping library (ORM) for C++"
url="http://debea.net/trac"
arch=('i686' 'x86_64')
license=('custom:wxWindows')
depends=()
makedepends=()
source=(http://www.debea.net/download/dba-$pkgver.tar.gz
        LICENSE)
md5sums=('06ec1ef58cc99d116c930c41188b68ac'
         '4e42d2441478bf2ff2b342e978ad994f')

build() {
  cd $srcdir/dba-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
  
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
