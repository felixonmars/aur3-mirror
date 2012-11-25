# Maintainer: Daniel Micay <danielmicay@gmail.com>

pkgname=python-libgit2
pkgver=0.17.3
pkgrel=1
pkgdesc='Python bindings for libgit2 (pygit2)'
url="https://github.com/libgit2/pygit2"
depends=('python' 'libgit2' 'openssl' 'zlib')
makedepends=('git')
arch=('any')
license=('GPL2')

__gitroot='https://github.com/libgit2/pygit2.git'
__gitname='pygit2'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $__gitname ] ; then
    cd $__gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $__gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$__gitname-build"
  git clone "$srcdir/$__gitname" "$srcdir/$__gitname-build"
  cd "$srcdir/$__gitname-build"

  git checkout v$pkgver

  python setup.py build
}

package() {
  cd "$srcdir/$__gitname-build"
  python setup.py install --root=${pkgdir} --optimize=1
}
