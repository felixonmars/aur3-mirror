# $Id: PKGBUILD 63580 2010-01-17 23:27:59Z andrea $
# Maintainer: Austin <doorknob60 at gmail dot com> 
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=lib32-gdk-pixbuf
pkgver=0.22.0
pkgrel=8
pkgdesc="Image loading and manipulation library"
arch=('x86_64')
url="http://www.gtk.org/"
license=('GPL' 'LGPL')
depends=('lib32-gtk' 'gdk-pixbuf' 'lib32-libtiff' 'lib32-libpng')
makedepends=('libxt' 'gcc-multilib')
options=('!libtool')
source=(ftp://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/0.22/gdk-pixbuf-${pkgver}.tar.bz2
	gdk-pixbuf-0.22.0-bmp_reject_corrupt.patch
	gdk-pixbuf-0.22.0-bmp_secure.patch
	gdk-pixbuf-0.22.0-loaders.patch
        gdk-pixbuf-0.22.0.patch)
md5sums=('05fcb68ceaa338614ab650c775efc2f2'
	'd1fb93f1ae994875158a7e0c108c36f8'
	'5f59d5772b1482d885a180dbc581cf84'
	'3cf31ae0509747f72ac27a9fd96109c2'
	'e0f5f301ce958b7cea0be631ed7b8e56')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  		
  cd ${srcdir}/gdk-pixbuf-${pkgver}
  export SED=/bin/sed
  patch -Np1 -i ${srcdir}/gdk-pixbuf-0.22.0-bmp_reject_corrupt.patch || return 1
  patch -Np0 -i ${srcdir}/gdk-pixbuf-0.22.0-bmp_secure.patch || return 1
  patch -Np1 -i ${srcdir}/gdk-pixbuf-0.22.0-loaders.patch || return 1
  patch -Np0 -i ${srcdir}/gdk-pixbuf-0.22.0.patch || return 1
  libtoolize --force --copy --automake || return 1
  autoreconf --force --install || return 1
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-gtk-doc || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
