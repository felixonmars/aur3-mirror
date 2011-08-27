# Contributor: William DÃ­az <wdiaz@archlinux.us>

pkgname=amsn-skin-sapphire
pkgver=74
pkgrel=1
pkgdesc="aMSN Sapphire 2.5 Skin"
url="http://artistic.lnxteam.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('amsn' 'python')
optdepends=('zenity: For plugin Desktop Integration')
makedepends=('subversion')
source=()
md5sums=()

_svnmod="Sapphire-2.5"
_svntrunk="svn://svn.tuxfamily.org/svnroot/amsnskins/amsnskins/trunk/Sapphire/2.5/new-skin/"


build() {
  cd ${srcdir}
  mkdir -p ~/.subversion; touch ~/.subversion/servers
  msg "Connecting to SVN server...."
  svn co ${_svntrunk} ${_svnmod} 
  cd ${_svnmod}

  msg "SVN checkout done or server timeout"

  # install

  cd $startdir/src/

  mkdir -p $startdir/pkg/usr/share/amsn/skins
  cp -R $_svnmod $startdir/pkg/usr/share/amsn/skins

  # remove nasty files
  find ${pkgdir} -name ".svn" -type d -exec rm -fr {} +

}

