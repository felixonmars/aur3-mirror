pkgname=kde4-favorites-launcher
pkgver=0.2
pkgrel=2
pkgdesc="With this plugin you can configure a mouse button click to invoke a menu with your favorite applications"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Favorites+Launcher?content=117639"
source=(http://kde-apps.org/CONTENT/content-files/117639-containmentaction-favorites-0.2.tar.gz)
license=('LGPL')
md5sums=('bbd19ad516d7ca3181a181e7c7f2366a')

build() {
  cd "${srcdir}/containmentaction-favorites-${pkgver}"

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
  make DESTDIR=${pkgdir} install
}