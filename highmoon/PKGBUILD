# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Oliver Willemse 

pkgname=highmoon 
pkgver=1.2.4
pkgrel=3
pkgdesc="HighMoon is an Artillery or Worms like Game - which takes place in the universe" 
url="http://highmoon.gerdsmeier.net/" 
license="GPL"
arch=('i686')
depends=('sdl_image')
makedepends=('gcc') 
source=(http://highmoon.gerdsmeier.net/${pkgname}-${pkgver}.tar.gz)
md5sums=('4b16a749f844d5ca691c9774884979ec')

build() { 
  cd ${srcdir}/HighMoon
  make || return 1
  make INSTALLPATH=${pkgdir}/usr/share/highmoon INSTALLBIN=${pkgdir}/usr/bin install
  sed -i -e "s|${pkgdir}/usr/share/highmoon|/usr/share/highmoon|" ${pkgdir}/usr/bin/highmoon
}
