# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=kde-plasma-scripted-image
pkgver=0.2
pkgrel=1
pkgdesc="KDE 4 plasmoid to script wallpaper changes"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Scripted+Image+Wallpaper+Plugin?content=115147"
license=('GPL3')
depends=('kdebase-workspace>=4.2.91')
makedepends=('cmake')
install="$pkgname.install"
source=('http://kde-look.org/CONTENT/content-files/115147-scripted-image-wallpaper-plugin-0.2.tar.gz')
md5sums=('e9d4658e0b9e1437334f2af5a0e2940c')


build() {

  # Build
  cd "$srcdir/scripted-image-wallpaper-plugin"
  [ -d build ] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../src/ || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install

}
