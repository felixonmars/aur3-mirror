# Maintainer: Jurij Podgoršek <gismopwn at gmail dot com>
# Contributor: tobias <tobias@archlinux.org>

pkgname=libmpd-beta
pkgver=0.20.0
pkgrel=1
pkgdesc="Signal based wrapper around libmpdclient"
arch=(i686 x86_64)
url="http://sarine.nl/libmpd"
license=('GPL')
depends=('glib2')
options=('!libtool')
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/libmpd-${pkgver}.tar.gz)
md5sums=('2f1c99e12c69f7d95cfd1e27368056ed')

build() {
  cd ${startdir}/src
  tar xzf libmpd-${pkgver}.tar.gz 
  cd $startdir/src/libmpd-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
