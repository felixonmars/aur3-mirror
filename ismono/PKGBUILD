# Maintainer: André von Kugland <kugland@gmail.com>
pkgname=ismono
pkgver=r4.72ff9c3
pkgrel=1
pkgdesc="Returns the mean square of the difference of right and left channel of a stereo audio file, useful to differentiate mono and stereo files."
arch=('x86_64' 'i686')
url="https://github.com/kugland/ismono"
license=('MIT')
groups=()
depends=('libsndfile')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('ismono::git+https://github.com/kugland/ismono.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ismono"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  make ismono
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  cp ismono "$pkgdir/usr/bin/ismono"
}
