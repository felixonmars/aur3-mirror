# Maintainer : Vinilox <vinilox@vinilox.eu>

pkgname=vala-014
_pkgname=vala
pkgver=0.14.2
pkgrel=4
pkgdesc="Compiler for the GObject type system (0.14 branch)"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL2.1')
depends=('glib2')
makedepends=('libxslt')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/0.14/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('807e6978484f66cab3cf4fefd72f37a4293d2831d7a5fd29119bdf9d38a5b3d0')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/opt/vala-0.14 \
              --enable-vapigen
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # make it nice
  install -d -m755 ${pkgdir}/usr/bin
  ln -s /opt/vala-0.14/bin/{vala-0.14,valac-0.14,vala-gen-introspect-0.14,vapicheck-0.14,vapigen-0.14} ${pkgdir}/usr/bin/
}
