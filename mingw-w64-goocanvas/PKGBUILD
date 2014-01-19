# Maintainer: blackleg <hectorespertpardo@gmail.com>
#Based in goocanvas package
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>


pkgname=mingw-w64-goocanvas
pkgver=2.0.2
pkgrel=2
pkgdesc="A cairo canvas widget for GTK+"
arch=('any')
url="http://live.gnome.org/GooCanvas"
depends=("mingw-w64-gtk3")
makedepends=("mingw-w64-gcc" "mingw-w64-pkg-config" "python")
license=("LGPL")
options=(!strip !buildflags staticlibs)
source=(http://ftp.gnome.org/pub/GNOME/sources/goocanvas/2.0/goocanvas-$pkgver.tar.xz)
sha256sums=('f20e5fbef8d1a2633033edbd886dd13146a1b948d1813a9c353a80a29295d1d0')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  for _target in ${_targets}; do
    mkdir -p ${srcdir}/goocanvas-build-${_target} && cd ${srcdir}/goocanvas-build-${_target}
    cp -R $srcdir/goocanvas-$pkgver/* .
	./configure --prefix=/usr/${_target} \
      		--build=$CHOST \
      		--host=${_target} \
      		--enable-static
  	make
    cd src
  done
}
        
package() {
  for _target in ${_targets}; do
    cd ${srcdir}/goocanvas-build-${_target}
	make DESTDIR="${pkgdir}" install   
  done
}
