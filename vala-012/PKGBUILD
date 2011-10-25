# Maintainer: Brandon Invergo <brandon@brandoninvergo.com>

pkgname=vala-012
_pkgname=vala
pkgver=0.12.1
pkgrel=3
pkgdesc="Compiler for the GObject type system (0.12 branch)"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL2.1')
depends=('glib2')
makedepends=('libxslt')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/0.12/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/opt/vala-0.12 \
              --enable-vapigen
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # make it nice
  install -d -m755 ${pkgdir}/usr/bin
  ln -s /opt/vala-0.12/bin/{vala-0.12,valac-0.12,vala-gen-introspect-0.12,vapicheck-0.12,vapigen-0.12} ${pkgdir}/usr/bin/
}


