# Contributor: Berseker <berseker86 at gmail dot com>
pkgname=xbmc-skin-serenity-svn
pkgver=28
pkgrel=3
pkgdesc="Serenity Skin SVN Version - to use with XBMC-svn"
arch=('any')
url="http://forum.xbmc.org/showthread.php?t=48791"
license=('GPL')
groups=()
depends=(xbmc-svn)
makedepends=('subversion')
provides=('xbmc-skin-serenity')
replaces=('xbmc-skin-serenity')
conflicts=('xbmc-skin-serenity')
backup=()
options=()

_svntrunk=http://xbmcserenity.googlecode.com/svn/trunk/ 
_svnmod=Serenity

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

 mkdir -p "$pkgdir/usr/share/xbmc/skin/"
 cp -r "$srcdir/$_svnmod" "$pkgdir/usr/share/xbmc/skin/"

}
