# Maintainer: Dan Vratil <vratil@progdansoft.com>

pkgname=krunner-kopete-contacts
pkgver=0.4
pkgrel=1
pkgdesc="A KRunner plugin that allows you to open chat with Kopete contact just by typing it's name"
arch=('i686' 'x86_64')
depends=('kdebase-workspace>=4.3' 'qt')
makedepends=('cmake')
url="http://kde-apps.org/content/show.php?content=105263"
license=('GPL')
source=(http://kde-apps.org/CONTENT/content-files/105263-${pkgname}-${pkgver}.tar.gz)

build()
{
  cd $srcdir/
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
  make
  make DESTDIR=$startdir/pkg install


}
md5sums=('cccbf5906ff7e2755233456cfa31091a')
