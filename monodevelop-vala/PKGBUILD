# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=monodevelop-vala
pkgver=2.8.8.1
pkgrel=1
pkgdesc="Vala language support for MonoDevelop"
arch=('i686' 'x86_64')
url="http://monodevelop.com"
license=('GPL')
depends=('monodevelop' 'mono-addins' 'vala' 'afrodite')
makedepends=('mono')
source=(http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2
         MonoDevelop.ValaBinding.dll.config)   
md5sums=('68867f12ba32ccf22c57b4b32d93184e'
         'feb17dbf03c0b6528aa4710192b4136d')

build() {
  export MONO_SHARED_DIR="${startdir}/src/.wabi"
  mkdir -p "$MONO_SHARED_DIR"
  
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cp "${srcdir}/MonoDevelop.ValaBinding.dll.config" MonoDevelop.ValaBinding.dll.config

  ./configure --prefix=/usr LIBVALA_CFLAGS="-pthread -I/usr/include/vala-0.14 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include" LIBVALA_LIBS="-pthread -lvala-0.14 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rm -r "$MONO_SHARED_DIR"
}
