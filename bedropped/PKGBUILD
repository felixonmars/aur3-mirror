#Contributor: sxe <sxxe@gmx.de>

pkgname=bedropped
_realname=bedropped-kwin-fx
pkgver=0.5
pkgrel=2
pkgdesc="A KWin Effect"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=120847"
depends=('kdebase-workspace>=4.3.0')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://kde-look.org/CONTENT/content-files/120847-${_realname}-${pkgver}.txz")
license=('GPL')
install=('bedropped.install')



build() 

{
        cd $srcdir/${_realname}
        cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release .
        make || return 1
        make DESTDIR=$pkgdir install
	kbuildsycoca4
}

md5sums=('0927ae3bf269ef98330af08aeafb6499')
