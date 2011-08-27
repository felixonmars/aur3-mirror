# Contributor: Andrew Gallant <andrew@pytyle.com>
# Maintainer: Andrew Gallant
pkgname=xpybutil
pkgver=20110811
pkgrel=1
pkgdesc="An incomplete xcb-util port plus some extras"
arch=('any')
url="http://pytyle.com"
license=('GPL')
groups=()
makedepends=('git')
depends=('python2>=2.7' 'xpyb-git')
optdepends=('python-imaging')
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/BurntSushi/xpybutil.git"
_gitname=xpybutil
_gitbranch="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d "$srcdir/$_gitname-build" ]; then
    rm -r "$srcdir/$_gitname-build"
  fi
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Clone finished, checking out branch $_gitbranch"
  git checkout $_gitbranch

  python2 ./setup.py install --root=$pkgdir || return 1
}
