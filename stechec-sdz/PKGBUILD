#Contributor: Basile CLEMENT <cbasile06 at gmail dot com>
pkgname=stechec-sdz
pkgver=0.5.13
pkgrel=1
pkgdesc="Stechec version for Bombazero, the SdZ contest for Summer 2009"
arch=('i686' 'x86_64')
url="http://wiki.sdz.fr.cr/"
license=('GPL')
depends=('sdl_image' 'ruby' 'sdl_ttf' 'sdl_gfx' 'xerces-c-2')
makedepends=('make' 'gcc' 'libtool' 'autoconf')
provides=()
conflicts=()

replaces=()
backup=()
install=
source=(http://src.sdz.fr.cr/stechec-sdz-${pkgver}.tar.gz)
md5sums=(0966662e530e7d9a51c7d34f6b9202d3)

build() {
  cd ${srcdir}/stechec-sdz-${pkgver}
  ./bootstrap
  ./configure --disable-documentation --with-xerces=/opt/xerces-c-2   --prefix=/usr
  make || return 1

  make DESTDIR=${pkgdir} install || return 1

}
