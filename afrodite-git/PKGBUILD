# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=afrodite-git
pkgver=0.12.0.13.g9ec1f44
pkgrel=1
pkgdesc="Library containing the completion engine for Vala language"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vtg/"
license=('GPL2')
depends=('vala0.16')
makedepends=('git' 'gnome-common')
options=(!libtool)
provides=('afrodite')
conflicts=('afrodite')
source=('vala-toys::git://gitorious.org/vala-toys/vala-toys.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/vala-toys
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${srcdir}/vala-toys"
  sed 's|valac|valac-0.16|g' -i configure.ac
}

build() {
  cd "${srcdir}/vala-toys"

  ./autogen.sh --disable-gen-project --disable-vtg-plugin --enable-afrodite --prefix=/usr
  ## The 1st run determinates if we alredy have afrodite installed in the system
  ## and becouse we don't it exist with failure code and pacman terminates || error 0, prevents that
  make || return 0
  make
}

package() {
  cd "${srcdir}/vala-toys"

  make DESTDIR="${pkgdir}/" install
  mv "${pkgdir}/usr/share/doc/vtg/" "${pkgdir}/usr/share/doc/afrodite"
}

