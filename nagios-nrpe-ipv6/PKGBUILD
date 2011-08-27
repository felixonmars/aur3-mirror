# Maintainer: sh0 <mee@sh0.org>
pkgname=nagios-nrpe-ipv6
pkgver=2.12
pkgrel=1
pkgdesc="Nagios Remote Plugin Executor (with IPv6 support)"
arch=(i686 x86_64)
url="http://nagios.org"
license=('GPL')
depends=('openssl')
conflicts=('nagios-nrpe')
replaces=('nagios-nrpe')
backup=(etc/nrpe.cfg)
options=(!libtool)
install=nrpe-ipv6.install
source=(http://downloads.sourceforge.net/nagios/nrpe-$pkgver.tar.gz nrpe-ipv6.patch nrpe-ipv6.install nrpe-ipv6.rc)
md5sums=('b2d75e2962f1e3151ef58794d60c9e97'
         'd48d2bde66a3d3d3f68dc7f9964d4387'
         '4bca8b43d322aeaf9e170e3b61994a7d'
         'c36560d4b10002c78446aa6abd399401')

build() {
  cd "$srcdir/nrpe-$pkgver"

  patch -sp1 < $srcdir/nrpe-ipv6.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc --bindir=/usr/sbin --enable-ssl
  make all
}

package() {
  cd "$srcdir/nrpe-$pkgver"

  #make DESTDIR="$pkgdir/" install

  install -D -m644 sample-config/nrpe.cfg $pkgdir/etc/nrpe.cfg
  install -D -m644 sample-config/nrpe.xinetd $pkgdir/etc/xinetd.d/nrpe
  sed -i -e "s/default: on/default: off/" \
         -e "s/disable         = no/disable         = yes/" $pkgdir/etc/xinetd.d/nrpe

  install -D -m755 src/nrpe $pkgdir/usr/sbin/nrpe

  install -D -m755 $srcdir/nrpe-ipv6.rc $pkgdir/etc/rc.d/nrpe
}

# vim:set ts=2 sw=2 et:
