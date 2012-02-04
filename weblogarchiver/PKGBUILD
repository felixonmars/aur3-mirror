# Maintainer: Schtroumpfette <fpeterschmitt@voila.fr>
pkgname=weblogarchiver
pkgver=1.2
pkgrel=7
pkgdesc='Archiver for skyrocks blogs. New features are arriving.'
arch=(i686 x86_64)
url='http://weblogarchiver.fr.nf'
license=('GPL')
groups=
provides=
depends=('qt' 'unzip')
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=("http://weblogarchiver.fr.nf/telechargements/$pkgname-$pkgver-sources.zip")
md5sums=('6c0293c86b73bfcbd9c170e5101f1124')
 
build() {
	#preparing environnement
	mkdir $startdir/pkg/usr/bin -p
	mkdir $startdir/pkg/usr/share/applications -p
	mkdir $pkgdir/usr/share/pixmaps -p
	
	#Copying the appication icon
	cp $srcdir/images/icone.png $pkgdir/usr/share/pixmaps/weblogarchiver.png
	cd $srcdir
	
	#Configure & Make
	qmake
	make
	
	#Copying the executable
	mv $srcdir/WeblogArchiver $pkgdir/usr/bin/weblogarchiver

	#Making a .desktop file for menu entry
	echo "[Desktop Entry]
Encoding=UTF-8
Exec=weblogarchiver
Icon=weblogarchiver
Type=Application
Terminal=false
MultipleArgs=false
Name=WeblogArchiver
GenericName=WeblogArchiver
StartupNotify=false
Categories=Application;Network;
" > $pkgdir/usr/share/applications/weblogarchiver.desktop
}
