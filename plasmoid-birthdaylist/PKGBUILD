pkgname=plasmoid-birthdaylist
pkgver=0.7.1
pkgrel=1
pkgdesc="BirthdayList plasmoid shows a sorted list of coming birthdays, namedays and anniversaries from the KDE Address Book or the selected Akonadi collection."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Birthday+List?content=121134"
license=('GPL')
depends=('kdebase-workspace>=4.3.0')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/121134-birthdaylist-$pkgver-1.tar.gz)
md5sums=('201309a1fbed00dcabceb5a306f213d8')

build() {
  cd $startdir/src/birthdaylist-$pkgver-1/
  mkdir applet/build
  cd applet/build/
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make || return 1
  make DESTDIR=$pkgdir install

  cd $startdir/src/birthdaylist-$pkgver-1/
  mkdir dataengine-default/build
  cd dataengine-default/build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make || return 1
  make DESTDIR=$pkgdir install

  cd $startdir/src/birthdaylist-$pkgver-1/
  mkdir dataengine-akonadi/build
  cd dataengine-akonadi/build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make || return 1
  make DESTDIR=$pkgdir install
}
