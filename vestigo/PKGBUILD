pkgname=vestigo
pkgver=4.d0774a7
pkgrel=1
pkgdesc="Modern, lightweight and simple file manager"
arch=('i686' 'x86_64')
url="https://github.com/alphaos/testing"
license=('GPL')
depends=('dconf' 'desktop-file-utils' 'hicolor-icon-theme' 'gtk3' 'libgee' 'poppler-glib')
makedepends=('vala' 'git')
source=($pkgname::git+https://github.com/alphaos/testing)
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$srcdir"/$pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir"/$pkgname/$pkgname
  make DESTDIR="$pkgdir/" install
}
