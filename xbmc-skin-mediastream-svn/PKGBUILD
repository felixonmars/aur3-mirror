# Contributor: Ralf Barth <archlinux dot or at haggy dot org>

pkgname=xbmc-skin-mediastream-svn
pkgver=2515
pkgrel=1
pkgdesc="MediaStream skin for XBMC"
arch=('i686' 'x86_64')
url="http://www.teamrazorfish.co.uk/mediastream.html"
source=('buildskript.diff')
depends=('xbmc')
makedepends=('subversion' 'patch')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=('69668b9603f73d7951016ebcc31f3e24')
options=()

# Having these outside of the build() means the pkgver gets updated.
_svntrunk=http://xboxmediacenter.svn.sourceforge.net/svnroot/xboxmediacenter/MediaStream/
_svnmod=MediaStream

build() {
    ##Checkout or update source tree
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done or server timeout"

    cd "$srcdir/$_svnmod"
    patch -p0 < ../../buildskript.diff

    msg 'locating TexturePacker...'
    if [ -e "/usr/bin/TexturePacker" ]; then
      msg "TexturePacker in /usr/bin"
    elif [ -e "/usr/share/xbmc/TexturePacker" ]; then
      msg "TexturePacker is in /usr/share/xbmc but not in /usr/bin"
      msg "modifying build.sh to look for TexturePacker there instead...."
      sed -i 's|/usr/bin/TexturePacker|/usr/share/xbmc/TexturePacker|g' ./build.sh
    else
      msg "TexturePacker can not be found!! Aborting"
      return 1
    fi

    chmod +x ./build.sh
    msg "Please wait while TexturePacker builds the skin for you..."
    ./build.sh || return 1

    ##Copy tree to share location
    mkdir -p $pkgdir/usr/share/xbmc/skin
    cp -r $startdir/src/$_svnmod/BUILD/$_svnmod $pkgdir/usr/share/xbmc/skin/$_svnmod
}
