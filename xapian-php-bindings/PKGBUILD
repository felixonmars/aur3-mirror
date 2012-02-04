# Contributor: Andrey Smirnov <Smirnov.Andrey@gmail.com>
pkgname=xapian-php-bindings
pkgver=1.0.12
pkgrel=1
pkgdesc="Bindings allowing Xapian to be used from PHP"
arch=(i686 x86_64)
license=('GPL')
url="http://www.xapian.org"
depends=('xapian-core=1.0.12' 'php' )
makedepends=('xapian-core' 'php')
source=(http://www.oligarchy.co.uk/xapian/${pkgver}/xapian-bindings-${pkgver}.tar.gz)
md5sums=('ff5e1f5cee8b32031f9851cdcd88c506')

build()
{
  
  cd ${startdir}/src/xapian-bindings-${pkgver}
  # build party
  ./configure --prefix=/usr/ --with-php 
  make
  make check
  make DESTDIR=${startdir}/pkg install
}
