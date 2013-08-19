# Maintainer: perlawk
pkgname=pyalgotrade-git
pkgver=0.12
pkgrel=1
pkgdesc="Python algorithmic trading library."
arch=(any)
url="https://github.com/gbeced/pyalgotrade"
license=('GPL')
groups=()
depends=('python2' 'python2-numpy' 'python2-pytz' 'python2-matplotlib')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot=https://github.com/gbeced/pyalgotrade
_gitname=pyalgotrade

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
