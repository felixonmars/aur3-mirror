# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Claudio Pisa <clauz@ninux.org>
pkgname=olsrd
pkgver="0.6.6"
pkgrel=1
pkgdesc="OLSR routing daemon"
arch=(i686 x86_64 ppc)
url="http://www.olsr.org"
license=('BSD')
depends=('glibc')
makedepends=('bison')
backup=(etc/olsrd.conf)
install=olsrd.install
source=(http://www.olsr.org/releases/0.6/${pkgname}-${pkgver}.tar.bz2 rc.d.olsrd)
sha256sums=('4155ca605336278606409d41193cf385f1d1a01bbb3062c1838939657bb76ec1'
            '95ad80b18efbafdb2e4d5cf12899ccadd8089e32d5d8712d4fa4d3acc1fe6332')

build() {
  cd `ls -Fd $srcdir/olsrd* | grep /$`
  make OS=linux build_all || return 1
}

package() {
  cd `ls -Fd $srcdir/olsrd* | grep /$`
  make DESTDIR=$pkgdir install_all || return 1
  mkdir -p $pkgdir/etc/rc.d
  cp $srcdir/rc.d.olsrd $pkgdir/etc/rc.d/olsrd
  chmod 755 $pkgdir/etc/rc.d/olsrd
  mkdir -p $pkgdir/usr/share/licenses/olsrd
  cp license.txt $pkgdir/usr/share/licenses/olsrd/
}

