# Maintainer: mimas <mimasgpc@free.fr>

_pkgname=gdk-pixbuf-webp
pkgname=$_pkgname-git
pkgver=20120602.25
pkgrel=1
pkgdesc="A GdkPixbuf loader for the WebP file format"
arch=('i686' 'x86_64')
url="https://github.com/aruiz/webp-pixbuf-loader"
license=('GPL')
depends=('gdk-pixbuf2' 'libwebp')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/aruiz/webp-pixbuf-loader.git")
md5sums=('SKIP')
install=pixbuf-loader.install

pkgver() {
  cd $_pkgname
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd $_pkgname
  ./waf configure
  ./waf build
}

package() {
  cd $_pkgname
  ./waf install --destdir="$pkgdir"
}
