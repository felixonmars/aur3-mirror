# Maintainer: Tasos Latsas <tlatsas2000 at gmail dot com>

pkgname=django-pagination-git
pkgver=20110808
pkgrel=2
pkgdesc="A set of utilities for creating robust pagination tools throughout a django application"
arch=('any')
url="https://launchpad.net/linaro-django-pagination"
license=('BSD')
depends=('python2-django')
makedepends=('git')
conflicts=('')
md5sums=()
install=django-pagination-git.install

_gitroot="git://github.com/zyga/django-pagination.git"
_gitname="django-pagination"

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
}
