# Maintainer: maz-1 <loveayawaka@gmail.com>

_pkgname=nixnote2
pkgname=$_pkgname-qt5
pkgver=411.7a8d856
pkgrel=1
pkgdesc="Nixnote2 is a evernote client for linux.This package is a qt5 port."
arch=('any')
url="http://nevernote.sourceforge.net/"
license=('GPL2')
depends=('tidyhtml' 'opencv' 'hunspell'  'qt5-webkit' 'sqlite' 'poppler-qt5' 'qt5-base')
makedepends=('git' 'qtchooser' 'boost')
provides=($_pkgname)
conflicts=($_pkgname)
#source=("git://github.com/baumgarr/$_pkgname.git"
_revision="7a8d85673fb6984838d056c2e21e05d2a38aa01b"
source=("https://github.com/baumgarr/Nixnote2/archive/$_revision.zip"
	"port_nixnote2_to_qt5.patch")

md5sums=('ac7aa40e69d884e97727511a6e0b169c'
         '68dd0c9af2baf57774258029b2cf7ffd')
#_gitname=$_pkgname

#pkgver() {
#	cd "$srcdir/$_gitname"
#	echo "$(git rev-list --count HEAD).$(git describe --always)"
#}

build() {
	cd $srcdir/
	cd "$srcdir/Nixnote2-$_revision"
	#git checkout 7a8d85673f
	patch -p1 < ../port_nixnote2_to_qt5.patch
	qmake-qt5 ./NixNote2.pro
	make -f ./Makefile.Release
}

package() {
	cd "$srcdir/Nixnote2-$_revision"
	#make DESTDIR="$pkgdir" install
	mkdir -p $pkgdir/usr/share/nixnote2
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	install -m 755 ./nixnote2 $pkgdir/usr/bin/nixnote2
	cp -R ./certs $pkgdir/usr/share/nixnote2
	cp -R ./help $pkgdir/usr/share/nixnote2
	cp -R ./images $pkgdir/usr/share/nixnote2
	cp -R ./qss $pkgdir/usr/share/nixnote2
	cp -R ./translations $pkgdir/usr/share/nixnote2
	cp -R ./java $pkgdir/usr/share/nixnote2
	cp ./changelog.txt $pkgdir/usr/share/nixnote2
	cp ./copyright $pkgdir/usr/share/nixnote2
	cp ./gpl.txt $pkgdir/usr/share/nixnote2
	cp ./license.html $pkgdir/usr/share/nixnote2
	cp ./README.txt $pkgdir/usr/share/nixnote2
	cp ./shortcuts.txt $pkgdir/usr/share/nixnote2
	cp ./nixnote2.desktop $pkgdir/usr/share/applications
}
