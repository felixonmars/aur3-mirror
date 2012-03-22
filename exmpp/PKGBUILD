# Contributor: Gunnar Kriik <gunnar.kriik@gmail.com>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>

pkgname='exmpp'
pkgver='0.9.9'
pkgrel='1'
pkgdesc='Fast and scalable library for the XMPP protocol written in Erlang'
arch=('i686' 'x86_64')
url='http://support.process-one.net/doc/display/EXMPP/exmpp+home'
license=('GPL')
depends=('erlang' 'expat' 'openssl' 'zlib')
source=("http://download.process-one.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('464b31ff4d709d8abb24cdb063d20c56')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -vif
  ./configure --prefix=/usr/lib/erlang/lib
  make; make DESTDIR=$pkgdir install
} 
