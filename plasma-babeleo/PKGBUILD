# Contributor: Andi G. <andi.gihr@googlemail.com>
pkgname=plasma-babeleo
pkgver=0.5.1
pkgrel=1
pkgdesc="Simple plasmoid for fast translation of the clipboard content at http://www.leo.org."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Babeleo?content=110491"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/110491-babeleo-0.5.1.tar.gz)
md5sums=('b0270d5734ffd42f39da72a0884fb3ff')

build() {

cd $srcdir/babeleo-0.5.1
mkdir buildtmp
cd buildtmp

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
