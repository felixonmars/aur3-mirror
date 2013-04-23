# Contributor: nem <nem@ikitten.co.uk>

_pkgname=owl-wb
pkgname=owl-browser-git
pkgver=0.16.2551bc2
pkgrel=1
pkgdesc="Lightweight webkit browser" 
url="https://github.com/andreas-volker/owl-wb"
arch=('i686' 'x86_64')
license=('MIT')
depends=('webkitgtk2' 'gtk2')
makedepends=('git')
source=('git://github.com/andreas-volker/owl-wb.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd $srcdir/$_pkgname
  make VERSION_SUFFIX="-git"
}

package() {
  cd $srcdir/$_pkgname
  make VERSION_SUFFIX="-git" \
       PREFIX=$pkgdir/usr \
       ETCDIR=$pkgdir/etc install
}
