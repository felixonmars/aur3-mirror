# Contributor: Marc poiroud <marci1@archlinux.fr>
pkgname=kouvert
pkgver=0.3
pkgrel=1
pkgdesc="graphical fstab file editor write with Qt"
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/Kouvert?content=15185"
license="GPL"
depends=('kdebase' 'pyqt')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.qt-apps.org/CONTENT/content-files/15185-$pkgname.$pkgver.tar.gz \
	kouvert.patch kouvert.desktop)
md5sums=('9ed98dcb31ad9c30a5e9c96759ed961f' '922dfe49bd4b41cb03fb28bfba697a82'\
         'eda81819a49520446cbf0d4f694a6b63')

build() {
	cd $startdir/src/$pkgname.$pkgver

	# patch
	patch -Np0 < $startdir/src/kouvert.patch

	# install bin file
	install -dv $startdir/pkg/usr/bin
	install -v -m755 $startdir/src/$pkgname.$pkgver/kouvert $startdir/pkg/usr/bin/

	# install desktop file
	install -dv $startdir/pkg/usr/share/applications
	install -v -m644 $startdir/src/kouvert.desktop $startdir/pkg/usr/share/applications/

	# install python file
	install -dv $startdir/pkg/usr/share/$pkgname/{fd_options,icones}
	install -v -m644 $startdir/src/$pkgname.$pkgver/icones/*.png $startdir/pkg/usr/share/$pkgname/icones/
	install -v -m644 $startdir/src/$pkgname.$pkgver/fd_options/* $startdir/pkg/usr/share/$pkgname/fd_options/
	install -v -m644 $startdir/src/$pkgname.$pkgver/*.py* $startdir/pkg/usr/share/$pkgname/
	install -v -m644 $startdir/src/$pkgname.$pkgver/{README,CHANGES} $startdir/pkg/usr/share/$pkgname/
}
