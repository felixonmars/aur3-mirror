# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-favorites
pkgver=0.15.5.0
pkgrel=1
pkgdesc="The plugin allows ypu to see your favorites."
arch=(i686 x86_64)
url="http://sarine.nl/gmpc/"
license="GPL"
depends=(libmpd libxml2 gtk2)
source=('http://download.sarine.nl/gmpc-0.15.5/gmpc-favorites-0.15.5.0.tar.gz')
md5sums=('fb6b0343a2f95fab179db941bf5b750c')

build() {
  cd ${startdir}/src
  mv index.php* ./${pkgname}-${pkgver}.tar.gz
  tar xzf ${pkgname}-${pkgver}.tar.gz 

  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
