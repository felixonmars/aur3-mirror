# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: skualito <lepascalou@gmail.com>
pkgname=xdiary
pkgver=1.32
pkgrel=3
pkgdesc="Displays a one-month or full-year calendar, in association with a two-pane daily diary"
arch=(i686)
url="http://directory.fsf.org/project/xdiary"
license=('GPL2')
groups=()
depends=('sh' 'libxaw')
makedepends=('imake')
source=(http://fossies.org/unix/privat/old/xdiary-1.32.tgz)
md5sums=(d0503881b6c5f7071ef310a3303f4234) 

build() {
	  cd "$srcdir/$pkgname-$pkgver"
	  xmkmf
	  sed -i "s|-lXaw95|-lXaw|" Makefile
	  make || return 1
	  make install DESTDIR=${pkgdir}
	  mkdir -p $pkgdir/usr/share/man/man1
	  cp xdiary.man $pkgdir/usr/share/man/man1/xdiary.1
	  cp widget.man $pkgdir/usr/share/man/man1/widget.1
	  }

	  # vim:set ts=2 sw=2 et:
