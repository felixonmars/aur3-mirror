# Contributor: Frank Scheffold <fscheffold@googlemail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=kwinbuttonapplet-improved
pkgver=0.5
pkgrel=1
pkgdesc="Improved KWin button plasma applet"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/KWinButton+applet+improved?content=143971"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'kdebase-lib')
conflicts=('kwinbuttonapplet')
source=("http://dl.dropbox.com/u/4514366/${pkgname}-${pkgver}.tar.gz")
md5sums=('1b76086c00541fa16a248d2850cc380a')

build() {
	cd $startdir/src/${pkgname}-${pkgver}
        mkdir build
        cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make || return 1
        make DESTDIR=$startdir/pkg install || return 1
}

