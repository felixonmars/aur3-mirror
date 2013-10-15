# Maintainer: p3nguin <rob at virtualaddiction dot net>
pkgname=chan-sccp-b
_pkgname=Chan_SCCP
pkgver=4.1
_pkgver=V4.1_STABLE
pkgrel=1
pkgdesc="Skinny Control Client Protocol (SCCP) channel driver for Asterisk"
arch=('i686')
url="http://chan-sccp-b.sourceforge.net/"
license=('GPL')
depends=()
makedepends=()
conflicts=(chan-sccp-b-svn)
backup=()
source=(http://downloads.sourceforge.net/project/$pkgname/V4/$_pkgname-$_pkgver.tar.gz)
md5sums=('cc7beaf746e3016ace73560422a4a1e5')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir/" install

  install -D conf/sccp.conf "$pkgdir/etc/asterisk/default.d/sccp.conf.default"
  install -D conf/sccp.conf.annotated "$pkgdir/etc/asterisk/default.d/sccp.conf.annotated.default"
  install -D conf/sccp_templated.conf "$pkgdir/etc/asterisk/default.d/sccp_templated.conf.default"

}

# vim:set ts=2 sw=2 et:
