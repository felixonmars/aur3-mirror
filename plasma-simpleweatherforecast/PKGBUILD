# Contributor: Lucio Zara <pennega@gmail.com>

pkgname=plasma-simpleweatherforecast
pkgver=1.3
pkgrel=1
pkgdesc="One more weather plasmoid but with forecast for next 2 days, icon support for the next 2 days, high & low temperature"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/weatherforecast?content=92149"
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('')
source=(http://kde-look.org/CONTENT/content-files/92149-simpleweatherforecast-$pkgver.tar.gz)
license=('GPL')
md5sums=('969c441932123914aac74ce64c883896')

build() {
  cd $srcdir/$pkgname-$pkgver-kde-4.3.80
  ./install
  cd build
  make DESTDIR=$pkgdir install
}
