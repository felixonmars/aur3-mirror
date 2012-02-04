# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=skyeye-git
pkgver=20110123
pkgrel=4
pkgdesc="An emulator which supports various ARM platforms"
arch=('i686' 'x86_64')
url="http://www.skyeye.org/"
license=('GPL')
depends=('libx11' 'libxpm')
optdepends=('cross-arm-elf-gcc-base' 'gdb')
makedepends=('git')
source=("0001-Add-some-macro-judgment-for-ubuntu-10.10.patch" "fix-makefile.patch")
sha256sums=('e134cdc963941bdaf5132e61f7dcd77053bb0862ab664267b3cabfe289c150cc' '2d509b64fe6f16db290bb190f5d9ffdf0ec611df940a37363f3f774d3d51132c')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d "$srcdir/skyeye" ]; then
	  cd skyeye && git pull origin
	  msg "The local files are updated."
  else
	  git clone git://skyeye.git.sourceforge.net/gitroot/skyeye/skyeye
	  cd skyeye
  fi

  patch -p1 < ../0001-Add-some-macro-judgment-for-ubuntu-10.10.patch
  patch < ../fix-makefile.patch
  autoreconf
  ./configure --sysconfdir=/usr/share --prefix=/usr
  make lib
  make
}

package() {
	cd "$srcdir/skyeye"
	make DESTDIR="${pkgdir}" install_lib
	make DESTDIR="${pkgdir}" install

	install -d ${pkgdir}/opt/skyeye
	mv ${pkgdir}/usr/testsuite ${pkgdir}/opt/skyeye/

	rm ${pkgdir}/usr/include/*.h
	rm ${pkgdir}/usr/lib/libbfd.a
	rm ${pkgdir}/usr/lib/libbfd.so
	rm ${pkgdir}/usr/lib/libiberty.a
	rm ${pkgdir}/usr/lib/libopcodes.a
	rm ${pkgdir}/usr/lib/libopcodes.so
}
