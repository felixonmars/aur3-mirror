# Contributor: Jeff Bailes <thepizzaking@gmail.com>
#  Previous contributor: bimbo
# Maintainer: Nathan O <ndowens04 at gmail dot com>

pkgname=gift-ares
pkgver=0.3.0
pkgrel=3
pkgdesc="A plugin for giFT that connects to the Ares peer-to-peer filesharing network."
arch=('i686' 'x86_64')
url="http://gift-ares.berlios.de/"
license=('GPL')
makedepends=('pkgconfig')
depends=('gift')
options=('!libtool')
source=(http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}.tar.bz2 nodes)
md5sums=('51ca0cf8aad7e1ea5ffbbca2fa71c1db' '3241f40387d52c58b5216057838c3ce3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make 
  make DESTDIR=${pkgdir} install 
}
