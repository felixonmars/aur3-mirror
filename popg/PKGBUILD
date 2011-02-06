# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=popg
pkgver=3.3
pkgrel=1
pkgdesc="A one-locus, two-allele genetic simulation program for use by students."
arch=('i686' 'x86_64')
url="http://evolution.gs.washington.edu/popgen/popg.html"
license=('custom')
depends=('gtk2')
source=(http://evolution.gs.washington.edu/popgen/popgsrc.tar.gz
	desktop_popg.patch
	icon_popg.patch)

build() {


cd $srcdir/PopG_${pkgver}_src
patch -p1 <../desktop_popg.patch
patch -p1 <../icon_popg.patch
sed -i s,"cp popg","install -D -m755 popg",g Makefile.gtk
make DISTDIR=/usr -f Makefile.gtk || return 1
mkdir -p $pkgdir/usr/bin
make DISTDIR=$pkgdir/usr -f Makefile.gtk install || return 1
install -D -m644 popg.xpm $pkgdir/usr/share/pixmaps/popg.xpm
install -D -m644 popg.desktop $pkgdir/usr/share/applications/popg.desktop
install -D -m644 copyright $pkgdir/usr/share/licenses/popg/copyright

}
md5sums=('2da157a60152958b324707d4bdd4f21c'
         'c038f50893cfe120b62f745ca8f4cfbe'
         'ccf89725354e64417eb0e6989316714b')
