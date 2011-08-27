# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
#
# Suggestions for improvement welcome.
#
# History
#
# 2220-1 : 4th July 2009 : Updated
# 2188-1 : 8th June 2009 : First upload to AUR 
#

pkgname=xbmc-skin-connected-svn
pkgver=2220
pkgrel=1
pkgdesc="Connected skin for XBMC"
arch=('i686' 'x86_64')
url="http://xbmc.org/forum/showthread.php?t=39534"
source=()
depends=('xbmc')
makedepends=('subversion')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=()
options=()

build() {
    _svntrunk=http://xboxmediacenter.svn.sourceforge.net/svnroot/xboxmediacenter/Connected
    _svnmod=Connected

    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done or server timeout"

    cd "$srcdir/$_svnmod"

    msg 'Locating XBMCTex...'
    if [ -x "/usr/bin/XBMCTex" ]; then
      msg "XBMCTex in /usr/bin"
    elif [ -x "/usr/share/xbmc/tools/xbmctex" ]; then
      msg "XBMCTex is in /usr/share/xbmc/tools but not in /usr/bin"
      msg "modifying Build.sh to look for XBMCTex there instead...."
      sed -i 's|/usr/bin/XBMCTex|/usr/share/xbmc/tools/xbmctex|g' ./Build.sh
    else
      msg "XBMCTex can not be found!! Aborting"
      return 1
    fi

    chmod +x ./Build.sh
    msg "Please wait while XBMCTex builds the skin for you..."
    ./Build.sh || return 1

    mkdir -p $pkgdir/usr/share/xbmc/skin
    cp -r $startdir/src/$_svnmod/BUILD/$_svnmod $pkgdir/usr/share/xbmc/skin/$_svnmod
}
