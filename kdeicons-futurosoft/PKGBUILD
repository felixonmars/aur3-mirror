# old Contributor: Joonas Niilola <juippis@roskakori.org>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kdeicons-futurosoft
pkgver=0.5.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Sweet icon pack for KDE, inspirated by Vista."
url="http://www.kde-look.org/content/show.php?content=50667"
license=('GPL')
source="http://i-soldi.com/futurosoft/Futurosoft-Icons-${pkgver}.tar.gz"
md5sums=('adf9c1ea9d4b9e3f271e71c8724997ff')
depends=('kdebase')

build() {
	cd $startdir/src
	
	mkdir -p $startdir/pkg/opt/kde/share/icons/
	mv "Futurosoft Icons $pkgver" "futurosoft"
	cp -r "futurosoft" $startdir/pkg/opt/kde/share/icons/
}
