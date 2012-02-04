# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=moscript-svn
pkgver=17
pkgrel=1
pkgdesc="MOSE MakeObj Script Engine is a scripting engine for the Simutrans Tool makeobj."
arch=('i686' 'x86_64')
url="http://moscript.sf.net/"
license=('GPL')
depends=('python')
makedepends=('subversion')
provides=('moscript')
conflicts=('moscript')
source=()
md5sums=()

_svntrunk=https://moscript.svn.sourceforge.net/svnroot/moscript/trunk
_svnmod=moscript
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

  sed -i 's/$//' *.py

  install -D -m755 "mose.py" "$pkgdir/usr/bin/mose.py" || return 1
  install -D -m755 "makeobj.py" "$pkgdir/usr/bin/makeobj.py" || return 1
}

