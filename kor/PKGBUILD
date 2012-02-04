# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kor
pkgver=0.3.2
pkgrel=1
pkgdesc="Kor is an implementation of a desktop workspace"
arch=('x86_64' 'i686')
url="http://kde-apps.org/content/show.php?content=126302"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://kde-apps.org/CONTENT/content-files/126302-$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CXXFLAGS="-w"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('32b08e716403e94837a03103b2076afb')
