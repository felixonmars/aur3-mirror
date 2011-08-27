# $Id: PKGBUILD,v 1.10 2008/12/14 02:33:30 BaSh Exp $
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: Torin Daniel <torindan@gmail.com>
# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=fbpanel-fr
pkgver=6.1
pkgrel=1
pkgdesc="NetWM compliant desktop panel, translated in french"
arch=('i686' 'x86_64')
url="http://fbpanel.sourceforge.net/"
depends=('gtk2')
conflicts=('fbpanel')
provides=('fbpanel')
license=('GPL')
source=("http://downloads.sourceforge.net/fbpanel/fbpanel-${pkgver}.tbz2"
        "fr.patch")
md5sums=('80ca0c64195b30587cfcb8c2cd9887a0'
         '91cb6b8ed284f84dba17b59e8305c510')

build() {
  cd "$srcdir"
  patch -Np0 -i "$srcdir/fr.patch"
  cd "$srcdir/fbpanel-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
