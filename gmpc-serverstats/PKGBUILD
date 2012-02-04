# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>
# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=gmpc-serverstats
pkgver=0.16.5
pkgrel=3
pkgdesc="Shows some statistics from mpd."
arch=(i686 x86_64)
url="http://sarine.nl/gmpc/"
license="GPL"
depends=('libmpd-beta>=0.16.5' 'libxml2' 'gmpc-beta>=0.16.5')
source=(http://download.sarine.nl/Programs/gmpc/0.16.5-beta1/${pkgname}-${pkgver}.tar.gz)
md5sums=('')

build() {
  cd ${srcdir}
  tar xzf ${pkgname}-${pkgver}.tar.gz 
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}

