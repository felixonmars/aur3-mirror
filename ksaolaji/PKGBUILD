#Contributor: Roberto Tarullo <nomeutente94@hotmail.it>
pkgname=ksaolaji
pkgver=0.1
pkgrel=1
pkgdesc="Clean all sorts of waste things in your system."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KSaoLaJi?content=140679"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=()
options=()
source=(http://kde-apps.org/CONTENT/content-files/140679-$pkgname-$pkgver.tar.bz2)
md5sums=('09fe9355a7a168efcc655852c9041b9c')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake .
  make || return 1
  make DESTDIR="$pkgdir/" install
}
