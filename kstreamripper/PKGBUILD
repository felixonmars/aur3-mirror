# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kstreamripper
pkgver=0.7.100
pkgrel=1
pkgdesc='A program for recording Internet radios and other streams.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.kde-apps.org/content/show.php?content=78068'
depends=('kdelibs' 'streamripper' 'libproxy')
makedepends=('cmake' 'automoc4')
install=kstreamripper.install
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('cd4cc34620c7b6c373aea60c3d34dc8c')

build() {
  mkdir build
  cd build

  cmake ../"$pkgname" \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

