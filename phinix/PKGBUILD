# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=phinix
pkgver=0.7.0
pkgrel=1
pkgdesc="A very light and simple Qt music player."
arch=('i686' 'x86_64')
url="http://phinix.sourceforge.net/"
license=('GPL')
optdepends=('xine-lib: backend' 
	    'phonon: backend')
depends=('qt' 'phonon')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/phinix/phinix-$pkgver-src.zip)
md5sums=('76b09eb86a62e2a05a6fec3ad50090ad')

build() {

cd $startdir/src/phinix-src
sed -i s,Phonon/,phonon/,g src/{CFilesOps.h,uiMainImpl.h,wMain.h}
#sed -i s,Phonon/,phonon/,g src/uiMainImpl.h
qmake || return 1
make || return 1
install -D -m755 Phinix $startdir/pkg/usr/bin/phinix

}
