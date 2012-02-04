pkgname=pango-unstable
_realname=pango
pkgver=1.29.3
pkgrel=3
pkgdesc="A library for layout and rendering of text (new unstable version)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2-git' 'cairo' 'libxft' 'libthai' 'freetype2')
makedepends=('gobject-introspection' 'libxt' 'gtk-doc')
conflicts=('pango')
provides=("pango=${pkgver}")
options=('!libtool' '!emptydirs')
install=pango.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_realname}/1.29/${_realname}-${pkgver}.tar.xz)
url="http://www.pango.org/"
sha256sums=('b0da90cdac7f384a1c678b9467d00b6b8167f12044f9db089bf359f88644e86e')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-included-modules=basic-fc
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
