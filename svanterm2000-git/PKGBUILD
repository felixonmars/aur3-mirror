# Maintainer: Jacques de Laval <chucky@wrutschkow.org>
pkgname=svanterm2000-git
pkgver=r1.0e2a569
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/SvanT/SvanTerm2000"
#license=('GPL')
groups=()
depends=('gtk3' 'gtkmm3' 'vte3-select-text>=0.37')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('SvanTerm2000::git+https://github.com/SvanT/SvanTerm2000.git')
noextract=()
md5sums=('SKIP')

_name=SvanTerm2000
_exe_name=svanterm

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name"

  install -D "$_exe_name" "$pkgdir/usr/bin/$_exe_name"
  install -Dm644 "$_exe_name.css" "$pkgdir/usr/share/svanterm/$_exe_name.css"
  install -Dm644 "$_exe_name.png" "$pkgdir/usr/share/svanterm/$_exe_name.png"
  ln -s "../share/svanterm/$_exe_name.css" "$pkgdir/usr/bin/$_exe_name.css"
  ln -s "../share/svanterm/$_exe_name.png" "$pkgdir/usr/bin/$_exe_name.png"
}

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
