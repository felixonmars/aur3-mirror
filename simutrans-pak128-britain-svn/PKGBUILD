# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=simutrans-pak128-britain-svn
pkgver=329
pkgrel=1
pkgdesc="A freeware transportation simulator (game data)."
arch=('i686' 'x86_64')
url="http://www.simutrans.com/"
license=('custom')
depends=('simutrans')
makedepends=('subversion' 'simutrans' 'moscript')
source=(parameter.patch)
md5sums=('87b3c9d5494256c969850c5a292ed1a6')

_svntrunk=https://simutrans.svn.sourceforge.net/svnroot/simutrans/pak128.Britain
_svnmod=simutrans-pak128-britain
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

  msg "Patching..."
  patch -p1 < ../parameter.patch || return 1

  _pkgdir_escaped=`echo $pkgdir | sed 's/\\//\\\\\\//g'`
  sed --in-place "s/\/home\/james/$_pkgdir_escaped\/usr\/share/" parameter.mos || return 1

  mkdir -p "$pkgdir/usr/share/simutrans/"
  mose.py -x makeALL.mos || return 1

  install -D -m644 "licence.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}
