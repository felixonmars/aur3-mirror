# Contributor: Marc Argent <marc.argent@queens.ox.ac.uk>
pkgname=iscsitarget
pkgver=0.4.15
pkgrel=1
pkgdesc="An opensource iSCSI target"
url="http://iscsitarget.sourceforge.net"
license="GPL-2"
arch=('i686')
rundepends=('kernel26>=2.6.14')
depends=('kernel26>=2.6.14' 'openssl')
install=$pkgname.install
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('81390e388d87e3cc17383ef5f4322c28')

build() {
  cd $startdir/src/$pkgname-$pkgver
  export KERNSRC=/usr/src/linux-$(uname -r)
  sed -i 's/slackware-version/arch-release/' Makefile
  sed -i '/-depmod -aq/d' Makefile
  gzip -c doc/manpages/ietd.conf.5 > doc/manpages/ietd.conf.5.gz
  gzip -c doc/manpages/ietd.8 > doc/manpages/ietd.8.gz
  make || return 1
  make DISTDIR=$startdir/pkg install
  install -D -m755 etc/ietd.conf $startdir/pkg/etc/ietd.conf.sample
}
