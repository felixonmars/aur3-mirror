# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-stopbutton
pkgver=0.15.5.0
pkgrel=1
pkgdesc="This is the simplest plugin of the lot, it adds a stop button to the controls in the main window."
arch=(i686 x86_64)
url="http://sarine.nl/gmpc/"
license="GPL"
depends=(libmpd libxml2 gtk2)
source=('http://download.sarine.nl/gmpc-0.15.5/gmpc-stopbutton-0.15.5.0.tar.gz')
md5sums=('ef23c2ace387e0f697e3cdbfc3bbdc95')

build() {
  cd ${startdir}/src
  mv index.php* ./${pkgname}-${pkgver}.tar.gz
  tar xzf ${pkgname}-${pkgver}.tar.gz 

  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
