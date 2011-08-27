# $Id: PKGBUILD,v 1.14 2006/05/15 19:44:16 uid1016 Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=fnlib
pkgver=0.5
pkgrel=4
pkgdesc="Font rendering library for X11"
arch=(i686 x86_64)
depends=('imlib')
license=('GPL2')
url="http://www.enlightenment.org"
source=(http://dl.sourceforge.net/sourceforge/enlightenment/fnlib-$pkgver.tar.gz)
options=('!libtool')
md5sums=('99e9558739b97c82b728e408d9cb1f01')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
