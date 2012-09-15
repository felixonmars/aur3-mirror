# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname='python-bunsan.pm-git'
pkgver=20120613
pkgrel=1
pkgdesc="bunsan pm python wrapper"
arch=('i686' 'x86_64')
url="https://github.com/sarum9in/bunsan_pm_python"
license=('GPL')
groups=()
depends=('python-bunsan.common-git' 'bunsan.pm-git' 'cython')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/sarum9in/bunsan_pm_python.git"
_gitname="pm_python"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  python setup.py build_ext -Lbuild
  python setup.py build
}

check() {
  cd "$srcdir/$_gitname-build/build"
  #make test
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
}
