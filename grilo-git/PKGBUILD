# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=grilo
pkgname=$_pkgname-git
pkgver=0.2.10.19.g2c5e804
pkgrel=1
pkgdesc="Framework that provides access to various sources of multimedia content"
url="http://www.gnome.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtk3' 'libxml2' 'libsoup')
makedepends=('gobject-introspection' 'gtk-doc' 'vala')
optdepends=('grilo-plugins-git: Plugins for grilo')
options=('!libtool' '!emptydirs')
provides=("$_pkgname=0.2.11")
conflicts=($_pkgname)
source=(git://git.gnome.org/$_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/grilo-//' | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-static \
    --disable-debug --libdir=/usr/lib --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
