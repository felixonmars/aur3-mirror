# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=glib-controller-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Library providing Controllers for MVC applications"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/glib-controller/"
license=('GPL')
depends=('glib' )
makedepends=('git' 'autogen' 'devhelp' 'gtk-doc' 'intltool' 'gobject-introspection')
provides=('glib-controller')
conflicts=('glib-controller')
options=('!emptydirs')
source=("$pkgname"::'git+https://git.gnome.org/browse/glib-controller')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  major=$(grep "\[controller_major_version]" configure.ac | sed 's/.*\[\([0-9]*\).*/\1/')
  minor=$(grep "\[controller_minor_version]" configure.ac | sed 's/.*\[\([0-9]*\).*/\1/')
  micro=$(grep "\[controller_micro_version]" configure.ac | sed 's/.*\[\([0-9]*\).*/\1/')

  echo $major.$minor.$micro
}

build() {
  cd "$srcdir/$pkgname"
  
  ./autogen.sh --prefix=/usr \
               --enable-{gtk-doc,introspection}
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
