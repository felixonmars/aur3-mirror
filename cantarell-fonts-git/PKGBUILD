# Maintainer: Diego Principe <cdprincipe@at@gmail@dot@com>

_pkgname=cantarell-fonts
pkgname=cantarell-fonts-git
pkgver=0.13.3.gce42ef2
pkgrel=1
pkgdesc="Cantarell font family"
arch=('any')
url="http://abattis.org/cantarell/"
license=('GPL2')
depends=('fontconfig')
makedepends=('gnome-common')
provides=('cantarell-fonts')
conflicts=('cantarell-fonts')
install=cantarell-fonts.install
source=(git://git.gnome.org/cantarell-fonts)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --prefix=/usr --with-configdir=/etc/fonts/conf.avail
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="${pkgdir}" install
}

