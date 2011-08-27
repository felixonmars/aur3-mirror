# $Id: PKGBUILD,v 1.2 2007/08/01 02:12:34 Snowman Exp $
#Contributor: Sven Kauber <celeon@gmail.com>
#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=kdedecor-crystalgl
pkgver=0.8.1
pkgrel=1
pkgdesc="Transparent window decoration theme with a simple design and OpenGL-based effects"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=18983"
license=('GPL')
depends=('kdebase')
makedepends=('kdelibs')
source=(http://www.kde-look.org/CONTENT/content-files/18983-crystalgl-$pkgver.tar.bz2)
md5sums=('386e46c52b3277b8d0a2c571c6917289')

build() {
  cd $startdir/src/crystalgl-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}

