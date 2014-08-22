pkgname=gmp-video
pkgver=167.250ee01
pkgrel=1
pkgdesc="A GTK+ interface for mpv"
arch=('i686' 'x86_64')
url="https://github.com/alphaos/build"
license=('GPL')
depends=('dconf' 'desktop-file-utils' 'hicolor-icon-theme' 'libmp-control' 'gtk3')
makedepends=('vala' 'git')
source=(alphaos::git+https://github.com/alphaos/build)
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$srcdir"/alphaos
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir"/alphaos/def-scripts/03_extra/$pkgname/$pkgname
  make DESTDIR="$pkgdir/" install
}
