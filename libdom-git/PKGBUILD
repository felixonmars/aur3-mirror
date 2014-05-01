# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=libdom-git
pkgver=r533.db5517f
pkgrel=1
pkgdesc='Library for working with the W3C DOM'
arch=('x86_64' 'i686')
url='http://www.netsurf-browser.org/projects/libdom/'
license=('MIT')
depends=('libparserutils')
makedepends=('git' 'libwapcaplet' 'libparserutils' 'libhubbub')
provides=('libdom')
conflicts=('libdom-svn' 'libdom')
source=('git://git.netsurf-browser.org/libdom.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname/-git}"

  export CFLAGS="$CFLAGS -fPIC -fno-strict-aliasing -Wno-unused-but-set-variable" 
  make LIBDIR=lib NSSHARED='/usr/share/netsurf-buildsystem' PREFIX=/usr COMPONENT_TYPE="lib-shared"
}

package() {
  cd "${pkgname/-git}"

  make \
    NSSHARED='/usr/share/netsurf-buildsystem' \
    PREFIX="/usr" \
    DESTDIR="$pkgdir/" \
    COMPONENT_TYPE="lib-shared" \
    install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
