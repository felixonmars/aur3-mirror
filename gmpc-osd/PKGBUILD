# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-osd
pkgver=0.18.0
pkgrel=1
pkgdesc="Announces the currently playing song with a xosd overlay."
arch=(i686 x86_64)
url="http://sarine.nl/gmpc/"
license="GPL"
depends=('libmpd-beta>=0.18.0' 'libxml2' 'gmpc-beta>=0.18.0' 'xosd')
source=(http://download.sarine.nl/download/Programs/gmpc/0.18.0/${pkgname}-${pkgver}.tar.gz)
md5sums=('')

build() {
  cd ${startdir}/src
  tar xzf ${pkgname}-${pkgver}.tar.gz 
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

