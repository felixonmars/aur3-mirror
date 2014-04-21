# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Maintaner: McNoggins <gagnon88 (at) Gmail (dot) com>

_basename_=grub
pkgname=k${_basename_}editor
realname=KGRUBEditor
pkgver=0.8.5
pkgrel=3
pkgdesc="A KDE 4 GUI for GRUB"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/kgrubeditor"
license=("GPL")
depends=("${_basename_}" "kdelibs")
makedepends=("cmake" "automoc4")
conflicts=("${pkgname}")
replaces=("q${_basename_}editor")
source=(http://downloads.sourceforge.net/${pkgname}/${realname}-${pkgver}-src.tar.bz2)
md5sums=('c6d1fb21989f403276103887f344fdf3')

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	mkdir -p build/
	cd build/
	cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}/build

	make DESTDIR="${pkgdir}" install
}
