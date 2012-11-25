pkgname=vala-016
_pkgname=vala
pkgver=0.16.1
pkgrel=1
pkgdesc="Compiler for the GObject type system. Updated to the 24 september 0.18 release"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('glib2')
makedepends=('libxslt')
options=('!libtool')
source=(http://download.gnome.org/sources/${_pkgname}/0.16/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('8be28ff6347feecb391220ceb4e2209d32b697278e87ed7fc6c9fb1e9345e0d8')

build() {
  cd ${_pkgname}-${pkgver}

  ./configure --prefix=/opt/vala-0.16 --enable-vapigen
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  # make it nice
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/vala-0.16/bin/{vala-0.16,valac-0.16,vala-gen-introspect-0.16,vapicheck-0.16,vapigen-0.16} "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
