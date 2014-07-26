# Maintainer: Victor Aurélio <victoraur.santos@gmail.com>
pkgname=tinyxml2-git
pkgver=0.0.0
pkgrel=1
pkgdesc="is a simple, small, efficient, C++ XML parser that can be easily integrated into other programs."
arch=('i686' 'x86_64')
url="http://www.grinninglizard.com/tinyxml2/"
license=('zlib')
makedepends=('git')
source=("$pkgname"::'git://github.com/leethomason/tinyxml2.git')
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$pkgdir"

    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
