# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=plasmoid-tea-cooker
pkgver=0.3.0
pkgrel=2
pkgdesc="KDE 4 Plasma applet to assist all lovers of tea in the task of steeping tea for just the perfect length of time"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Tea+Cooker?content=85564"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/85564-TeaCooker.tar.gz
        plasma.patch)
md5sums=('3a58895b0927bf0b55b165968c71cbc1'
         '71fb4655b51e8471a446000fbcb7dddc')

build() {
  cd $srcdir/TeaCooker
  patch -p1 < $srcdir/plasma.patch
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$pkgdir install
}
