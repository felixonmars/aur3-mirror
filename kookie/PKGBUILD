 
# Contributor: said <atvordhosbn at gmail dot com> 

pkgname=kookie
pkgver=0.1.1
pkgrel=1
pkgdesc="KDE program to mange recipes and shooping lists."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Kookie?content=117806"
license=('GPL2')
depends=('kdelibs')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('fedabf92d22b37e4aeb94a5a8531e069')

build() {
    cd  $srcdir/$pkgname-$pkgver
    cmake . -DCMAKE_INSTALL_PREFIX=/$pkgdir/usr || return 1
    make || return 1
    make INSTALL_ROOT=$pkgdir install || return 1 
}
