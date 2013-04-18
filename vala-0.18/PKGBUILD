# Maintainer: Grvrulz < grvrulz at conetfun dot com >

pkgname=vala-0.18
pkgver=0.18.1
pkgrel=1
pkgdesc="Compiler for the GObject type system - 0.18 version"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('bash' 'glib2')
makedepends=('libxslt')
provides=("vala=${pkgver}")
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgname%-0.18}/0.18/${pkgname-%0.18}-${pkgver}.tar.xz")
sha256sums=('7f5e2e8ca03f9fa2cf13acaf93bfdc3a7ad0a10b000a337ba9c6bdc021bdca32')

build() {
  cd "${srcdir}"/${pkgname%0.18}${pkgver}

# Build
  ./configure --prefix=/usr --enable-vapigen
  make
}

package() {
  cd "${srcdir}"/${pkgname%0.18}${pkgver}

# Install
  make DESTDIR="${pkgdir}" install

# Prevent conflicts
  rm -rf "${pkgdir}"/usr/{bin/{vala,valac,vala-gen-introspect,vapicheck,vapigen},share/{man/man1/{valac.1,vala-gen-introspect.1,vapigen.1},pkgconfig/vapigen.pc,vala}}
  mv "${pkgdir}"/usr/share/aclocal/vala.m4 "${pkgdir}"/usr/share/aclocal/vala-0.18.m4
  mv "${pkgdir}"/usr/share/aclocal/vapigen.m4 "${pkgdir}"/usr/share/aclocal/vapigen-0.18.m4
}

# vim:set ts=2 sw=2 et:
