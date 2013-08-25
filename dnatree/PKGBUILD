# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=dnatree
pkgver=1.3
pkgrel=1
pkgdesc="A program that simulates the branching of an evolutionary tree."
arch=('i686' 'x86_64')
url="http://evolution.gs.washington.edu/dnatree/"
license=('custom')
depends=('glibc')
source=(http://evolution.gs.washington.edu/dnatree/Makefile
	http://evolution.gs.washington.edu/dnatree/dnatree.h
	http://evolution.gs.washington.edu/dnatree/dnatree.c
	http://evolution.gs.washington.edu/dnatree/dnatree.html
	desktop_dnatree.patch
	icon_dnatree.patch)
md5sums=('e381a4430a33541f1520071ec15dce7f'
         'a75a13baae99403e5a570cb0206e0a18'
         '3ceacaac29033b5213e0b390c10f7d5b'
         '9e63f290eec1e8f9aeb9b61797a56b13'
         '392c2abca0390c79cc1c5308c0d9e996'
         'b437e0018ba89e8019eaa05189f0ce41')


prepare() {
  patch -p1 <../desktop_dnatree.patch
  patch -p1 <../icon_dnatree.patch
}

build() {
  make DISTDIR=/usr
}

package() {
install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
install -D -m644 dnatree.desktop $pkgdir/usr/share/applications/dnatree.desktop
install -D -m644 dnatree.xpm $pkgdir/usr/share/pixmaps/dnatree.xpm

mkdir -p $pkgdir/usr/share/licenses/dnatree
echo "This program and its documentation is copyright to The University of Washington, 1999-2004. Its free distribution and use is permitted, including using 
multiple copies in classrooms. Resale or use in a commercial product is not permitted without our permission." > $pkgdir/usr/share/licenses/dnatree/copying

}
