# Contributor: Team Pantheon <maintainer@team-pantheon.de>

pkgname=rastullah-modules-svn
pkgver=4865
pkgrel=3
pkgdesc="Game modules for 'Rastullahs Lockenpracht' (rastullah)"
url="http://www.rastullahs-lockenpracht.de"
arch=('i686' 'x86_64')
license=('custom')
depends=('rastullah-svn')
makedepends=('subversion')

source=()
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/dsa-hl/modules
_svnmod=rastullah-modules

build() {

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
    cd $_svnmod
  fi

  msg "SVN checkout done."
  
  mkdir -p $pkgdir/usr/share
  svn export . $pkgdir/usr/share/rastullah

  mkdir -p $pkgdir/usr/share/licenses/rastullah
  install -m 644 $startdir/LICENSE_ARTS.TXT $pkgdir/usr/share/licenses/rastullah/

}
# vim:syntax=sh
