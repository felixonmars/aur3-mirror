# $Id: PKGBUILD,v 1.15 2006/09/28 11:51:15 tpowa Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=ipfm
pkgver=0.11.5
pkgrel=4
pkgdesc="IP Flow Meter, a bandwidth analysis tool"
arch=(i686 x86_64)
backup=(etc/ipfm.conf)
depends=('glibc' 'bash' 'libpcap')
source=(http://robert.cheramy.net/ipfm/archive/$pkgname-$pkgver.tgz ipfm)
url="http://robert.cheramy.net/ipfm/"
md5sums=('7331aeeabf47cbd37603abe75355fe20' 'c0afca0772b2066acdba883451a891ee')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make ROOT=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  cp ../ipfm $startdir/pkg/etc/rc.d
}
