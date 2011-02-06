# Contributor: nofxx <x@<nick>.com>
pkgname=tokyodystopia
pkgver=0.9.13
pkgrel=1
pkgdesc="Full text search for TokyoCabinet"
arch=('i686' 'x86_64')
url="http://tokyocabinet.sourceforge.net"
license=('LGPL')
makedepends=('gcc>=3.1' 'make' 'pkgconfig')
depends=('zlib' 'bzip2' 'tokyocabinet>=1.4.20')
source=("http://tokyocabinet.sourceforge.net/dystopiapkg/${pkgname}-${pkgver}.tar.gz")
md5sums=('2418befbe1719d93ec00290da94bb92b')

build() {
  cd "$startdir/src/${pkgname}-${pkgver}"
  ./configure --prefix=/usr  
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
}
