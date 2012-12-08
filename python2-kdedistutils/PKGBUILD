# Maintainer: Daniel Nagy <danielnagy@gmx.de>
pkgname=python2-kdedistutils
pkgver=20121208
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/lunaryorn/kdedistutils"
license=('BSD')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('setup.py')
noextract=()
md5sums=('aee5241b4bd8891caa53ae15c1cdbd4c')

_gitroot="$url"
_gitname="$pkgname"

build() {
  # cd "$srcdir/$pkgname-$pkgver"
  msg2 "Connecting to GIT server..."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg2 "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname-$pkgver"
  fi
  msg2 "GIT checkout done or server timeout."
  
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ln -s ../setup.py
  python2 setup.py install --root="$pkgdir" --optimize=1
}
