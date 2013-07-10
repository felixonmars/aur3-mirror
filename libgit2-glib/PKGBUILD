pkgname=libgit2-glib
pkgver=0.0.6
pkgrel=1
pkgdesc="glib wrapper library around the libgit2 git access library. "
arch=('i686' 'x86_64')
url="https://live.gnome.org/Libgit2-glib"
license=('GPL')
depends=('libgit2')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
source=($pkgname::git+https://git.gnome.org/browse/libgit2-glib#tag=v$pkgver)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g' | sed 's|^v||'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=${pkgdir} install
}
