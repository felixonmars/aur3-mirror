# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=vala-010
_pkgname=vala
pkgver=0.10.4
pkgrel=1
pkgdesc="Compiler for the GObject type system (0.10 branch)"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL2.1')
depends=('glib2')
makedepends=('libxslt')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/0.10/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('4d23bd8b904ec59537ed5bcf44064104ccc41d639a3386cbc62d91f6bf0301c4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/opt/vala-0.10 \
              --enable-vapigen
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # make it nice
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s /opt/vala-0.10/bin/{vala,valac,vala-gen-introspect,vapicheck,vapigen}{-0.10} "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
