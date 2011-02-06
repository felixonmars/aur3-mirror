# Contributor: Yejun Yang <yejunx AT gmail DOT com>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=libsrtp
pkgver=1.4.2
pkgrel=3
pkgdesc="Open-source implementation of the Secure Real-time Transport Protocol (SRTP)"
url="http://srtp.sourceforge.net/srtp.html"
arch=('i686' 'x86_64')
license=('BSD')
options=()
source=(http://srtp.sourceforge.net/srtp-$pkgver.tgz)
md5sums=('7b0ffbfad9bbaf33d397027e031cb35a')

build() {
  cd $srcdir/srtp
  ./configure --prefix=/usr
  make CFLAGS="${CFLAGS} -fPIC" || return 1
  make DESTDIR=$pkgdir install || return 1
}
