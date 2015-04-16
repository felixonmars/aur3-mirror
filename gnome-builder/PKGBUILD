# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=gnome-builder
pkgver=3.16.1
pkgrel=1
pkgdesc='An IDE for writing GNOME-based software'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Builder'
license=('GPL3')
depends=('devhelp' 'libgit2-glib' 'gjs' 'clang' 'gedit')
makedepends=('intltool' 'gobject-introspection' 'llvm' 'gnome-common' 'pygobject-devel')
install='gnome-builder.install'
source=("https://git.gnome.org/browse/gnome-builder/snapshot/GNOME_BUILDER_$(echo ${pkgver}|sed 's|\.|_|g').tar.xz")
sha256sums=('b41706bfbc94b19199deb2eef09d7758f2bd64b390b765b33f0a31574b13c2a2')

build() {
  cd "$srcdir/GNOME_BUILDER_$(echo ${pkgver}|sed 's|\.|_|g')"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/GNOME_BUILDER_$(echo ${pkgver}|sed 's|\.|_|g')"
  make DESTDIR="${pkgdir}" install
}
