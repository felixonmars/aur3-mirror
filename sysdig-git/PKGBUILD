# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
pkgname=sysdig-git
pkgver=r2233.01cd468
pkgrel=1
pkgdesc="Open source system-level exploration and troubleshooting tool"
arch=('i686' 'x86_64')
url="http://www.sysdig.org/"
license=('GPL2')
depends=('linux-headers' 'dkms' 'jsoncpp' 'luajit' 'zlib' 'ncurses')
makedepends=('git' 'gcc'
             'make' 'cmake'
             'linux-headers')
conflicts=('sysdig')
provides=('sysdig')
source=("$pkgname"::'git+https://github.com/draios/sysdig.git')
md5sums=('SKIP')
install="sysdig-git.install"

pkgver() {
  cd "$srcdir/$pkgname"
  # git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSDIG_VERSION="${pkgver}" -DDIR_ETC=/etc \
      -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_JSONCPP=OFF -DUSE_BUNDLED_ZLIB=OFF \
      -DUSE_BUNDLED_NCURSES=OFF ..
  make
}

package() {
  cd "$srcdir/$pkgname"
  cd build
  make DESTDIR="$pkgdir/" install
}
