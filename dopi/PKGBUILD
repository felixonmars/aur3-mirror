# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=dopi
pkgver=0.3.4
pkgrel=1
pkgdesc="A little application for updating Apple iPod devices"
url="http://www.snorp.net/log/dopi/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ipod-sharp' 'gtk-sharp-2' 'gnome-icon-theme')
makedepends=('perlxml' 'pkgconfig')
options=(!libtool)
source=(http://www.snorp.net/files/dopi/$pkgname-$pkgver.tar.gz)
md5sums=('9e56cb6b0665c2bfdeccfa55f5171b34')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -rf "${MONO_SHARED_DIR}"
}
