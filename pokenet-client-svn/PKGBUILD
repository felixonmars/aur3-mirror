# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=pokenet-client-svn
pkgver=LATEST
pkgrel=1
pkgdesc="PokeNet 2D MMORPG Game"
arch=(i686 x86_64)
url="http://code.google.com/p/pokenetonline/"
license=('GPL')
depends=(java-environment)
makedepends=('subversion')
provides=(pokenetonline)
source=(pokenet-client pokenet-client.desktop)
md5sums=('a745431ebd8ddb5fe530d967bdd78656'
         'f2f3c457d4bfef2b88919f5df57b8159')
options=(!strip)

_svntrunk=http://pokenetonline.googlecode.com/svn/trunk/Client
_svnmod=Client

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmode
    svn update
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/${_svnmod}/* ${pkgdir}/opt/${pkgname}/
  install -Dm755 ${srcdir}/pokenet-client ${pkgdir}/usr/bin/pokenet-client
  install -Dm655 ${srcdir}/Client/res/ui/pokeball.png ${pkgdir}/usr/share/pixmaps/pokenet-client.png
  install -Dm655 ${srcdir}/pokenet-client.desktop ${pkgdir}/usr/share/applications/pokenet-client.desktop
}
