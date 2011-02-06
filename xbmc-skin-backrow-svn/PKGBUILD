# Contributor: Berseker <berseker at gmail dot com>
pkgname=xbmc-skin-backrow-svn
pkgver=2693
pkgrel=1
pkgdesc="Backrow Skin for XBMC - SVN version"
arch=('any')
url="http://forum.xbmc.org/showthread.php?t=63773"
license=('GPL')
groups=()
depends=('xbmc')
makedepends=('subversion')
provides=('xbmc-skin-backrow')
replaces=('xbmc-skin-backrow')
conflicts=('xbmc-skin-backrow')

_svntrunk=http://xboxmediacenter.svn.sourceforge.net/svnroot/xboxmediacenter/Back-Row/
_svnmod=Back-Row

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

 mkdir -p "$pkgdir/usr/share/xbmc/skin"
 cp -r "$srcdir/$_svnmod" "$pkgdir/usr/share/xbmc/skin"

}
