_pkgname=gnome-autoar
pkgname=gnome-autoar-git
pkgver=20141014.0300e4b
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Automatic archives creating and extracting library"
url="https://github.com/GNOME/gnome-autoar"
license=('GPL')
makedepends=('gcc' 'git')
depends=('libarchive' 'glib2' 'gtk3' 'gnome-common' 'gtk-doc')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('git+https://github.com/GNOME/gnome-autoar.git')

md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --enable-gtk-doc

  make
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
