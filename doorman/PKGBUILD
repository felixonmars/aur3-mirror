# Contributor: thereidos <cezarym@therek.net>

pkgname=doorman
pkgver=0.81
pkgrel=3
pkgdesc="The doorman guards the door of a server, manipulating firewall rules to admit only recognized parties."
url="http://doorman.sourceforge.net/"
depends=(libpcap lsof)
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('f0f30132a541122fa46f4d6d321260d9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/etc/rc.d
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  mv doormand.cf.EXAMPLE doormand.cf.EXAMPLE.local
  sed 's,/usr/local/etc/doormand/,/etc/doormand/,g' < doormand.cf.EXAMPLE.local > doormand.cf.EXAMPLE
  make DESTDIR=$startdir/pkg install
  cp $startdir/doormand.rc $startdir/pkg/etc/rc.d/doormand
  chmod 755 $startdir/pkg/etc/rc.d/doormand
  cp $startdir/knockcf $startdir/pkg/etc/doormand/knockcf.EXAMPLE
  chmod 600 $startdir/pkg/etc/doormand/knockcf.EXAMPLE
}
# end of file #
