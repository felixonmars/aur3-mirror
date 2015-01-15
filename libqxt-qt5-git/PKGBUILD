# Maintainer: ant32 <antreimer@gmail.com>

pkgname=libqxt-qt5-git
pkgver=0.7.r2125.696423b
pkgrel=1
pkgdesc="provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit"
arch=('i686' 'x86_64')
url="http://www.libqxt.org"
license=('CPL')
depends=('qt5-base' 'qt5-tools' 'openssl' 'db' 'avahi')
makedepends=('git')
source=('git+https://bitbucket.org/libqxt/libqxt.git'
        'qt5-fixstatic-const.patch')

md5sums=('SKIP'
         '7831eb78574c137bc016b462bd29ec7f')

pkgver() {
  cd "$srcdir/libqxt"
  printf "0.7.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|-lXrandr|-lXrandr -lX11|g' -i "${srcdir}/libqxt/config.tests/xrandr/xrandr.pro"
  
  patch -p0 -i "${srcdir}/qt5-fixstatic-const.patch"
}

build() {
  cd "$srcdir/libqxt"
  # -qws is a workaround and disables x11 stuff http://dev.libqxt.org/libqxt/issue/38/another-linux-build-issue
  ./configure -qmake-bin "/usr/bin/qmake-qt5" -qws \
   -libdir /usr/lib
  make
}

package() {
  cd "${srcdir}/libqxt"
  make INSTALL_ROOT="${pkgdir}" install
}
