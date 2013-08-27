# Contributor: mosra <mosra@centrum.cz>

pkgname=svn2git-git
_gitname=svn2git
pkgver=1.0.5.23.g539de03
pkgrel=1
pkgdesc="A fast-import based converter for an svn repo to git repos."
arch=('i686' 'x86_64')
url="http://gitorious.org/svn2git"
license=('GPLv2')
groups=()
depends=('subversion' 'qt4' 'git')
optdepends=('svneverever-git: for collecting path entries across SVN history')
makedepends=()
source=('git://gitorious.org/svn2git/svn2git.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  qmake "INCLUDEPATH+=/usr/include/apr-1/"
  make || return 1
}

package() {
  cd $_gitname
  install -m755 -D -s svn-all-fast-export "$pkgdir/usr/bin/svn2git"
  install -m755 -d "$pkgdir/usr/share/svn2git/"
  install -m644 -t "$pkgdir/usr/share/svn2git/" samples/*
}
