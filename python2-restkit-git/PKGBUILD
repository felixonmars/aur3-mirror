# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=python2-restkit-git
pkgver=20110403
pkgrel=1
pkgdesc="Restkit is an HTTP resource kit for Python. It allows you to easily access to HTTP resource and build objects around it."
arch=('any')
url="http://benoitc.github.com/restkit/index.html"
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-distribute')
provides=('python2-restkit')
conflicts=('python2-restkit')

_gitroot="http://github.com/benoitc/restkit.git"
_gitname="restkit"

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
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
} 
