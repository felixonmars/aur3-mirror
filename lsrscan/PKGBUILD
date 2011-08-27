# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=lsrscan
pkgver=1.0
_rc=1
pkgrel=1
pkgdesc="lsrscan checks the behaviour of remote hosts to loose source routed packets"
url="http://www.synacklabs.net/projects/lsrscan/"
depends=('libpcap' 'libdnet')
license="GPL"
arch=(i686)

source=(http://www.synacklabs.net/projects/$pkgname/$pkgname-$pkgver-rc$_rc.tar.gz)
md5sums=('94664b5740c4ff82a4f5bd9a8a01b4a3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
