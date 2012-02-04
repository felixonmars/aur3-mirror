# Contributor: Jan Mette (funkyou) <jan.mette@berlin.de>

pkgname=kdestyle-domino
pkgver=0.4
pkgrel=5
pkgdesc="Domino is a style with a soft look. It allows to fine adjust the shininess of the widgets by customizable color gradients."
url="http://www.kde-look.org/content/show.php?content=42804"
license="GPL"
depends=('kdebase')
arch=('i686' 'x86_64')
source=(http://www.kde-look.org/CONTENT/content-files/42804-domino-$pkgver.tar.bz2 \
	domino-0.4_indicate_focus_on_qtoolbuttons.patch \
	domino-0.4_reset_global_config_group.patch \
	domino-0.4-fix-invisible-cursor-when-marking-text.patch)

md5sums=('c67bb1b986c4ff98ae640acff7b8562f' \
	 '740ce0c6eea64697728fb98ebf4ec855' \
	 '6f816799bbe56d1e26bf2c14f7f64e44' \
	 'bae3effd6154ddbd9cf9e2e3640599b7')

build() {
  	source /etc/profile.d/qt3.sh 
  	source /etc/profile.d/kde3.sh

	cd $srcdir/domino-$pkgver
	patch -p0 -i $startdir/src/domino-0.4_indicate_focus_on_qtoolbuttons.patch || return 1
	patch -p0 -i $startdir/src/domino-0.4_reset_global_config_group.patch || return 1
	patch -p1 -i $startdir/src/domino-0.4-fix-invisible-cursor-when-marking-text.patch || return 1
	
	./configure --prefix=/opt/kde --without-arts
        make || return 1
        make DESTDIR=$pkgdir install
}
