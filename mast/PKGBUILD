# Contributor: farid abdelnour <farid at atelier-lab.org>
pkgname=mast
pkgver=0.2.2
pkgrel=1
pkgdesc="Audio streaming broadcaster and client using RTP over IPv4 and IPv6 Multicast/Unicast."
arch=('i686')
url="http://www.aelius.com/njh/mast/"
license=('GPL')
depends=('libsndfile' 'jack-audio-connection-kit' 'twolame' 'ortp')
source=(http://www.aelius.com/njh/mast/mast-0.2.2.tar.gz)
md5sums=(ebad0107336d1401879191596dce7897)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

