# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=simutrans-pak64-svn
pkgver=333
pkgrel=1
pkgdesc="A freeware transportation simulator (game data)."
arch=('i686' 'x86_64')
url="http://www.simutrans.com/"
license=('custom')
depends=('simutrans')
makedepends=('subversion' 'simutrans')
source=(buildsystem.patch)
md5sums=('bd527a945aaf6898449a0c2af548f039')

_svntrunk=https://simutrans.svn.sourceforge.net/svnroot/simutrans/pak64
_svnmod=simutrans-pak64
_revnumber=$pkgver

build() {
  cd "$srcdir"

  msg "Connecting to $_svntrunk..."

  if [[ -d $_svnmod ]] ; then
    cd $_svnmod
    svn up -r $_revnumber || return 1
    cd ..
    msg "The local files are updated."
  else
    svn co -r $_revnumber $_svntrunk $_svnmod || return 1
  fi

  msg "SVN checkout done"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  patch -p1 < ../buildsystem.patch || return 1

  make all || return 1

  make PAKDIR=$pkgdir/usr/share/simutrans/pak copy || return 1

  install -D -m644 "licence.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}
