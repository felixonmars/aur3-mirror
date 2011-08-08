#Contributor: sxe <sxxe@gmx.de>

pkgname=befaded
_realname=befaded-kwin-fx
pkgver=0.4a
pkgrel=1
pkgdesc="A KWin Effect"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/BeFaded?content=121178"
depends=('kdebase-workspace>=4.7.0')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://kde-look.org/CONTENT/content-files/121178-${_realname}-${pkgver}.txz")
license=('GPL')
install=('befaded.install')



build() 

{
        cd $srcdir/${_realname}
        cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release .
        make || return 1
        make DESTDIR=$pkgdir install
	kbuildsycoca4
}


md5sums=('32858c224cd71b5672450c289225d9fc')
