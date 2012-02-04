#Contributor: Flamelab <panosfilip@gmail.com>

pkgname=beshadowed
_realname=beshadowed-kwin-fx
pkgver=0.8
pkgrel=1
pkgdesc="An improved Shadow plugin for KDE."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/BeShadowed?content=121607"
depends=('kdebase-workspace>=4.6.0')
makedepends=('cmake' 'automoc4')
source=("http://kde-look.org/CONTENT/content-files/121607-${_realname}-${pkgver}.txz")
license=('GPL')
install=('beshadowed.install')

build() 

{
        cd $srcdir/${_realname}
        cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release .
        make
        make DESTDIR=$pkgdir install
}

md5sums=('36dcd778d580ac0f719c6a16608771b5')
