# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname='python-bunsan.common-git'
pkgver=20120915
pkgrel=1
pkgdesc="bunsan root python package"
arch=('i686' 'x86_64')
url="https://github.com/sarum9in/bunsan_common_python"
license=('GPL')
groups=()
depends=('python' 'bunsan.common-git')
makedepends=('git' 'python')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

#_gitroot="git://cs.istu.ru/bunsan_common_python.git"
_gitroot="git://github.com/sarum9in/bunsan_common_python.git"
_gitname="common_python"

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
