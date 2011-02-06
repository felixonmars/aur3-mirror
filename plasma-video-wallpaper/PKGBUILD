#CONTRIBUTOR: Zephyr

pkgname=plasma-video-wallpaper
pkgver=1.7
pkgrel=1
pkgdesc="Play video as wallpaper in Plasma"
url="http://www.kde-look.org/content/show.php/Animated+Video+Wallpaper?content=112105"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'ffmpeg')
makedepends=('cmake' 'automoc4')
conflicts=()
provides=()
source=("http://www.kde-look.org/CONTENT/content-files/112105-${pkgname}.tar.gz")
md5sums=('392d278419b63cb0b35dc450f8690a76')

build() {
  cd ${srcdir}/${pkgname}

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
# vim:syntax=sh
