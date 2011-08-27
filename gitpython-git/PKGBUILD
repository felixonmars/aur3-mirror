# Contributor: scj <scj archlinux us>
# Contributor: giniu <gginiu@gmail.com>
# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=gitpython-git
pkgver=20110208
pkgrel=1
pkgdesc="A python library used to interact with Git repositories"
arch=('i686' 'x86_64')
url="http://gitorious.org/projects/git-python/"
license=('BSD')
depends=('git>=1.7.0.0' 'python-gitdb')
makedepends=('git' 'python-sphinx' 'python-distribute')
source=()
md5sums=()

_gitroot="git://gitorious.org/git-python/mainline.git"
_gitname="mainline"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir"/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir"/$_gitname-build
  cp -r "$srcdir"/$_gitname "$srcdir"/$_gitname-build
  cd "$srcdir"/$_gitname-build

  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licences/gitpython/LICENSE
  mkdir doc/static
  (cd doc; make html) || return 1
  mkdir -p $pkgdir/usr/share/doc/gitpython
  cp -r doc/build/html/* $pkgdir/usr/share/doc/gitpython
} 
# vim:set ts=2 sw=2 sts=2 et:
