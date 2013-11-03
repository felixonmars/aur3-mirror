# Mantainer: M0Rf30

pkgname=gfreenect-git
pkgver=80.939a581
pkgrel=1
pkgdesc="A wrapper for the Freenect library"
arch=('i686' 'x86_64')
url="https://github.com/elima/GFreenect"
license=('GPL')
depends=('libfreenect-git' 'gobject-introspection')
makedepends=('git' 'gtk-doc')
source=("gfreenect::git://github.com/elima/GFreenect.git")

build() {
  cd gfreenect
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
 
package() {
  cd gfreenect
  make DESTDIR=${pkgdir} install
}

pkgver() {
  cd gfreenect
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
