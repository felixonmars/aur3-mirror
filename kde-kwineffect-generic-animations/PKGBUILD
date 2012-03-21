#Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

pkgname=kde-kwineffect-generic-animations
_name=generic_animations-kwin-fx
pkgver=0.7b
pkgrel=1
pkgdesc='A generic animation effect for Kwin.'
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Generic+Animations+%28BeGeneric+%3B-%29?content=145674"
depends=('kdebase-workspace>=4.8.0')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/145674-$_name-$pkgver.txz")
license=('GPL')
md5sums=('ed076c90f17f784e7c79806e78bd77a2')

build(){
  cd $srcdir/$_name
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release .
  make || return 1
}

package(){
  cd $srcdir/$_name
  make DESTDIR=$pkgdir install || return 1
}