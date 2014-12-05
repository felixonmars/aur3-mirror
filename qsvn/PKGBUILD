# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=qsvn
pkgver=0.8.3
pkgrel=4
pkgdesc="Qt4 GUI for Subversion."
arch=('i686' 'x86_64')
url="http://anrichter.github.io/qsvn/"
license=('GPL')
depends=('qt4' 'subversion')
makedepends=('cmake' 'patch')
source=(https://github.com/anrichter/$pkgname/archive/$pkgname-$pkgver.tar.gz
        lib64-fix.patch)
sha256sums=('ba177cc9db96fd5328eb97ffa0e586542cd417e59b897a6802efecb077805a66'
            '6a2787b5852825aaccd50ad7b20983af859378d86b86aaf550bf4e1bfcc96c3e')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver/src

  patch -Np2 -i "${srcdir}"/lib64-fix.patch
}

build() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver/src

  cmake -G "Unix Makefiles" -D CMAKE_INSTALL_PREFIX=/usr/ -D CMAKE_BUILD_TYPE="Release" ../src
#  cmake -D CMAKE_INSTALL_PREFIX=/usr/ -D CMAKE_BUILD_TYPE="Release" ../src
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver/src

  make DESTDIR="${pkgdir}" install

#desktop file
  install -Dm644 "${srcdir}"/$pkgname-$pkgver/src/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
